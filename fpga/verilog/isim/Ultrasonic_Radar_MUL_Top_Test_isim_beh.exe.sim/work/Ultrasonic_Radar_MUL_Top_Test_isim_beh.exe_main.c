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

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *VL_P_2533777724;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_11269365332969211371_3315667898_init();
    unisims_ver_m_10756824001551653569_2040370823_init();
    unisims_ver_m_03306128100829070844_1523277405_init();
    unisims_ver_m_02760857255181855774_2593380106_init();
    work_m_08194374833776775245_3139859730_init();
    work_m_16567664446884120176_2901397797_init();
    work_m_10859341812995960378_0277046461_init();
    xilinxcorelib_ver_m_04284627112054182733_0369791668_init();
    xilinxcorelib_ver_m_18166792875774041790_4089291157_init();
    xilinxcorelib_ver_m_17738287534884592592_3339302114_init();
    xilinxcorelib_ver_m_10066368518302646626_0606193735_init();
    work_m_13843185802771555180_0124586300_init();
    work_m_15200508743785481718_4034070640_init();
    work_m_07548385093529118877_1838432348_init();
    work_m_08851777174739267523_0148549568_init();
    work_m_13797929161080088263_2446589562_init();
    work_m_13797929161080088263_3872706284_init();
    work_m_13797929161080088263_2024823631_init();
    work_m_01722369798313699103_4232782590_init();
    work_m_01572343119630601032_1534427558_init();
    xilinxcorelib_ver_m_03971639830285338144_0409231278_init();
    xilinxcorelib_ver_m_08806734024374623429_3245676649_init();
    xilinxcorelib_ver_m_16593082313569287316_0879366020_init();
    xilinxcorelib_ver_m_14518455072116702019_1057298969_init();
    work_m_05880053597461080167_1466665031_init();
    work_m_14192529307776101455_0525389501_init();
    work_m_18132858685806942280_3952743511_init();
    work_m_11359501693864693368_3417465232_init();
    work_m_16001682716459849493_3065854867_init();
    work_m_16647725039588481071_0742020777_init();
    work_m_16541823861846354283_2073120511_init();
    ieee_p_2592010699_init();
    vl_p_2533777724_init();
    work_a_2652337050_3212880686_init();


    xsi_register_tops("work_m_16647725039588481071_0742020777");
    xsi_register_tops("work_m_16541823861846354283_2073120511");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    VL_P_2533777724 = xsi_get_engine_memory("vl_p_2533777724");

    return xsi_run_simulation(argc, argv);

}
