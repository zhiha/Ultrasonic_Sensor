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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/Share/Ultrasonic_Sensor/fpga/verilog/CFRBDS_TEST.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static const char *ng3 = "/home/ise/Share/Ultrasonic_Python/sigmadeltaDataDecimal.txt";
static const char *ng4 = "r";
static const char *ng5 = "%d";
static int ng6[] = {1, 0, 0, 0};
static int ng7[] = {4000, 0, 0, 0};
static const char *ng8 = "/home/ise/Share/Ultrasonic_Python/sigmadeltaDecimalOutput.txt";
static const char *ng9 = "can not openg the file!";
static int ng10[] = {96000, 0, 0, 0};



static void Initial_53_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 4096U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(53, ng0);

LAB4:    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2704);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2864);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3024);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3184);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(60, ng0);
    t2 = (t0 + 3904);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(61, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2704);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(62, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2864);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 3904);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2704);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(67, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3184);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = (t0 + 3904);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2704);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2864);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 3904);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    goto LAB1;

}

static void Initial_80_1(char *t0)
{
    char t1[8];
    char t7[8];
    char t17[8];
    char t21[8];
    char t31[8];
    char t34[8];
    char t35[8];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t18;
    char *t19;
    char *t20;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t32;
    char *t33;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    unsigned int t46;
    int t47;
    char *t48;
    unsigned int t49;
    int t50;
    int t51;
    unsigned int t52;
    unsigned int t53;
    int t54;
    int t55;
    char *t56;

LAB0:    xsi_set_current_line(80, ng0);

LAB2:    xsi_set_current_line(81, ng0);
    *((int *)t1) = xsi_vlogfile_file_open_of_cname_ctype(ng3, ng4);
    t2 = (t1 + 4);
    *((int *)t2) = 0;
    t3 = (t0 + 1584);
    xsi_vlogvar_assign_value(t3, t1, 0, 0, 32);
    xsi_set_current_line(82, ng0);
    xsi_set_current_line(82, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1904);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB3:    t2 = (t0 + 1904);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 472);
    t6 = *((char **)t5);
    t5 = ((char*)((ng2)));
    memset(t1, 0, 8);
    xsi_vlog_signed_add(t1, 32, t6, 32, t5, 32);
    memset(t7, 0, 8);
    xsi_vlog_signed_less(t7, 32, t4, 32, t1, 32);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t8);
    t10 = (~(t9));
    t11 = *((unsigned int *)t7);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB4;

LAB5:
LAB1:    return;
LAB4:    xsi_set_current_line(82, ng0);

LAB6:    xsi_set_current_line(83, ng0);
    t14 = (t0 + 1584);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t18 = (t0 + 2224);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t22 = (t0 + 2224);
    t23 = (t22 + 72U);
    t24 = *((char **)t23);
    t25 = (t0 + 2224);
    t26 = (t25 + 64U);
    t27 = *((char **)t26);
    t28 = (t0 + 1904);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    xsi_vlog_generic_get_array_select_value(t21, 16, t20, t24, t27, 2, 1, t30, 32, 1);
    xsi_vlog_bit_copy(t17, 0, t21, 0, 16);
    *((int *)t31) = xsi_vlogfile_fscanf(*((unsigned int *)t16), ng5, 2, t0, (char)118, t17, 16);
    t32 = (t31 + 4);
    *((int *)t32) = 0;
    t33 = (t0 + 2224);
    t36 = (t0 + 2224);
    t37 = (t36 + 72U);
    t38 = *((char **)t37);
    t39 = (t0 + 2224);
    t40 = (t39 + 64U);
    t41 = *((char **)t40);
    t42 = (t0 + 1904);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    xsi_vlog_generic_convert_array_indices(t34, t35, t38, t41, 2, 1, t44, 32, 1);
    t45 = (t34 + 4);
    t46 = *((unsigned int *)t45);
    t47 = (!(t46));
    t48 = (t35 + 4);
    t49 = *((unsigned int *)t48);
    t50 = (!(t49));
    t51 = (t47 && t50);
    if (t51 == 1)
        goto LAB7;

LAB8:    t56 = (t0 + 1744);
    xsi_vlogvar_assign_value(t56, t31, 0, 0, 32);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 1904);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t1, 0, 8);
    xsi_vlog_signed_add(t1, 32, t4, 32, t5, 32);
    t6 = (t0 + 1904);
    xsi_vlogvar_assign_value(t6, t1, 0, 0, 32);
    goto LAB3;

LAB7:    t52 = *((unsigned int *)t34);
    t53 = *((unsigned int *)t35);
    t54 = (t52 - t53);
    t55 = (t54 + 1);
    xsi_vlogvar_assign_value(t33, t17, 0, *((unsigned int *)t35), t55);
    goto LAB8;

}

static void Initial_87_2(char *t0)
{
    char t6[16];
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;

LAB0:    t1 = (t0 + 4592U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(87, ng0);

LAB4:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 4400);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(89, ng0);

LAB6:    xsi_set_current_line(90, ng0);

LAB7:    xsi_set_current_line(91, ng0);
    t3 = (t0 + 5656);
    *((int *)t3) = 1;
    t4 = (t0 + 4624);
    *((char **)t4) = t3;
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 2384);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    xsi_vlog_unsigned_add(t6, 64, t4, 64, t5, 32);
    t7 = (t0 + 2384);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 64, 0LL);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 2384);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng7)));
    xsi_vlog_unsigned_equal(t6, 64, t4, 64, t5, 32);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB9;

LAB10:
LAB11:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 2224);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2224);
    t7 = (t5 + 72U);
    t13 = *((char **)t7);
    t14 = (t0 + 2224);
    t16 = (t14 + 64U);
    t17 = *((char **)t16);
    t18 = (t0 + 2384);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    xsi_vlog_generic_get_array_select_value(t15, 16, t4, t13, t17, 2, 1, t20, 64, 2);
    t21 = (t0 + 2704);
    xsi_vlogvar_wait_assign_value(t21, t15, 0, 0, 16, 0LL);
    goto LAB6;

LAB9:    xsi_set_current_line(93, ng0);
    t13 = ((char*)((ng6)));
    t14 = (t0 + 2384);
    xsi_vlogvar_wait_assign_value(t14, t13, 0, 0, 64, 0LL);
    goto LAB11;

LAB12:    goto LAB1;

}

static void Always_98_3(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 4840U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 4648);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(98, ng0);
    t4 = (t0 + 3024);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 3024);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}

static void Initial_100_4(char *t0)
{
    char t1[8];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;

LAB0:    xsi_set_current_line(100, ng0);

LAB2:    xsi_set_current_line(101, ng0);
    *((int *)t1) = xsi_vlogfile_file_open_of_cname(ng8);
    t2 = (t1 + 4);
    *((int *)t2) = 0;
    t3 = (t0 + 2064);
    xsi_vlogvar_assign_value(t3, t1, 0, 0, 32);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 2064);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t1, 0, 8);
    xsi_vlog_signed_equal(t1, 32, t4, 32, t5, 32);
    t6 = (t1 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t1);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB3;

LAB4:
LAB5:
LAB1:    return;
LAB3:    xsi_set_current_line(102, ng0);

LAB6:    xsi_set_current_line(103, ng0);
    xsi_vlogfile_write(1, 0, 0, ng9, 1, t0);
    xsi_set_current_line(104, ng0);
    xsi_vlog_stop(1);
    goto LAB5;

}

static void Initial_108_5(char *t0)
{
    char t8[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    t1 = (t0 + 5336U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(108, ng0);

LAB4:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 5144);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(110, ng0);

LAB6:    xsi_set_current_line(111, ng0);

LAB7:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 5672);
    *((int *)t2) = 1;
    t3 = (t0 + 5368);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(113, ng0);
    t4 = (t0 + 2544);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng6)));
    xsi_vlog_unsigned_add(t8, 64, t6, 64, t7, 32);
    t9 = (t0 + 2544);
    xsi_vlogvar_wait_assign_value(t9, t8, 0, 0, 64, 0LL);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 2544);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng10)));
    xsi_vlog_unsigned_less(t8, 64, t4, 64, t5, 32);
    t6 = (t8 + 4);
    t10 = *((unsigned int *)t6);
    t11 = (~(t10));
    t12 = *((unsigned int *)t8);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(117, ng0);

LAB13:    xsi_set_current_line(118, ng0);
    t2 = (t0 + 2544);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2544);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 64, 0LL);

LAB11:    goto LAB6;

LAB9:    xsi_set_current_line(114, ng0);

LAB12:    xsi_set_current_line(115, ng0);
    t7 = (t0 + 2064);
    t9 = (t7 + 56U);
    t15 = *((char **)t9);
    t16 = (t0 + 1184U);
    t17 = *((char **)t16);
    xsi_vlogfile_fwrite(*((unsigned int *)t15), 1, 0, 0, ng5, 2, t0, (char)118, t17, 1);
    goto LAB11;

LAB14:    goto LAB1;

}


extern void work_m_15967524208943988184_2273320096_init()
{
	static char *pe[] = {(void *)Initial_53_0,(void *)Initial_80_1,(void *)Initial_87_2,(void *)Always_98_3,(void *)Initial_100_4,(void *)Initial_108_5};
	xsi_register_didat("work_m_15967524208943988184_2273320096", "isim/CFRBDS_TEST_isim_beh.exe.sim/work/m_15967524208943988184_2273320096.didat");
	xsi_register_executes(pe);
}
