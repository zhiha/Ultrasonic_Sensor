#include <argp.h>
#include <arpa/inet.h>
#include <linux/if_packet.h>
#include <net/if.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <unistd.h>
#include <stdlib.h>
#include <math.h>

#define MAX_ETHERNET_FRAME_SIZE 1514
#define MAX_ETHERNET_DATA_SIZE 1500

#define ETHERNET_HEADER_SIZE 14
#define ETHERNET_DST_ADDR_OFFSET 0
#define ETHERNET_SRC_ADDR_OFFSET 6
#define ETHERNET_TYPE_OFFSET 12
#define ETHERNET_DATA_OFFSET 14

#define MAC_BYTES 6
#define DATA_LENGTH 2

#define PI 3.14159265358979323846
#define DATA_BUFFER 750
// #define DATA_SUM 4800
#define MAX_LEVEL (65536*0.5)


/**
*   global parameters: to record some parameters without pass through functions
**/
int frame_size = 0;
int data_size = 0;
int flag_read = 0;
int file_data_size = 0;
int flag_sig = 0;
int data_index = 0;
int DATA_SUM = 4000;

/**
*   Print uint16 data into binary format
*   
*   Arguments
*       n: data to print
*
*   no returns
**/
void printf2(uint16_t n) {
    uint16_t i = 0;
    for(i = 0; i < 16; i++) {
        if(n & (0x8000) >> i) {
            printf("1");
        }else {
            printf("0");
        }
    }
    printf("\n");
}


/**
 *  Convert readable MAC address to binary format.
 *
 *  Arguments
 *      a: buffer for readable format, like "08:00:27:c8:04:83".
 *
 *      n: buffer for binary format, 6 bytes at least.
 *
 *  Returns
 *      0 if success, -1 if error.
 **/
int mac_aton(const char *a, unsigned char *n) {
    int matches = sscanf(a, "%hhx:%hhx:%hhx:%hhx:%hhx:%hhx", n, n+1, n+2,
                         n+3, n+4, n+5);

    return (6 == matches ? 0 : -1);
}


/**
 *  Fetch MAC address of given iface.
 *
 *  Arguments
 *      iface: name of given iface.
 *
 *      mac: buffer for binary MAC address, 6 bytes at least.
 *
 *      s: socket for ioctl, optional.
 *
 *  Returns
 *      0 if success, -1 if error.
 **/
int fetch_iface_mac(char const *iface, unsigned char *mac, int s) {
    // value to return, 0 for success, -1 for error
    int value_to_return = -1;

    // create socket if needed(s is not given)
    bool create_socket = (s < 0);
    if (create_socket) {
        s = socket(AF_INET, SOCK_DGRAM, 0);
        if (-1 == s) {
            return value_to_return;
        }
    }

    // fill iface name to struct ifreq
    struct ifreq ifr;
    strncpy(ifr.ifr_name, iface, 15);

    // call ioctl to get hardware address
    int ret = ioctl(s, SIOCGIFHWADDR, &ifr);
    if (-1 == ret) {
        goto cleanup;
    }

    // copy MAC address to given buffer
    memcpy(mac, ifr.ifr_hwaddr.sa_data, MAC_BYTES);

    // success, set return value to 0
    value_to_return = 0;

cleanup:
    // close socket if created here
    if (create_socket) {
        close(s);
    }

    return value_to_return;
}


/**
 *  Fetch index of given iface.
 *
 *  Arguments
 *      iface: name of given iface.
 *
 *      s: socket for ioctl, optional.
 *
 *  Returns
 *      Iface index(which is greater than 0) if success, -1 if error.
 **/
int fetch_iface_index(char const *iface, int s) {
    // iface index to return, -1 means error
    int if_index = -1;

    // create socket if needed(s is not given)
    bool create_socket = (s < 0);
    if (create_socket) {
        s = socket(AF_INET, SOCK_DGRAM, 0);
        if (-1 == s) {
            return if_index;
        }
    }

    // fill iface name to struct ifreq
    struct ifreq ifr;
    strncpy(ifr.ifr_name, iface, 15);

    // call ioctl system call to fetch iface index
    int ret = ioctl(s, SIOCGIFINDEX, &ifr);
    if (-1 == ret) {
        goto cleanup;
    }

    if_index = ifr.ifr_ifindex;

cleanup:
    // close socket if created here
    if (create_socket) {
        close(s);
    }

    return if_index;
}


/**
 * Bind socket with given iface.
 *
 *  Arguments
 *      s: given socket.
 *
 *      iface: name of given iface.
 *
 *  Returns
 *      0 if success, -1 if error.
 **/
int bind_iface(int s, char const *iface) {
    // fetch iface index
    int if_index = fetch_iface_index(iface, s);
    if (-1 == if_index) {
        return -1;
    }

    // fill iface index to struct sockaddr_ll for binding
    struct sockaddr_ll sll;
    bzero(&sll, sizeof(sll));
    sll.sll_family = AF_PACKET;
    sll.sll_ifindex = if_index;
    sll.sll_pkttype = PACKET_HOST;

    // call bind system call to bind socket with iface
    int ret = bind(s, (struct sockaddr *)&sll, sizeof(sll));
    if (-1 == ret) {
        return -1;
    }

    return 0;
}


/**
 * struct for an ethernet frame
 **/
struct ethernet_frame {
    // destination MAC address, 6 bytes
    unsigned char dst_addr[6];

    // source MAC address, 6 bytes
    unsigned char src_addr[6];

    // type, in network byte order
    unsigned short type;

    // unsigned int length;
    unsigned short length;      //contain information about length of data

    // data
    uint16_t data[DATA_BUFFER];
};


/**
 * struct for storing command line arguments.
 **/
struct arguments {
    // name of iface through which data is sent
    char const *iface;

    // destination MAC address
    char const *to;

    // data type
    unsigned short type;

    // data to send
    uint16_t *data;

    // center frequency 
    float freqC;

    // sample rate
    float sample_rate;

    float amplitude;  

    float bandwidth;

    float framelen;

    char *SinOrFmcw;

    unsigned short signEmit;
};


/**
 * opt_handler function for GNU argp.
 **/
static error_t opt_handler(int key, char *arg, struct argp_state *state) {
    struct arguments *arguments = state->input;
    FILE *fd = NULL;
    uint16_t *buff;
    
    switch(key) {
        //test function, caution!
        case 'd':
            data_size = strlen(arg);
            if (sscanf(arg, "%d", &arguments->data) != 1) {
                return ARGP_ERR_UNKNOWN;
            }
            break;

        case 'i':
            arguments->iface = arg;
            break;

        case 'T':
            if (sscanf(arg, "%hx", &arguments->type) != 1) {
                return ARGP_ERR_UNKNOWN;
            }
            break;

        case 't':
            arguments->to = arg;
            break;

        //test function, caution!
        case 'f':
            flag_read = 1;
            fd = fopen(arg,"r");
            fseek(fd, 0, SEEK_END);
            file_data_size = ftell(fd);
            fseek(fd, 0, SEEK_SET);
            buff = (uint16_t*)malloc(sizeof(uint16_t)*file_data_size);
            fread(buff, 1,file_data_size, fd);
            arguments->data = buff;
            break;
        
        //assign signal type to "sin" and scan the frequency of sin
        case 'S':
            flag_sig = 1;
            if (sscanf(arg, "%f", &arguments->freqC) != 1) {
                return ARGP_ERR_UNKNOWN;
            }
            break;
        
        //sample rate
        case 's':
            flag_sig = 1;
            if (sscanf(arg, "%f", &arguments->sample_rate) != 1) {
                return ARGP_ERR_UNKNOWN;
            }
            break;

        // float amp;  -M
        case 'M':
            if (sscanf(arg, "%f", &arguments->amplitude) != 1) {
                return ARGP_ERR_UNKNOWN;
            }
            break;

        // float bandwidth; -B
        case 'B':
            if (sscanf(arg, "%f", &arguments->bandwidth) != 1) {
                return ARGP_ERR_UNKNOWN;
            }
            break;

        // float framelen; -L
        case 'L':
            if (sscanf(arg, "%f", &arguments->framelen) != 1) {
                return ARGP_ERR_UNKNOWN;
            }
            break;
        
        // int SinOrFmcw;
        case 'J':
            arguments->SinOrFmcw = arg;
            break;

        // sign of emit
        case 'E':
            if (sscanf(arg, "%d", &arguments->signEmit) != 1) {
                return ARGP_ERR_UNKNOWN;
            }
            break;

        default:
            return ARGP_ERR_UNKNOWN;
    }

    return 0;
}


/**
 * Parse command line arguments given by argc, argv.
 *
 *  Arguments
 *      argc: the same with main function.
 *
 *      argv: the same with main function.
 *
 *  Returns
 *      Pointer to struct arguments if success, NULL if error.
 **/
static struct arguments *parse_arguments(int argc, char *argv[]) {
    // docs for program and options
    static char const doc[] = "send_ether: send data through ethernet frame";
    static char const args_doc[] = "";

    // command line options
    static struct argp_option const options[] = {
        // Option -i --iface: name of iface through which data is sent
        {"iface", 'i', "IFACE", 0, "name of iface for sending"},

        // Option -t --to: destination MAC address
        {"to", 't', "TO", 0, "destination mac address"},

        // Option -T --type: data type
        {"type", 'T', "TYPE", 0, "data type"},

        // Option -d --data: data to send, optional since default value is set
        {"data", 'd', "DATA", 0, "data to send"},

        // Option -f --file: read file and send
        {"file", 'f', "FILE", 0, "Read file and send"},

        // Option -S --SIN: send the sin waveform
        {"center frequency", 'S', "Center Frequency", 0, "Set Center Frequency"},

        // Option -s --sample rate: set the sample rate
        {"sample rate", 's', "SAMPLE RATE", 0, "Set the sample rate"},

        // Option -M -Signal Amplitude: Set the amp
        {"amplitude", 'M', "Signal Amplitude", 0, "Set the amp"},

        // Option -L -Signal framelen: Set the framelen
        {"framelen", 'L', "Signal Time", 0, "Set the frame len of signal"},

        // Option -B -Signal BandWidth: Set the BandWidth
        {"BandWidth", 'B', "Signal BandWidth", 0, "Set the BandWidth of signal"},

        // Option -J -Signal Type: Set the Type
        {"SinOrFmcw", 'J', "Signal Type", 0, "Set the Type of signal"},

        // Option -E -Sign of Emit 
        {"signEmit", 'E', "Sign of Emit", 0, "Set Sign of Emit"},

        { 0 }
    };

    static struct argp const argp = {
        options,
        opt_handler,
        args_doc,
        doc,
        0,
        0,
        0,
    };

    // for storing results
    static struct arguments arguments = {
        //default iface:eth0
        .iface = "eth0",
        //default to:11:22:33:44:55:66
        .to = "11:22:33:44:55:66",
        //default data type: 0x0900
        .type = 0x0900,
        // default data, 46 bytes string of 'a'
        // since for ethernet frame data is 46 bytes at least
        .data = NULL,
        .freqC = 4e4,
        .sample_rate = 48e5,
        .amplitude = 6553.6,
        .bandwidth = 30e3,
        .framelen = 1e-3,
        .SinOrFmcw = "Fmcw",
        .signEmit = 0,
    };

    argp_parse(&argp, argc, argv, 0, 0, &arguments);

    return &arguments;
}

/**
 * Print message about data
 *
 *  Arguments
 *      arguments: pointer to struct arguments
 *
 *      ret: will be -1 if send data failed and print error message.
 *
 *  Returns
 *      0 if success, 3 if error.
 **/
int print_mesg(struct arguments *arguments ,int ret) {
    if (-1 == ret) {
        perror("Fail to send ethernet frame: ");
        return 3;
    }else{
        if(!arguments->signEmit){
            printf("\n");
            printf("Send successfully!!!!!\n");
            printf("\n");
            printf("------------------------------------------------------\n");
            printf("Information of frame:\n");
            printf("------------------------------------------------------\n");
            printf("iface: %s\n",arguments->iface);
            printf("Destination: %s\n",arguments->to);
            printf("Signal: %8.2f Hz %s\n",arguments->freqC, arguments->SinOrFmcw);
            printf("Sample Rate: %8.2f Hz \n",arguments->sample_rate);
            printf("Signal Amplitude: %8.2f  \n",arguments->amplitude);
            printf("Signal BandWidth: %8.2f  \n",arguments->bandwidth);
            printf("Signal FrameTime: %8.4f  \n",arguments->framelen);
            printf("Size of data: %d bytes\n",data_size-2);
            printf("Size of frame: %d bytes\n",frame_size);
            printf("Size of total data: %d bytes\n",DATA_SUM*2);
            printf("------------------------------------------------------\n");
        }else{
            printf("\n");
            printf("Send successfully!!!!!\n");
            printf("\n");
            printf("------------------------------------------------------\n");
            printf("Information of frame:\n");
            printf("------------------------------------------------------\n");
            printf("\n");
            printf("Emit one pulse of FMCW\n");
            printf("\n");
        }
        
        return 0;
    }
}



/**
 * Write data into .bin files for checking
 *
 *  Arguments
 *      data: uint16_t data.
 *
 *  Returns
 *      No returns.
 **/
void write_data_signal_generating(uint16_t data[]) {

    FILE *fw = fopen("data_send.bin", "wb");
    for (int i = 0; i < DATA_SUM; i++)
    {   
        fwrite((data+i), sizeof(uint16_t), 1, fw);
    }

    fclose(fw);
}


/**
 * Generate waveform data and be ready to send
 *
 *  Arguments
 *      arguments: pointer to struct arguments.
 *
 *  Returns
 *      No return.
 **/

uint16_t * fmcw_generate(struct arguments *arguments) {
    //array and pointer to store the generated data
    float fc = arguments->freqC;//1e4; // fc 10k
    float B = arguments->bandwidth;//30e3; // B 30k
    float fs = arguments->sample_rate;//48e5; // 4.8M
    float T = arguments->framelen;//1e-3; 
    double S = B / T;
    double aver = arguments->amplitude;

    DATA_SUM = (int)(fs*T);

    uint16_t data[DATA_SUM];
    uint16_t data_eth[DATA_SUM];
    uint16_t *p = data_eth;

    unsigned int i = 0;     //index of frame data
    double I_temp = 0.0;
    uint16_t I_amp = 0;

    for(i = 0; i < DATA_SUM; i++) {

        I_temp = aver * cos(2*PI*fc*i/fs+PI*S*(i/fs)*(i/fs));

        int temp = (int)I_temp;
        I_amp = (uint16_t) temp;


        data[i] = I_amp;
        data_eth[i] = htons(I_amp);

        
    }
    //get the length of data (bytes)
    data_size = sizeof(data);
    printf("fmcw Data");
    //record the data of sending
    write_data_signal_generating(data);
    
    //return the pointer of array to next funcyions
    return p;
}

/**
 *  Send data through given iface by ethernet protocol, using raw socket.
 *
 *  Arguments
 *      iface: name of iface for sending.
 *
 *      to: destination MAC address, in binary format.
 *
 *      type: protocol type.
 *
 *      data: data to send.
 *
 *      s: socket for ioctl, optional.
 *
 *  Returns
 *      0 if success, -1 if error.
 **/
int send_ether(char const *iface, unsigned char const *to, short type,
        uint16_t *data, struct arguments *arguments, int s) {
    // value to return, 0 for success, -1 for error
    int value_to_return = -1;

    // pointer of data_generate
    uint16_t *p;
    int times_cut = 0;
    
    unsigned short typeTmp;
    int finishFlagDataSize = 2;
    uint16_t finishFlagData[finishFlagDataSize];
    uint16_t *finishFlagPoint = finishFlagData;


    // create socket if needed(s is not given)
    bool create_socket = (s < 0);
    if (create_socket) {
        s = socket(PF_PACKET, SOCK_RAW | SOCK_CLOEXEC, 0);
        if (-1 == s) {
            return value_to_return;
        }
    }

    // bind socket with iface
    int ret = bind_iface(s, iface);
    if (-1 == ret) {
        goto cleanup;
    }

    // fetch MAC address of given iface, which is the source address
    unsigned char fr[6];
    ret = fetch_iface_mac(iface, fr, s);
    if (-1 == ret) {
        goto cleanup;
    }

    // p = signal_generate(arguments);

    p = fmcw_generate(arguments);
    int res = DATA_SUM * 2;
    printf("DATA_SUM: %d \n",DATA_SUM);
    if(DATA_SUM>4800){
        printf("DATA_SUM must less than 4800, please adjust the sampling rate and frame len");
        goto cleanup;
    }

    
    times_cut = ceil(data_size / (double)(MAX_ETHERNET_DATA_SIZE-2));
    // fprintf("data size is %d ! \n",data_size);

    if (data_size > MAX_ETHERNET_DATA_SIZE) {
        data_size = MAX_ETHERNET_DATA_SIZE;
    }
    
    // fprintf("once send size is %d ! \n",(MAX_ETHERNET_DATA_SIZE-2));
    // printf("send time is %d ! \n",times_cut);

    // construct ethernet frame, which can be 1514 bytes at most
    struct ethernet_frame frame;

    // fill destination MAC address
    memcpy(frame.dst_addr, to, MAC_BYTES);

    // fill source MAC address
    memcpy(frame.src_addr, fr, MAC_BYTES);


    if(!arguments->signEmit){
        for(int i = 0; i < times_cut ; i++){
            printf("packet is sending ! \n");

            unsigned short typeTmp;
            typeTmp = 0x0a00;
            frame.type = htons(typeTmp);

            

            printf("res byte num is :  %d ! \n",res);
            
            if(res >= (MAX_ETHERNET_DATA_SIZE-2)){
                frame.length = htons(data_size-2);
                memcpy(frame.data, p, (data_size-2)*sizeof(char));
                res = res - (data_size-2);
                p = p + (data_size-2)/2;
            }else if(res > 0){
                frame.length = htons(res);
                memcpy(frame.data, p, res);
                res = 0;
            }


            frame_size = ETHERNET_HEADER_SIZE + data_size;

            ret = sendto(s, &frame, frame_size, 0, NULL, 0);
            if (-1 == ret) {
                goto cleanup;
            }

            usleep(500000);

        }

        printf("final packet is sending ! \n");

        finishFlagData[0] = 931;
        finishFlagData[1] = 931;

        typeTmp = 0x0b00;
        frame.type = htons(typeTmp);

        frame.length = htons(4);

        memcpy(frame.data, finishFlagPoint, finishFlagDataSize*sizeof(char)*2);

        frame_size = ETHERNET_HEADER_SIZE + finishFlagDataSize*2 + 2;

        ret = sendto(s, &frame, frame_size, 0, NULL, 0);
        if (-1 == ret) {
            goto cleanup;
        }
    }else{
        printf("emit sign is sending ! \n");

        finishFlagData[0] = 931;
        finishFlagData[1] = 931;

        typeTmp = 0x0c00;
        frame.type = htons(typeTmp);

        frame.length = htons(4);

        memcpy(frame.data, finishFlagPoint, finishFlagDataSize*sizeof(char)*2);

        frame_size = ETHERNET_HEADER_SIZE + finishFlagDataSize*2 + 2;

        ret = sendto(s, &frame, frame_size, 0, NULL, 0);
        if (-1 == ret) {
            goto cleanup;
        }
    }

    // set return value to 0 if success
    value_to_return = 0;

cleanup:
    // close socket if created here
    if (create_socket) {
        close(s);
    }

    return value_to_return;
}



int main(int argc, char *argv[]) {

    // parse command line options to struct arguments
    struct arguments *arguments = parse_arguments(argc, argv);
    if (NULL == arguments) {
        fprintf(stderr, "Bad command line options given\n");
        return 1;
    }

    // convert destinaction MAC address to binary format
    unsigned char to[6];
    int ret = mac_aton(arguments->to, to);
    if (0 != ret) {
        fprintf(stderr, "Bad MAC address given: %s\n", arguments->to);
        return 2;
    }
    arguments->data = (uint16_t*)malloc(sizeof(uint16_t)*DATA_BUFFER*2);

    ret = send_ether(arguments->iface, to, arguments->type,
                      arguments->data, arguments, -1);
    print_mesg(arguments, ret);

}
