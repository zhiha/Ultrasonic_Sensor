/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_07548385093529118877_1838432348_init();
    work_m_08851777174739267523_0148549568_init();
    work_m_13797929161080088263_2446589562_init();
    work_m_13797929161080088263_3872706284_init();
    work_m_13797929161080088263_2024823631_init();
    work_m_01722369798313699103_4232782590_init();
    work_m_15967524208943988184_2273320096_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_15967524208943988184_2273320096");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
