#include <arpa/inet.h>
#include <linux/if_packet.h>
#include <linux/ip.h>
#include <linux/udp.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <netinet/ether.h>
#include <unistd.h>
#include <argp.h>

/*
Destination MAC : it should be defined accroding to situation
*/
#define DEST_MAC0	0xfa
#define DEST_MAC1	0x23
#define DEST_MAC2	0xaa
#define DEST_MAC3	0x60
#define DEST_MAC4	0x10
#define DEST_MAC5	0x6f

// #define DEST_MAC0	0x11
// #define DEST_MAC1	0x22
// #define DEST_MAC2	0x33
// #define DEST_MAC3	0x44
// #define DEST_MAC4	0x55
// #define DEST_MAC5	0x66

/* Default type of ethernet frame */
#define ETHER_TYPE	0x0900

#define DEFAULT_IF	"eth0"
#define BUF_SIZ		1509
#define DROP_SIZ   14
int FRAME_NUM = 10;
int FRAME_SIZE = BUF_SIZ-DROP_SIZ;

void printf2(uint8_t n) {
    uint8_t i = 0;
    for(i = 0; i < 8; i++) {
        if(n & (0x80) >> i) {
            printf("1");
        }else {
            printf("0");
        }
    }
    printf("\n");
}

void write_data_recv(uint8_t *data) {
    FILE *fw = fopen("data_recv.bin", "wb");
	for(int row = 0 ; row < FRAME_NUM ; row ++){
		for (int i = 0; i < FRAME_SIZE; i++)
		{   
			fwrite((data+i+row*FRAME_SIZE), sizeof(uint8_t), 1, fw);
		}
	}

    fclose(fw);
}

/**
 * struct for storing command line arguments.
 **/
struct arguments {
	int framenum;
};

/**
 * opt_handler function for GNU argp.
 **/
static error_t opt_handler(int key, char *arg, struct argp_state *state) {
    struct arguments *arguments = state->input;
    FILE *fd = NULL;
    uint16_t *buff;
    
    switch(key) {

		case 'c':
            if (sscanf(arg, "%d", &arguments->framenum) != 1) {
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
		
		{"frame num", 'c', "Set frame num", 0, "Set framenum"},

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
		.framenum = 10,
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
        perror("Fail to receive ethernet frame: ");
        return 3;
    }else{
		printf("\n");
		printf("Send successfully!!!!!\n");
		printf("\n");
		printf("------------------------------------------------------\n");
		printf("Information of frame:\n");
		printf("------------------------------------------------------\n");
		printf("Size of total data: %d bytes\n",arguments->framenum*FRAME_SIZE);
		printf("Frame Num: %d \n",arguments->framenum);
		printf("------------------------------------------------------\n");
        
        return 0;
    }
}

int main(int argc, char *argv[])
{
	struct arguments *arguments = parse_arguments(argc, argv);
    if (NULL == arguments) {
        fprintf(stderr, "Bad command line options given\n");
        return 1;
    }



	FRAME_NUM = arguments->framenum;

	int first_dimens = FRAME_NUM / 100;

	int row = 0;

	char sender[INET6_ADDRSTRLEN];
	int sockfd, ret, i;
	int sockopt;
	ssize_t numbytes;       /* numbers of bytes */
	struct ifreq ifopts;	/* set promiscuous mode */
	struct ifreq if_ip;	    /* get ip addr */
	struct sockaddr_storage their_addr;
	uint8_t buf[BUF_SIZ];   /* storage receive bytes frome socket*/
	uint8_t data_recv[first_dimens][100][FRAME_SIZE];	/* storage data after byte combination */
	char ifName[IFNAMSIZ];  /* which interface it receive */

    
	
	/* Get interface name (for paticular interface) */
	// if (argc > 1)
	// 	strcpy(ifName, argv[1]);
	// else
	// 	strcpy(ifName, DEFAULT_IF);

	strcpy(ifName, DEFAULT_IF);

	/* Header structures */
	struct ether_header *eh = (struct ether_header *) buf;
	struct iphdr *iph = (struct iphdr *) (buf + sizeof(struct ether_header));
	struct udphdr *udph = (struct udphdr *) (buf + sizeof(struct iphdr) + sizeof(struct ether_header));

	memset(&if_ip, 0, sizeof(struct ifreq));

	/* Open PF_PACKET socket, listening for EtherType ETHER_TYPE */

	// printf("open PF_PACKET socket fd:%d\n",sockfd);

	if ((sockfd = socket(PF_PACKET, SOCK_RAW, htons(ETHER_TYPE))) == -1) {
		perror("listener: socket");	
		return -1;
	}

	/* Set interface to promiscuous mode - Maybe it's useless to do this every time */

	// printf("set interface to p mode\n");

	strncpy(ifopts.ifr_name, ifName, IFNAMSIZ-1);
	ioctl(sockfd, SIOCGIFFLAGS, &ifopts);
	ifopts.ifr_flags |= IFF_PROMISC;
	ioctl(sockfd, SIOCSIFFLAGS, &ifopts);
    
	/* Allow the socket to be reused - incase connection is closed prematurely */
	if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &sockopt, sizeof sockopt) == -1) {
		perror("setsockopt");
		close(sockfd);
		exit(EXIT_FAILURE);
	}
	/* Bind to device */
	if (setsockopt(sockfd, SOL_SOCKET, SO_BINDTODEVICE, ifName, IFNAMSIZ-1) == -1)	{
		perror("SO_BINDTODEVICE");
		close(sockfd);
		exit(EXIT_FAILURE);
	}

repeat:	
    
    printf("listener: Waiting to recvfrom...\n");
	// printf("sockfd: %d\n",sockfd);

	numbytes = recvfrom(sockfd, buf, BUF_SIZ, 0, NULL, NULL);
	// printf("numbytes:%ld\n",numbytes);
	printf("listener: got packet %lu bytes\n", numbytes);

	/* Check the packet is for me */
	if (eh->ether_dhost[0] == DEST_MAC0 &&
			eh->ether_dhost[1] == DEST_MAC1 &&
			eh->ether_dhost[2] == DEST_MAC2 &&
			eh->ether_dhost[3] == DEST_MAC3 &&
			eh->ether_dhost[4] == DEST_MAC4 &&
			eh->ether_dhost[5] == DEST_MAC5) {
		printf("Correct destination MAC address\n");
	} else {
		printf("Wrong destination MAC: %x:%x:%x:%x:%x:%x\n",
						eh->ether_dhost[0],
						eh->ether_dhost[1],
						eh->ether_dhost[2],
						eh->ether_dhost[3],
						eh->ether_dhost[4],
						eh->ether_dhost[5]);
		ret = -1;
		goto done;
	}

	/* Get source IP */
	((struct sockaddr_in *)&their_addr)->sin_addr.s_addr = iph->saddr;
	inet_ntop(AF_INET, &((struct sockaddr_in*)&their_addr)->sin_addr, sender, sizeof sender);

	/* Look up my device IP addr if possible */
	strncpy(if_ip.ifr_name, ifName, IFNAMSIZ-1);
	if (ioctl(sockfd, SIOCGIFADDR, &if_ip) >= 0) { /* if we can't check then don't */
		printf("Source IP: %s\n My IP: %s\n", sender, 
				inet_ntoa(((struct sockaddr_in *)&if_ip.ifr_addr)->sin_addr));
		/* ignore if I sent it */
		if (strcmp(sender, inet_ntoa(((struct sockaddr_in *)&if_ip.ifr_addr)->sin_addr)) == 0)	{
			printf("but I sent it :(\n");
			ret = -1;
			goto done;
		}
	}

	/* UDP payload length */
	ret = ntohs(udph->len) - sizeof(struct udphdr);



	/* Print packet */
	// printf("\tData:\n");

	
    while(row < FRAME_NUM){
		for(i=0; i<(FRAME_SIZE); i++) {
			data_recv[row][i] = buf[DROP_SIZ + i];
		}
		row = row + 1;
		goto done;    
	}

	write_data_recv(&data_recv[0][0][0]);
	goto finish;
	
		
done:	goto repeat;

finish: 

	print_mesg(arguments, ret);
	close(sockfd);
	return ret;
}
