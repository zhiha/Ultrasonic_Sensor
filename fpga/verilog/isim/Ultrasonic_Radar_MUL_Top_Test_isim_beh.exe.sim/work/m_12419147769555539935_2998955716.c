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
static const char *ng0 = "/home/ise/Share/Ultrasonic_Sensor/fpga/verilog/RAM_TO_CFRBDS_With_Interpolation.v";
static int ng1[] = {4, 0};
static int ng2[] = {1, 0};
static int ng3[] = {3, 0};
static int ng4[] = {0, 0};
static int ng5[] = {2, 0};
static int ng6[] = {15, 0};
static int ng7[] = {5, 0};
static int ng8[] = {3999, 0};
static int ng9[] = {7, 0};
static int ng10[] = {6, 0};
static int ng11[] = {1000, 0};



static void Cont_59_0(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
    char t39[8];
    char t48[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;

LAB0:    t1 = (t0 + 6448U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 4096);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng1)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB7;

LAB4:    if (t20 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t8) = 1;

LAB7:    memset(t4, 0, 8);
    t24 = (t8 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t8);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t24) != 0)
        goto LAB10;

LAB11:    t31 = (t4 + 4);
    t32 = *((unsigned int *)t4);
    t33 = *((unsigned int *)t31);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB12;

LAB13:    t40 = *((unsigned int *)t4);
    t41 = (~(t40));
    t42 = *((unsigned int *)t31);
    t43 = (t41 || t42);
    if (t43 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t31) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t48, 8);

LAB20:    t49 = (t0 + 7640);
    t50 = (t49 + 56U);
    t51 = *((char **)t50);
    t52 = (t51 + 56U);
    t53 = *((char **)t52);
    memset(t53, 0, 8);
    t54 = 65535U;
    t55 = t54;
    t56 = (t3 + 4);
    t57 = *((unsigned int *)t3);
    t54 = (t54 & t57);
    t58 = *((unsigned int *)t56);
    t55 = (t55 & t58);
    t59 = (t53 + 4);
    t60 = *((unsigned int *)t53);
    *((unsigned int *)t53) = (t60 | t54);
    t61 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t61 | t55);
    xsi_driver_vfirst_trans(t49, 0, 15);
    t62 = (t0 + 7512);
    *((int *)t62) = 1;

LAB1:    return;
LAB6:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t30 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB11;

LAB12:    t35 = (t0 + 1776U);
    t36 = *((char **)t35);
    t35 = (t0 + 4416);
    t37 = (t35 + 56U);
    t38 = *((char **)t37);
    memset(t39, 0, 8);
    xsi_vlog_unsigned_minus(t39, 16, t36, 16, t38, 16);
    goto LAB13;

LAB14:    t44 = (t0 + 1776U);
    t45 = *((char **)t44);
    t44 = (t0 + 4736);
    t46 = (t44 + 56U);
    t47 = *((char **)t46);
    memset(t48, 0, 8);
    xsi_vlog_unsigned_minus(t48, 16, t45, 16, t47, 16);
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 16, t39, 16, t48, 16);
    goto LAB20;

LAB18:    memcpy(t3, t39, 8);
    goto LAB20;

}

static void Cont_60_1(char *t0)
{
    char t3[8];
    char t15[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;

LAB0:    t1 = (t0 + 6696U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 2256U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    *((unsigned int *)t3) = t7;
    *((unsigned int *)t2) = 0;
    if (*((unsigned int *)t5) != 0)
        goto LAB5;

LAB4:    t12 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t12 & 4294967295U);
    t13 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t13 & 4294967295U);
    t14 = ((char*)((ng2)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 32, t3, 32, t14, 32);
    t16 = (t0 + 7704);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memset(t20, 0, 8);
    t21 = 65535U;
    t22 = t21;
    t23 = (t15 + 4);
    t24 = *((unsigned int *)t15);
    t21 = (t21 & t24);
    t25 = *((unsigned int *)t23);
    t22 = (t22 & t25);
    t26 = (t20 + 4);
    t27 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t27 | t21);
    t28 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t28 | t22);
    xsi_driver_vfirst_trans(t16, 0, 15);
    t29 = (t0 + 7528);
    *((int *)t29) = 1;

LAB1:    return;
LAB5:    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t5);
    *((unsigned int *)t3) = (t8 | t9);
    t10 = *((unsigned int *)t2);
    t11 = *((unsigned int *)t5);
    *((unsigned int *)t2) = (t10 | t11);
    goto LAB4;

}

static void Cont_61_2(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 6944U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 2416U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_rshift(t4, 16, t3, 16, t2, 32);
    t5 = (t0 + 7768);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 65535U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 15);
    t18 = (t0 + 7544);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Always_63_3(char *t0)
{
    char t4[8];
    char t37[8];
    char t39[8];
    char t44[8];
    char t70[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t38;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    char *t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    char *t71;
    int t72;
    int t73;

LAB0:    t1 = (t0 + 7192U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 7560);
    *((int *)t2) = 1;
    t3 = (t0 + 7224);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(63, ng0);

LAB5:    xsi_set_current_line(64, ng0);
    t5 = (t0 + 1616U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t5) == 0)
        goto LAB6;

LAB8:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB9:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(71, ng0);

LAB14:    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3136);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2976);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 1936U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB15;

LAB16:    xsi_set_current_line(157, ng0);

LAB163:    xsi_set_current_line(158, ng0);
    t2 = (t0 + 4256);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t5 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB167;

LAB165:    if (*((unsigned int *)t6) == 0)
        goto LAB164;

LAB166:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB167:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB168;

LAB169:
LAB170:    xsi_set_current_line(172, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3296);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 13, 0LL);
    xsi_set_current_line(173, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 4096);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB17:
LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(64, ng0);

LAB13:    xsi_set_current_line(65, ng0);
    t19 = ((char*)((ng4)));
    t20 = (t0 + 3296);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 13, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3456);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(67, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3616);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3776);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3136);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB12;

LAB15:    xsi_set_current_line(74, ng0);

LAB18:    xsi_set_current_line(75, ng0);
    t5 = (t0 + 4096);
    t6 = (t5 + 56U);
    t12 = *((char **)t6);
    t13 = ((char*)((ng4)));
    memset(t4, 0, 8);
    t19 = (t12 + 4);
    t20 = (t13 + 4);
    t14 = *((unsigned int *)t12);
    t15 = *((unsigned int *)t13);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t19);
    t18 = *((unsigned int *)t20);
    t21 = (t17 ^ t18);
    t22 = (t16 | t21);
    t23 = *((unsigned int *)t19);
    t24 = *((unsigned int *)t20);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB22;

LAB19:    if (t25 != 0)
        goto LAB21;

LAB20:    *((unsigned int *)t4) = 1;

LAB22:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (~(t30));
    t32 = *((unsigned int *)t4);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB23;

LAB24:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 4096);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
    t18 = (t16 | t17);
    t21 = (~(t18));
    t22 = (t15 & t21);
    if (t22 != 0)
        goto LAB38;

LAB35:    if (t18 != 0)
        goto LAB37;

LAB36:    *((unsigned int *)t4) = 1;

LAB38:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB39;

LAB40:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 4096);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng5)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
    t18 = (t16 | t17);
    t21 = (~(t18));
    t22 = (t15 & t21);
    if (t22 != 0)
        goto LAB54;

LAB51:    if (t18 != 0)
        goto LAB53;

LAB52:    *((unsigned int *)t4) = 1;

LAB54:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB55;

LAB56:    xsi_set_current_line(100, ng0);
    t2 = (t0 + 4096);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng3)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
    t18 = (t16 | t17);
    t21 = (~(t18));
    t22 = (t15 & t21);
    if (t22 != 0)
        goto LAB62;

LAB59:    if (t18 != 0)
        goto LAB61;

LAB60:    *((unsigned int *)t4) = 1;

LAB62:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB63;

LAB64:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 4096);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng1)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
    t18 = (t16 | t17);
    t21 = (~(t18));
    t22 = (t15 & t21);
    if (t22 != 0)
        goto LAB70;

LAB67:    if (t18 != 0)
        goto LAB69;

LAB68:    *((unsigned int *)t4) = 1;

LAB70:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB71;

LAB72:    xsi_set_current_line(114, ng0);
    t2 = (t0 + 4096);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng7)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
    t18 = (t16 | t17);
    t21 = (~(t18));
    t22 = (t15 & t21);
    if (t22 != 0)
        goto LAB87;

LAB84:    if (t18 != 0)
        goto LAB86;

LAB85:    *((unsigned int *)t4) = 1;

LAB87:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB88;

LAB89:    xsi_set_current_line(145, ng0);
    t2 = (t0 + 4096);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng10)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
    t18 = (t16 | t17);
    t21 = (~(t18));
    t22 = (t15 & t21);
    if (t22 != 0)
        goto LAB150;

LAB147:    if (t18 != 0)
        goto LAB149;

LAB148:    *((unsigned int *)t4) = 1;

LAB150:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB151;

LAB152:
LAB153:
LAB90:
LAB73:
LAB65:
LAB57:
LAB41:
LAB25:    goto LAB17;

LAB21:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB22;

LAB23:    xsi_set_current_line(75, ng0);

LAB26:    xsi_set_current_line(76, ng0);
    t35 = ((char*)((ng4)));
    t36 = (t0 + 3456);
    xsi_vlogvar_wait_assign_value(t36, t35, 0, 0, 16, 0LL);
    xsi_set_current_line(77, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3616);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3776);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t5, 2, t6, 32);
    t12 = (t0 + 3936);
    xsi_vlogvar_wait_assign_value(t12, t4, 0, 0, 2, 0LL);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng3)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
    t18 = (t16 | t17);
    t21 = (~(t18));
    t22 = (t15 & t21);
    if (t22 != 0)
        goto LAB30;

LAB27:    if (t18 != 0)
        goto LAB29;

LAB28:    *((unsigned int *)t4) = 1;

LAB30:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB31;

LAB32:
LAB33:    goto LAB25;

LAB29:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB30;

LAB31:    xsi_set_current_line(80, ng0);

LAB34:    xsi_set_current_line(81, ng0);
    t28 = ((char*)((ng4)));
    t29 = (t0 + 3936);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 2, 0LL);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 4096);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t5, 4, t6, 32);
    t12 = (t0 + 4096);
    xsi_vlogvar_wait_assign_value(t12, t4, 0, 0, 4, 0LL);
    goto LAB33;

LAB37:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB38;

LAB39:    xsi_set_current_line(85, ng0);

LAB42:    xsi_set_current_line(86, ng0);
    t28 = ((char*)((ng4)));
    t29 = (t0 + 3456);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 16, 0LL);
    xsi_set_current_line(87, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3616);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t5, 2, t6, 32);
    t12 = (t0 + 3936);
    xsi_vlogvar_wait_assign_value(t12, t4, 0, 0, 2, 0LL);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng3)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
    t18 = (t16 | t17);
    t21 = (~(t18));
    t22 = (t15 & t21);
    if (t22 != 0)
        goto LAB46;

LAB43:    if (t18 != 0)
        goto LAB45;

LAB44:    *((unsigned int *)t4) = 1;

LAB46:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB47;

LAB48:
LAB49:    goto LAB41;

LAB45:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB46;

LAB47:    xsi_set_current_line(89, ng0);

LAB50:    xsi_set_current_line(90, ng0);
    t28 = ((char*)((ng4)));
    t29 = (t0 + 3936);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 2, 0LL);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 4096);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t5, 4, t6, 32);
    t12 = (t0 + 4096);
    xsi_vlogvar_wait_assign_value(t12, t4, 0, 0, 4, 0LL);
    xsi_set_current_line(92, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3136);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB49;

LAB53:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB54;

LAB55:    xsi_set_current_line(95, ng0);

LAB58:    xsi_set_current_line(96, ng0);
    t28 = ((char*)((ng2)));
    t29 = (t0 + 3136);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 1, 0LL);
    xsi_set_current_line(97, ng0);
    t2 = (t0 + 3296);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t5, 13, t6, 32);
    t12 = (t0 + 3296);
    xsi_vlogvar_wait_assign_value(t12, t4, 0, 0, 13, 0LL);
    xsi_set_current_line(98, ng0);
    t2 = (t0 + 4096);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t5, 4, t6, 32);
    t12 = (t0 + 4096);
    xsi_vlogvar_wait_assign_value(t12, t4, 0, 0, 4, 0LL);
    goto LAB57;

LAB61:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB62;

LAB63:    xsi_set_current_line(100, ng0);

LAB66:    xsi_set_current_line(101, ng0);
    t28 = ((char*)((ng4)));
    t29 = (t0 + 3776);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 1, 0LL);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t2 = (t0 + 4416);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 16, 0LL);
    xsi_set_current_line(103, ng0);
    t2 = (t0 + 4096);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t5, 4, t6, 32);
    t12 = (t0 + 4096);
    xsi_vlogvar_wait_assign_value(t12, t4, 0, 0, 4, 0LL);
    goto LAB65;

LAB69:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB70;

LAB71:    xsi_set_current_line(105, ng0);

LAB74:    xsi_set_current_line(106, ng0);
    t28 = (t0 + 4096);
    t29 = (t28 + 56U);
    t35 = *((char **)t29);
    t36 = ((char*)((ng2)));
    memset(t37, 0, 8);
    xsi_vlog_unsigned_add(t37, 32, t35, 4, t36, 32);
    t38 = (t0 + 4096);
    xsi_vlogvar_wait_assign_value(t38, t37, 0, 0, 4, 0LL);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 2256U);
    t3 = *((char **)t2);
    t2 = (t0 + 2216U);
    t5 = (t2 + 72U);
    t6 = *((char **)t5);
    t12 = ((char*)((ng6)));
    xsi_vlog_generic_get_index_select_value(t4, 32, t3, t6, 2, t12, 32, 1);
    t13 = ((char*)((ng2)));
    memset(t37, 0, 8);
    t19 = (t4 + 4);
    t20 = (t13 + 4);
    t7 = *((unsigned int *)t4);
    t8 = *((unsigned int *)t13);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t19);
    t11 = *((unsigned int *)t20);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t19);
    t17 = *((unsigned int *)t20);
    t18 = (t16 | t17);
    t21 = (~(t18));
    t22 = (t15 & t21);
    if (t22 != 0)
        goto LAB78;

LAB75:    if (t18 != 0)
        goto LAB77;

LAB76:    *((unsigned int *)t37) = 1;

LAB78:    t29 = (t37 + 4);
    t23 = *((unsigned int *)t29);
    t24 = (~(t23));
    t25 = *((unsigned int *)t37);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB79;

LAB80:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 2256U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_rshift(t4, 16, t3, 16, t2, 32);
    t5 = (t0 + 4576);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 16, 0LL);

LAB81:    xsi_set_current_line(111, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t2 = (t0 + 4736);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 16, 0LL);
    xsi_set_current_line(112, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2976);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB73;

LAB77:    t28 = (t37 + 4);
    *((unsigned int *)t37) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB78;

LAB79:    xsi_set_current_line(108, ng0);
    t35 = (t0 + 2576U);
    t36 = *((char **)t35);
    memset(t39, 0, 8);
    t35 = (t39 + 4);
    t38 = (t36 + 4);
    t30 = *((unsigned int *)t36);
    t31 = (~(t30));
    *((unsigned int *)t39) = t31;
    *((unsigned int *)t35) = 0;
    if (*((unsigned int *)t38) != 0)
        goto LAB83;

LAB82:    t41 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t41 & 4294967295U);
    t42 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t42 & 4294967295U);
    t43 = ((char*)((ng2)));
    memset(t44, 0, 8);
    xsi_vlog_unsigned_add(t44, 32, t39, 32, t43, 32);
    t45 = (t0 + 4576);
    xsi_vlogvar_wait_assign_value(t45, t44, 0, 0, 16, 0LL);
    goto LAB81;

LAB83:    t32 = *((unsigned int *)t39);
    t33 = *((unsigned int *)t38);
    *((unsigned int *)t39) = (t32 | t33);
    t34 = *((unsigned int *)t35);
    t40 = *((unsigned int *)t38);
    *((unsigned int *)t35) = (t34 | t40);
    goto LAB82;

LAB86:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB87;

LAB88:    xsi_set_current_line(114, ng0);

LAB91:    xsi_set_current_line(115, ng0);
    t28 = (t0 + 4416);
    t29 = (t28 + 56U);
    t35 = *((char **)t29);
    t36 = (t0 + 3456);
    xsi_vlogvar_wait_assign_value(t36, t35, 0, 0, 16, 0LL);
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 4416);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 4576);
    t12 = (t6 + 56U);
    t13 = *((char **)t12);
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 16, t5, 16, t13, 16);
    t19 = (t0 + 4416);
    xsi_vlogvar_wait_assign_value(t19, t4, 0, 0, 16, 0LL);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 4896);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t5, 4, t6, 32);
    t12 = (t0 + 4896);
    xsi_vlogvar_wait_assign_value(t12, t4, 0, 0, 4, 0LL);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 4896);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng7)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
    t18 = (t16 | t17);
    t21 = (~(t18));
    t22 = (t15 & t21);
    if (t22 != 0)
        goto LAB95;

LAB92:    if (t18 != 0)
        goto LAB94;

LAB93:    *((unsigned int *)t4) = 1;

LAB95:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB96;

LAB97:
LAB98:    xsi_set_current_line(130, ng0);
    t2 = (t0 + 4896);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng9)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
    t18 = (t16 | t17);
    t21 = (~(t18));
    t22 = (t15 & t21);
    if (t22 != 0)
        goto LAB115;

LAB112:    if (t18 != 0)
        goto LAB114;

LAB113:    *((unsigned int *)t4) = 1;

LAB115:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB116;

LAB117:
LAB118:    goto LAB90;

LAB94:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB95;

LAB96:    xsi_set_current_line(118, ng0);

LAB99:    xsi_set_current_line(119, ng0);
    t28 = ((char*)((ng2)));
    t29 = (t0 + 3136);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 1, 0LL);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 3296);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t5, 13, t6, 32);
    t12 = (t0 + 3296);
    xsi_vlogvar_wait_assign_value(t12, t4, 0, 0, 13, 0LL);
    xsi_set_current_line(121, ng0);
    t2 = (t0 + 3296);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng8)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
    t18 = (t16 | t17);
    t21 = (~(t18));
    t22 = (t15 & t21);
    if (t22 != 0)
        goto LAB103;

LAB100:    if (t18 != 0)
        goto LAB102;

LAB101:    *((unsigned int *)t4) = 1;

LAB103:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB104;

LAB105:
LAB106:    xsi_set_current_line(125, ng0);
    t2 = (t0 + 5376);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB108;

LAB109:
LAB110:    goto LAB98;

LAB102:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB103;

LAB104:    xsi_set_current_line(121, ng0);

LAB107:    xsi_set_current_line(122, ng0);
    t28 = ((char*)((ng4)));
    t29 = (t0 + 3296);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 13, 0LL);
    xsi_set_current_line(123, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5376);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB106;

LAB108:    xsi_set_current_line(125, ng0);

LAB111:    xsi_set_current_line(126, ng0);
    t12 = ((char*)((ng4)));
    t13 = (t0 + 3136);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 1, 0LL);
    xsi_set_current_line(127, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5536);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB110;

LAB114:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB115;

LAB116:    xsi_set_current_line(130, ng0);

LAB119:    xsi_set_current_line(131, ng0);
    t28 = (t0 + 2256U);
    t29 = *((char **)t28);
    t28 = (t0 + 2216U);
    t35 = (t28 + 72U);
    t36 = *((char **)t35);
    t38 = ((char*)((ng6)));
    xsi_vlog_generic_get_index_select_value(t37, 32, t29, t36, 2, t38, 32, 1);
    t43 = ((char*)((ng2)));
    memset(t39, 0, 8);
    t45 = (t37 + 4);
    t46 = (t43 + 4);
    t30 = *((unsigned int *)t37);
    t31 = *((unsigned int *)t43);
    t32 = (t30 ^ t31);
    t33 = *((unsigned int *)t45);
    t34 = *((unsigned int *)t46);
    t40 = (t33 ^ t34);
    t41 = (t32 | t40);
    t42 = *((unsigned int *)t45);
    t47 = *((unsigned int *)t46);
    t48 = (t42 | t47);
    t49 = (~(t48));
    t50 = (t41 & t49);
    if (t50 != 0)
        goto LAB123;

LAB120:    if (t48 != 0)
        goto LAB122;

LAB121:    *((unsigned int *)t39) = 1;

LAB123:    t52 = (t39 + 4);
    t53 = *((unsigned int *)t52);
    t54 = (~(t53));
    t55 = *((unsigned int *)t39);
    t56 = (t55 & t54);
    t57 = (t56 != 0);
    if (t57 > 0)
        goto LAB124;

LAB125:    xsi_set_current_line(134, ng0);
    t2 = (t0 + 2256U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_rshift(t4, 16, t3, 16, t2, 32);
    t5 = (t0 + 4576);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 16, 0LL);

LAB126:    xsi_set_current_line(135, ng0);
    t2 = (t0 + 4736);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 4416);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 16, 0LL);
    xsi_set_current_line(136, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t2 = (t0 + 4736);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 16, 0LL);
    xsi_set_current_line(137, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 4896);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(138, ng0);
    t2 = (t0 + 5376);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t5 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB129;

LAB130:    if (*((unsigned int *)t6) != 0)
        goto LAB131;

LAB132:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t4);
    t15 = *((unsigned int *)t13);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB133;

LAB134:    memcpy(t39, t4, 8);

LAB135:    t51 = (t39 + 4);
    t64 = *((unsigned int *)t51);
    t65 = (~(t64));
    t66 = *((unsigned int *)t39);
    t67 = (t66 & t65);
    t68 = (t67 != 0);
    if (t68 > 0)
        goto LAB143;

LAB144:
LAB145:    goto LAB118;

LAB122:    t51 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB123;

LAB124:    xsi_set_current_line(132, ng0);
    t58 = (t0 + 2576U);
    t59 = *((char **)t58);
    memset(t44, 0, 8);
    t58 = (t44 + 4);
    t60 = (t59 + 4);
    t61 = *((unsigned int *)t59);
    t62 = (~(t61));
    *((unsigned int *)t44) = t62;
    *((unsigned int *)t58) = 0;
    if (*((unsigned int *)t60) != 0)
        goto LAB128;

LAB127:    t67 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t67 & 4294967295U);
    t68 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t68 & 4294967295U);
    t69 = ((char*)((ng2)));
    memset(t70, 0, 8);
    xsi_vlog_unsigned_add(t70, 32, t44, 32, t69, 32);
    t71 = (t0 + 4576);
    xsi_vlogvar_wait_assign_value(t71, t70, 0, 0, 16, 0LL);
    goto LAB126;

LAB128:    t63 = *((unsigned int *)t44);
    t64 = *((unsigned int *)t60);
    *((unsigned int *)t44) = (t63 | t64);
    t65 = *((unsigned int *)t58);
    t66 = *((unsigned int *)t60);
    *((unsigned int *)t58) = (t65 | t66);
    goto LAB127;

LAB129:    *((unsigned int *)t4) = 1;
    goto LAB132;

LAB131:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB132;

LAB133:    t19 = (t0 + 5536);
    t20 = (t19 + 56U);
    t28 = *((char **)t20);
    memset(t37, 0, 8);
    t29 = (t28 + 4);
    t17 = *((unsigned int *)t29);
    t18 = (~(t17));
    t21 = *((unsigned int *)t28);
    t22 = (t21 & t18);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB136;

LAB137:    if (*((unsigned int *)t29) != 0)
        goto LAB138;

LAB139:    t24 = *((unsigned int *)t4);
    t25 = *((unsigned int *)t37);
    t26 = (t24 & t25);
    *((unsigned int *)t39) = t26;
    t36 = (t4 + 4);
    t38 = (t37 + 4);
    t43 = (t39 + 4);
    t27 = *((unsigned int *)t36);
    t30 = *((unsigned int *)t38);
    t31 = (t27 | t30);
    *((unsigned int *)t43) = t31;
    t32 = *((unsigned int *)t43);
    t33 = (t32 != 0);
    if (t33 == 1)
        goto LAB140;

LAB141:
LAB142:    goto LAB135;

LAB136:    *((unsigned int *)t37) = 1;
    goto LAB139;

LAB138:    t35 = (t37 + 4);
    *((unsigned int *)t37) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB139;

LAB140:    t34 = *((unsigned int *)t39);
    t40 = *((unsigned int *)t43);
    *((unsigned int *)t39) = (t34 | t40);
    t45 = (t4 + 4);
    t46 = (t37 + 4);
    t41 = *((unsigned int *)t4);
    t42 = (~(t41));
    t47 = *((unsigned int *)t45);
    t48 = (~(t47));
    t49 = *((unsigned int *)t37);
    t50 = (~(t49));
    t53 = *((unsigned int *)t46);
    t54 = (~(t53));
    t72 = (t42 & t48);
    t73 = (t50 & t54);
    t55 = (~(t72));
    t56 = (~(t73));
    t57 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t57 & t55);
    t61 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t61 & t56);
    t62 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t62 & t55);
    t63 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t63 & t56);
    goto LAB142;

LAB143:    xsi_set_current_line(138, ng0);

LAB146:    xsi_set_current_line(139, ng0);
    t52 = (t0 + 4096);
    t58 = (t52 + 56U);
    t59 = *((char **)t58);
    t60 = ((char*)((ng2)));
    memset(t44, 0, 8);
    xsi_vlog_unsigned_add(t44, 32, t59, 4, t60, 32);
    t69 = (t0 + 4096);
    xsi_vlogvar_wait_assign_value(t69, t44, 0, 0, 4, 0LL);
    xsi_set_current_line(140, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5376);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(141, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5536);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB145;

LAB149:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB150;

LAB151:    xsi_set_current_line(145, ng0);

LAB154:    xsi_set_current_line(146, ng0);
    t28 = ((char*)((ng2)));
    t29 = (t0 + 3776);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 1, 0LL);
    xsi_set_current_line(147, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3456);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(148, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3296);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 13, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 5216);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t5, 16, t6, 32);
    t12 = (t0 + 5216);
    xsi_vlogvar_wait_assign_value(t12, t4, 0, 0, 16, 0LL);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 5216);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng11)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
    t18 = (t16 | t17);
    t21 = (~(t18));
    t22 = (t15 & t21);
    if (t22 != 0)
        goto LAB158;

LAB155:    if (t18 != 0)
        goto LAB157;

LAB156:    *((unsigned int *)t4) = 1;

LAB158:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB159;

LAB160:
LAB161:    goto LAB153;

LAB157:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB158;

LAB159:    xsi_set_current_line(150, ng0);

LAB162:    xsi_set_current_line(151, ng0);
    t28 = ((char*)((ng4)));
    t29 = (t0 + 5216);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 16, 0LL);
    xsi_set_current_line(152, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4096);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(153, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3936);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    goto LAB161;

LAB164:    *((unsigned int *)t4) = 1;
    goto LAB167;

LAB168:    xsi_set_current_line(158, ng0);

LAB171:    xsi_set_current_line(159, ng0);
    t19 = ((char*)((ng4)));
    t20 = (t0 + 3456);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 16, 0LL);
    xsi_set_current_line(160, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3616);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(161, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3776);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(162, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t5, 2, t6, 32);
    t12 = (t0 + 3936);
    xsi_vlogvar_wait_assign_value(t12, t4, 0, 0, 2, 0LL);
    xsi_set_current_line(163, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
    t18 = (t16 | t17);
    t21 = (~(t18));
    t22 = (t15 & t21);
    if (t22 != 0)
        goto LAB175;

LAB172:    if (t18 != 0)
        goto LAB174;

LAB173:    *((unsigned int *)t4) = 1;

LAB175:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB176;

LAB177:
LAB178:    xsi_set_current_line(166, ng0);
    t2 = (t0 + 3936);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng3)));
    memset(t4, 0, 8);
    t12 = (t5 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t12);
    t11 = *((unsigned int *)t13);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
    t18 = (t16 | t17);
    t21 = (~(t18));
    t22 = (t15 & t21);
    if (t22 != 0)
        goto LAB183;

LAB180:    if (t18 != 0)
        goto LAB182;

LAB181:    *((unsigned int *)t4) = 1;

LAB183:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB184;

LAB185:
LAB186:    goto LAB170;

LAB174:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB175;

LAB176:    xsi_set_current_line(163, ng0);

LAB179:    xsi_set_current_line(164, ng0);
    t28 = ((char*)((ng4)));
    t29 = (t0 + 3616);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 1, 0LL);
    goto LAB178;

LAB182:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB183;

LAB184:    xsi_set_current_line(166, ng0);

LAB187:    xsi_set_current_line(167, ng0);
    t28 = ((char*)((ng4)));
    t29 = (t0 + 3776);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 1, 0LL);
    xsi_set_current_line(168, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3936);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(169, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4256);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB186;

}


extern void work_m_12419147769555539935_2998955716_init()
{
	static char *pe[] = {(void *)Cont_59_0,(void *)Cont_60_1,(void *)Cont_61_2,(void *)Always_63_3};
	xsi_register_didat("work_m_12419147769555539935_2998955716", "isim/Ultrasonic_Radar_MUL_Top_Test_isim_beh.exe.sim/work/m_12419147769555539935_2998955716.didat");
	xsi_register_executes(pe);
}
