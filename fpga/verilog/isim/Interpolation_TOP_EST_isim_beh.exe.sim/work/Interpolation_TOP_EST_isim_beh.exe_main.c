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
    xilinxcorelib_ver_m_04284627112054182733_0369791668_init();
    xilinxcorelib_ver_m_18166792875774041790_4089291157_init();
    xilinxcorelib_ver_m_17738287534884592592_1026563551_init();
    xilinxcorelib_ver_m_10066368518302646626_1828930243_init();
    work_m_13843185802771555180_0271265570_init();
    work_m_01939735684272496632_1468832335_init();
    work_m_15897297117836597140_0499522849_init();
    work_m_16541823861846354283_2073120511_init();
    ieee_p_2592010699_init();
    vl_p_2533777724_init();
    work_a_4059491184_3212880686_init();


    xsi_register_tops("work_m_15897297117836597140_0499522849");
    xsi_register_tops("work_m_16541823861846354283_2073120511");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    VL_P_2533777724 = xsi_get_engine_memory("vl_p_2533777724");

    return xsi_run_simulation(argc, argv);

}
