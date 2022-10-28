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
static const char *ng0 = "/home/ise/Share/Ultrasonic_Sensor/fpga/verilog/Ultrasonic_RMII_RX.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {2, 0};
static int ng4[] = {3, 0};
static int ng5[] = {4, 0};
static int ng6[] = {5, 0};
static int ng7[] = {6, 0};
static int ng8[] = {7, 0};
static unsigned int ng9[] = {1U, 0U};
static unsigned int ng10[] = {85U, 0U};
static unsigned int ng11[] = {2U, 0U};
static unsigned int ng12[] = {32U, 0U};
static unsigned int ng13[] = {213U, 0U};
static unsigned int ng14[] = {4U, 0U};
static int ng15[] = {12, 0};
static int ng16[] = {15, 0};
static int ng17[] = {8, 0};
static int ng18[] = {13, 0};
static unsigned int ng19[] = {860116326U, 0U, 4386U, 0U};
static unsigned int ng20[] = {8U, 0U};
static unsigned int ng21[] = {9U, 0U};
static unsigned int ng22[] = {10U, 0U};
static unsigned int ng23[] = {11U, 0U};
static unsigned int ng24[] = {12U, 0U};
static unsigned int ng25[] = {16U, 0U};



static void Always_63_0(char *t0)
{
    char t4[8];
    char t30[8];
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
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    unsigned int t36;
    int t37;

LAB0:    t1 = (t0 + 6760U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 7328);
    *((int *)t2) = 1;
    t3 = (t0 + 6792);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(63, ng0);

LAB5:    xsi_set_current_line(64, ng0);
    t5 = (t0 + 2568U);
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

LAB11:    xsi_set_current_line(69, ng0);

LAB14:    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 2728U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB15;

LAB16:
LAB17:
LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(64, ng0);

LAB13:    xsi_set_current_line(65, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 5048);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 1, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(67, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB12;

LAB15:    xsi_set_current_line(72, ng0);

LAB18:    xsi_set_current_line(73, ng0);
    t5 = (t0 + 4888);
    t6 = (t5 + 56U);
    t12 = *((char **)t6);
    t13 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t12, 4, t13, 32);
    t19 = (t0 + 4888);
    xsi_vlogvar_wait_assign_value(t19, t4, 0, 0, 4, 0LL);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 4888);
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
        goto LAB22;

LAB19:    if (t18 != 0)
        goto LAB21;

LAB20:    *((unsigned int *)t4) = 1;

LAB22:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB23;

LAB24:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 4888);
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
        goto LAB34;

LAB31:    if (t18 != 0)
        goto LAB33;

LAB32:    *((unsigned int *)t4) = 1;

LAB34:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB35;

LAB36:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 4888);
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

LAB48:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 4888);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng4)));
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
        goto LAB58;

LAB55:    if (t18 != 0)
        goto LAB57;

LAB56:    *((unsigned int *)t4) = 1;

LAB58:    t20 = (t4 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB59;

LAB60:
LAB61:
LAB49:
LAB37:
LAB25:    goto LAB17;

LAB21:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB22;

LAB23:    xsi_set_current_line(74, ng0);

LAB26:    xsi_set_current_line(75, ng0);
    t28 = (t0 + 2888U);
    t29 = *((char **)t28);
    t28 = (t0 + 4728);
    t31 = (t0 + 4728);
    t32 = (t31 + 72U);
    t33 = *((char **)t32);
    t34 = ((char*)((ng1)));
    xsi_vlog_generic_convert_bit_index(t30, t33, 2, t34, 32, 1);
    t35 = (t30 + 4);
    t36 = *((unsigned int *)t35);
    t37 = (!(t36));
    if (t37 == 1)
        goto LAB27;

LAB28:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 3048U);
    t3 = *((char **)t2);
    t2 = (t0 + 4728);
    t5 = (t0 + 4728);
    t6 = (t5 + 72U);
    t12 = *((char **)t6);
    t13 = ((char*)((ng2)));
    xsi_vlog_generic_convert_bit_index(t4, t12, 2, t13, 32, 1);
    t19 = (t4 + 4);
    t7 = *((unsigned int *)t19);
    t37 = (!(t7));
    if (t37 == 1)
        goto LAB29;

LAB30:    goto LAB25;

LAB27:    xsi_vlogvar_wait_assign_value(t28, t29, 0, *((unsigned int *)t30), 1, 0LL);
    goto LAB28;

LAB29:    xsi_vlogvar_wait_assign_value(t2, t3, 0, *((unsigned int *)t4), 1, 0LL);
    goto LAB30;

LAB33:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB34;

LAB35:    xsi_set_current_line(78, ng0);

LAB38:    xsi_set_current_line(79, ng0);
    t28 = (t0 + 2888U);
    t29 = *((char **)t28);
    t28 = (t0 + 4728);
    t31 = (t0 + 4728);
    t32 = (t31 + 72U);
    t33 = *((char **)t32);
    t34 = ((char*)((ng3)));
    xsi_vlog_generic_convert_bit_index(t30, t33, 2, t34, 32, 1);
    t35 = (t30 + 4);
    t36 = *((unsigned int *)t35);
    t37 = (!(t36));
    if (t37 == 1)
        goto LAB39;

LAB40:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 3048U);
    t3 = *((char **)t2);
    t2 = (t0 + 4728);
    t5 = (t0 + 4728);
    t6 = (t5 + 72U);
    t12 = *((char **)t6);
    t13 = ((char*)((ng4)));
    xsi_vlog_generic_convert_bit_index(t4, t12, 2, t13, 32, 1);
    t19 = (t4 + 4);
    t7 = *((unsigned int *)t19);
    t37 = (!(t7));
    if (t37 == 1)
        goto LAB41;

LAB42:    goto LAB37;

LAB39:    xsi_vlogvar_wait_assign_value(t28, t29, 0, *((unsigned int *)t30), 1, 0LL);
    goto LAB40;

LAB41:    xsi_vlogvar_wait_assign_value(t2, t3, 0, *((unsigned int *)t4), 1, 0LL);
    goto LAB42;

LAB45:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB46;

LAB47:    xsi_set_current_line(82, ng0);

LAB50:    xsi_set_current_line(83, ng0);
    t28 = (t0 + 2888U);
    t29 = *((char **)t28);
    t28 = (t0 + 4728);
    t31 = (t0 + 4728);
    t32 = (t31 + 72U);
    t33 = *((char **)t32);
    t34 = ((char*)((ng5)));
    xsi_vlog_generic_convert_bit_index(t30, t33, 2, t34, 32, 1);
    t35 = (t30 + 4);
    t36 = *((unsigned int *)t35);
    t37 = (!(t36));
    if (t37 == 1)
        goto LAB51;

LAB52:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 3048U);
    t3 = *((char **)t2);
    t2 = (t0 + 4728);
    t5 = (t0 + 4728);
    t6 = (t5 + 72U);
    t12 = *((char **)t6);
    t13 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t4, t12, 2, t13, 32, 1);
    t19 = (t4 + 4);
    t7 = *((unsigned int *)t19);
    t37 = (!(t7));
    if (t37 == 1)
        goto LAB53;

LAB54:    goto LAB49;

LAB51:    xsi_vlogvar_wait_assign_value(t28, t29, 0, *((unsigned int *)t30), 1, 0LL);
    goto LAB52;

LAB53:    xsi_vlogvar_wait_assign_value(t2, t3, 0, *((unsigned int *)t4), 1, 0LL);
    goto LAB54;

LAB57:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB58;

LAB59:    xsi_set_current_line(86, ng0);

LAB62:    xsi_set_current_line(87, ng0);
    t28 = (t0 + 2888U);
    t29 = *((char **)t28);
    t28 = (t0 + 4728);
    t31 = (t0 + 4728);
    t32 = (t31 + 72U);
    t33 = *((char **)t32);
    t34 = ((char*)((ng7)));
    xsi_vlog_generic_convert_bit_index(t30, t33, 2, t34, 32, 1);
    t35 = (t30 + 4);
    t36 = *((unsigned int *)t35);
    t37 = (!(t36));
    if (t37 == 1)
        goto LAB63;

LAB64:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 3048U);
    t3 = *((char **)t2);
    t2 = (t0 + 4728);
    t5 = (t0 + 4728);
    t6 = (t5 + 72U);
    t12 = *((char **)t6);
    t13 = ((char*)((ng8)));
    xsi_vlog_generic_convert_bit_index(t4, t12, 2, t13, 32, 1);
    t19 = (t4 + 4);
    t7 = *((unsigned int *)t19);
    t37 = (!(t7));
    if (t37 == 1)
        goto LAB65;

LAB66:    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB61;

LAB63:    xsi_vlogvar_wait_assign_value(t28, t29, 0, *((unsigned int *)t30), 1, 0LL);
    goto LAB64;

LAB65:    xsi_vlogvar_wait_assign_value(t2, t3, 0, *((unsigned int *)t4), 1, 0LL);
    goto LAB66;

}

static void Always_96_1(char *t0)
{
    char t4[8];
    char t27[8];
    char t43[8];
    char t59[8];
    char t67[8];
    char t107[16];
    char t108[16];
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
    int t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    char *t71;
    char *t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    char *t81;
    char *t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    int t91;
    int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    char *t105;
    char *t106;
    int t109;
    int t110;
    int t111;
    int t112;
    int t113;

LAB0:    t1 = (t0 + 7008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 7344);
    *((int *)t2) = 1;
    t3 = (t0 + 7040);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(96, ng0);

LAB5:    xsi_set_current_line(97, ng0);
    t5 = (t0 + 2568U);
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

LAB11:    xsi_set_current_line(106, ng0);

LAB14:    xsi_set_current_line(107, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(108, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(109, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(110, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(111, ng0);
    t2 = (t0 + 4568);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);

LAB15:    t6 = ((char*)((ng9)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 7, t6, 7);
    if (t21 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng11)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 7, t2, 7);
    if (t21 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng14)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 7, t2, 7);
    if (t21 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng20)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 7, t2, 7);
    if (t21 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng25)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 7, t2, 7);
    if (t21 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng12)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 7, t2, 7);
    if (t21 == 1)
        goto LAB26;

LAB27:
LAB29:
LAB28:
LAB30:
LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(97, ng0);

LAB13:    xsi_set_current_line(98, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 5368);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 1, 0LL);
    xsi_set_current_line(99, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(100, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3448);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(101, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5688);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(103, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB12;

LAB16:    xsi_set_current_line(112, ng0);

LAB31:    xsi_set_current_line(113, ng0);
    t12 = (t0 + 5048);
    t13 = (t12 + 56U);
    t19 = *((char **)t13);
    t20 = ((char*)((ng2)));
    memset(t4, 0, 8);
    t22 = (t19 + 4);
    t23 = (t20 + 4);
    t7 = *((unsigned int *)t19);
    t8 = *((unsigned int *)t20);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t22);
    t11 = *((unsigned int *)t23);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t22);
    t17 = *((unsigned int *)t23);
    t18 = (t16 | t17);
    t24 = (~(t18));
    t25 = (t15 & t24);
    if (t25 != 0)
        goto LAB35;

LAB32:    if (t18 != 0)
        goto LAB34;

LAB33:    *((unsigned int *)t4) = 1;

LAB35:    memset(t27, 0, 8);
    t28 = (t4 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (~(t29));
    t31 = *((unsigned int *)t4);
    t32 = (t31 & t30);
    t33 = (t32 & 1U);
    if (t33 != 0)
        goto LAB36;

LAB37:    if (*((unsigned int *)t28) != 0)
        goto LAB38;

LAB39:    t35 = (t27 + 4);
    t36 = *((unsigned int *)t27);
    t37 = *((unsigned int *)t35);
    t38 = (t36 || t37);
    if (t38 > 0)
        goto LAB40;

LAB41:    memcpy(t67, t27, 8);

LAB42:    t99 = (t67 + 4);
    t100 = *((unsigned int *)t99);
    t101 = (~(t100));
    t102 = *((unsigned int *)t67);
    t103 = (t102 & t101);
    t104 = (t103 != 0);
    if (t104 > 0)
        goto LAB54;

LAB55:
LAB56:    goto LAB30;

LAB18:    xsi_set_current_line(117, ng0);

LAB58:    xsi_set_current_line(118, ng0);
    t3 = (t0 + 5048);
    t6 = (t3 + 56U);
    t12 = *((char **)t6);
    t13 = ((char*)((ng2)));
    memset(t4, 0, 8);
    t19 = (t12 + 4);
    t20 = (t13 + 4);
    t7 = *((unsigned int *)t12);
    t8 = *((unsigned int *)t13);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t19);
    t11 = *((unsigned int *)t20);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t19);
    t17 = *((unsigned int *)t20);
    t18 = (t16 | t17);
    t24 = (~(t18));
    t25 = (t15 & t24);
    if (t25 != 0)
        goto LAB62;

LAB59:    if (t18 != 0)
        goto LAB61;

LAB60:    *((unsigned int *)t4) = 1;

LAB62:    t23 = (t4 + 4);
    t29 = *((unsigned int *)t23);
    t30 = (~(t29));
    t31 = *((unsigned int *)t4);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB63;

LAB64:
LAB65:    goto LAB30;

LAB20:    xsi_set_current_line(136, ng0);

LAB110:    xsi_set_current_line(137, ng0);
    t3 = (t0 + 5048);
    t6 = (t3 + 56U);
    t12 = *((char **)t6);
    t13 = (t12 + 4);
    t7 = *((unsigned int *)t13);
    t8 = (~(t7));
    t9 = *((unsigned int *)t12);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB111;

LAB112:
LAB113:    goto LAB30;

LAB22:    xsi_set_current_line(170, ng0);

LAB177:    xsi_set_current_line(171, ng0);
    t3 = (t0 + 5048);
    t6 = (t3 + 56U);
    t12 = *((char **)t6);
    t13 = (t12 + 4);
    t7 = *((unsigned int *)t13);
    t8 = (~(t7));
    t9 = *((unsigned int *)t12);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB178;

LAB179:
LAB180:    goto LAB30;

LAB24:    xsi_set_current_line(182, ng0);

LAB201:    xsi_set_current_line(183, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 3608);
    xsi_vlogvar_wait_assign_value(t6, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(184, ng0);
    t2 = (t0 + 5848);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3928);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 16, 0LL);
    xsi_set_current_line(185, ng0);
    t2 = (t0 + 5048);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t6 + 4);
    t7 = *((unsigned int *)t12);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB202;

LAB203:
LAB204:    goto LAB30;

LAB26:    xsi_set_current_line(196, ng0);

LAB214:    xsi_set_current_line(197, ng0);
    t3 = ((char*)((ng1)));
    t6 = (t0 + 3608);
    xsi_vlogvar_wait_assign_value(t6, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(198, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(199, ng0);
    t2 = (t0 + 2728U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t4, 0, 8);
    t6 = (t3 + 4);
    t12 = (t2 + 4);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t2);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t6);
    t11 = *((unsigned int *)t12);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t6);
    t17 = *((unsigned int *)t12);
    t18 = (t16 | t17);
    t24 = (~(t18));
    t25 = (t15 & t24);
    if (t25 != 0)
        goto LAB218;

LAB215:    if (t18 != 0)
        goto LAB217;

LAB216:    *((unsigned int *)t4) = 1;

LAB218:    t19 = (t4 + 4);
    t29 = *((unsigned int *)t19);
    t30 = (~(t29));
    t31 = *((unsigned int *)t4);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB219;

LAB220:
LAB221:    goto LAB30;

LAB34:    t26 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB35;

LAB36:    *((unsigned int *)t27) = 1;
    goto LAB39;

LAB38:    t34 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t34) = 1;
    goto LAB39;

LAB40:    t39 = (t0 + 4728);
    t40 = (t39 + 56U);
    t41 = *((char **)t40);
    t42 = ((char*)((ng10)));
    memset(t43, 0, 8);
    t44 = (t41 + 4);
    t45 = (t42 + 4);
    t46 = *((unsigned int *)t41);
    t47 = *((unsigned int *)t42);
    t48 = (t46 ^ t47);
    t49 = *((unsigned int *)t44);
    t50 = *((unsigned int *)t45);
    t51 = (t49 ^ t50);
    t52 = (t48 | t51);
    t53 = *((unsigned int *)t44);
    t54 = *((unsigned int *)t45);
    t55 = (t53 | t54);
    t56 = (~(t55));
    t57 = (t52 & t56);
    if (t57 != 0)
        goto LAB46;

LAB43:    if (t55 != 0)
        goto LAB45;

LAB44:    *((unsigned int *)t43) = 1;

LAB46:    memset(t59, 0, 8);
    t60 = (t43 + 4);
    t61 = *((unsigned int *)t60);
    t62 = (~(t61));
    t63 = *((unsigned int *)t43);
    t64 = (t63 & t62);
    t65 = (t64 & 1U);
    if (t65 != 0)
        goto LAB47;

LAB48:    if (*((unsigned int *)t60) != 0)
        goto LAB49;

LAB50:    t68 = *((unsigned int *)t27);
    t69 = *((unsigned int *)t59);
    t70 = (t68 & t69);
    *((unsigned int *)t67) = t70;
    t71 = (t27 + 4);
    t72 = (t59 + 4);
    t73 = (t67 + 4);
    t74 = *((unsigned int *)t71);
    t75 = *((unsigned int *)t72);
    t76 = (t74 | t75);
    *((unsigned int *)t73) = t76;
    t77 = *((unsigned int *)t73);
    t78 = (t77 != 0);
    if (t78 == 1)
        goto LAB51;

LAB52:
LAB53:    goto LAB42;

LAB45:    t58 = (t43 + 4);
    *((unsigned int *)t43) = 1;
    *((unsigned int *)t58) = 1;
    goto LAB46;

LAB47:    *((unsigned int *)t59) = 1;
    goto LAB50;

LAB49:    t66 = (t59 + 4);
    *((unsigned int *)t59) = 1;
    *((unsigned int *)t66) = 1;
    goto LAB50;

LAB51:    t79 = *((unsigned int *)t67);
    t80 = *((unsigned int *)t73);
    *((unsigned int *)t67) = (t79 | t80);
    t81 = (t27 + 4);
    t82 = (t59 + 4);
    t83 = *((unsigned int *)t27);
    t84 = (~(t83));
    t85 = *((unsigned int *)t81);
    t86 = (~(t85));
    t87 = *((unsigned int *)t59);
    t88 = (~(t87));
    t89 = *((unsigned int *)t82);
    t90 = (~(t89));
    t91 = (t84 & t86);
    t92 = (t88 & t90);
    t93 = (~(t91));
    t94 = (~(t92));
    t95 = *((unsigned int *)t73);
    *((unsigned int *)t73) = (t95 & t93);
    t96 = *((unsigned int *)t73);
    *((unsigned int *)t73) = (t96 & t94);
    t97 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t97 & t93);
    t98 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t98 & t94);
    goto LAB53;

LAB54:    xsi_set_current_line(113, ng0);

LAB57:    xsi_set_current_line(114, ng0);
    t105 = ((char*)((ng11)));
    t106 = (t0 + 4568);
    xsi_vlogvar_wait_assign_value(t106, t105, 0, 0, 7, 0LL);
    goto LAB56;

LAB61:    t22 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB62;

LAB63:    xsi_set_current_line(118, ng0);

LAB66:    xsi_set_current_line(119, ng0);
    t26 = (t0 + 5208);
    t28 = (t26 + 56U);
    t34 = *((char **)t28);
    t35 = ((char*)((ng2)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_add(t27, 32, t34, 16, t35, 32);
    t39 = (t0 + 5208);
    xsi_vlogvar_wait_assign_value(t39, t27, 0, 0, 16, 0LL);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = ((char*)((ng7)));
    memset(t4, 0, 8);
    t13 = (t6 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB68;

LAB67:    t19 = (t12 + 4);
    if (*((unsigned int *)t19) != 0)
        goto LAB68;

LAB71:    if (*((unsigned int *)t6) < *((unsigned int *)t12))
        goto LAB69;

LAB70:    memset(t27, 0, 8);
    t22 = (t4 + 4);
    t7 = *((unsigned int *)t22);
    t8 = (~(t7));
    t9 = *((unsigned int *)t4);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB72;

LAB73:    if (*((unsigned int *)t22) != 0)
        goto LAB74;

LAB75:    t26 = (t27 + 4);
    t14 = *((unsigned int *)t27);
    t15 = *((unsigned int *)t26);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB76;

LAB77:    memcpy(t67, t27, 8);

LAB78:    t73 = (t67 + 4);
    t85 = *((unsigned int *)t73);
    t86 = (~(t85));
    t87 = *((unsigned int *)t67);
    t88 = (t87 & t86);
    t89 = (t88 != 0);
    if (t89 > 0)
        goto LAB90;

LAB91:
LAB92:    xsi_set_current_line(125, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = ((char*)((ng7)));
    memset(t4, 0, 8);
    t13 = (t6 + 4);
    t19 = (t12 + 4);
    t7 = *((unsigned int *)t6);
    t8 = *((unsigned int *)t12);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t13);
    t11 = *((unsigned int *)t19);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t13);
    t17 = *((unsigned int *)t19);
    t18 = (t16 | t17);
    t24 = (~(t18));
    t25 = (t15 & t24);
    if (t25 != 0)
        goto LAB97;

LAB94:    if (t18 != 0)
        goto LAB96;

LAB95:    *((unsigned int *)t4) = 1;

LAB97:    t22 = (t4 + 4);
    t29 = *((unsigned int *)t22);
    t30 = (~(t29));
    t31 = *((unsigned int *)t4);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB98;

LAB99:
LAB100:    goto LAB65;

LAB68:    t20 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB70;

LAB69:    *((unsigned int *)t4) = 1;
    goto LAB70;

LAB72:    *((unsigned int *)t27) = 1;
    goto LAB75;

LAB74:    t23 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB75;

LAB76:    t28 = (t0 + 4728);
    t34 = (t28 + 56U);
    t35 = *((char **)t34);
    t39 = ((char*)((ng10)));
    memset(t43, 0, 8);
    t40 = (t35 + 4);
    t41 = (t39 + 4);
    t17 = *((unsigned int *)t35);
    t18 = *((unsigned int *)t39);
    t24 = (t17 ^ t18);
    t25 = *((unsigned int *)t40);
    t29 = *((unsigned int *)t41);
    t30 = (t25 ^ t29);
    t31 = (t24 | t30);
    t32 = *((unsigned int *)t40);
    t33 = *((unsigned int *)t41);
    t36 = (t32 | t33);
    t37 = (~(t36));
    t38 = (t31 & t37);
    if (t38 != 0)
        goto LAB80;

LAB79:    if (t36 != 0)
        goto LAB81;

LAB82:    memset(t59, 0, 8);
    t44 = (t43 + 4);
    t46 = *((unsigned int *)t44);
    t47 = (~(t46));
    t48 = *((unsigned int *)t43);
    t49 = (t48 & t47);
    t50 = (t49 & 1U);
    if (t50 != 0)
        goto LAB83;

LAB84:    if (*((unsigned int *)t44) != 0)
        goto LAB85;

LAB86:    t51 = *((unsigned int *)t27);
    t52 = *((unsigned int *)t59);
    t53 = (t51 & t52);
    *((unsigned int *)t67) = t53;
    t58 = (t27 + 4);
    t60 = (t59 + 4);
    t66 = (t67 + 4);
    t54 = *((unsigned int *)t58);
    t55 = *((unsigned int *)t60);
    t56 = (t54 | t55);
    *((unsigned int *)t66) = t56;
    t57 = *((unsigned int *)t66);
    t61 = (t57 != 0);
    if (t61 == 1)
        goto LAB87;

LAB88:
LAB89:    goto LAB78;

LAB80:    *((unsigned int *)t43) = 1;
    goto LAB82;

LAB81:    t42 = (t43 + 4);
    *((unsigned int *)t43) = 1;
    *((unsigned int *)t42) = 1;
    goto LAB82;

LAB83:    *((unsigned int *)t59) = 1;
    goto LAB86;

LAB85:    t45 = (t59 + 4);
    *((unsigned int *)t59) = 1;
    *((unsigned int *)t45) = 1;
    goto LAB86;

LAB87:    t62 = *((unsigned int *)t67);
    t63 = *((unsigned int *)t66);
    *((unsigned int *)t67) = (t62 | t63);
    t71 = (t27 + 4);
    t72 = (t59 + 4);
    t64 = *((unsigned int *)t27);
    t65 = (~(t64));
    t68 = *((unsigned int *)t71);
    t69 = (~(t68));
    t70 = *((unsigned int *)t59);
    t74 = (~(t70));
    t75 = *((unsigned int *)t72);
    t76 = (~(t75));
    t21 = (t65 & t69);
    t91 = (t74 & t76);
    t77 = (~(t21));
    t78 = (~(t91));
    t79 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t79 & t77);
    t80 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t80 & t78);
    t83 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t83 & t77);
    t84 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t84 & t78);
    goto LAB89;

LAB90:    xsi_set_current_line(120, ng0);

LAB93:    xsi_set_current_line(121, ng0);
    t81 = ((char*)((ng2)));
    t82 = (t0 + 5368);
    xsi_vlogvar_wait_assign_value(t82, t81, 0, 0, 1, 0LL);
    xsi_set_current_line(122, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(123, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 4568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 7, 0LL);
    goto LAB92;

LAB96:    t20 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB97;

LAB98:    xsi_set_current_line(125, ng0);

LAB101:    xsi_set_current_line(126, ng0);
    t23 = (t0 + 4728);
    t26 = (t23 + 56U);
    t28 = *((char **)t26);
    t34 = ((char*)((ng13)));
    memset(t27, 0, 8);
    t35 = (t28 + 4);
    t39 = (t34 + 4);
    t36 = *((unsigned int *)t28);
    t37 = *((unsigned int *)t34);
    t38 = (t36 ^ t37);
    t46 = *((unsigned int *)t35);
    t47 = *((unsigned int *)t39);
    t48 = (t46 ^ t47);
    t49 = (t38 | t48);
    t50 = *((unsigned int *)t35);
    t51 = *((unsigned int *)t39);
    t52 = (t50 | t51);
    t53 = (~(t52));
    t54 = (t49 & t53);
    if (t54 != 0)
        goto LAB105;

LAB102:    if (t52 != 0)
        goto LAB104;

LAB103:    *((unsigned int *)t27) = 1;

LAB105:    t41 = (t27 + 4);
    t55 = *((unsigned int *)t41);
    t56 = (~(t55));
    t57 = *((unsigned int *)t27);
    t61 = (t57 & t56);
    t62 = (t61 != 0);
    if (t62 > 0)
        goto LAB106;

LAB107:    xsi_set_current_line(128, ng0);

LAB109:    xsi_set_current_line(129, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(130, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 4568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 7, 0LL);

LAB108:    xsi_set_current_line(132, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    goto LAB100;

LAB104:    t40 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t40) = 1;
    goto LAB105;

LAB106:    xsi_set_current_line(127, ng0);
    t42 = ((char*)((ng14)));
    t44 = (t0 + 4568);
    xsi_vlogvar_wait_assign_value(t44, t42, 0, 0, 7, 0LL);
    goto LAB108;

LAB111:    xsi_set_current_line(137, ng0);

LAB114:    xsi_set_current_line(138, ng0);
    t19 = (t0 + 5208);
    t20 = (t19 + 56U);
    t22 = *((char **)t20);
    t23 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t22, 16, t23, 32);
    t26 = (t0 + 5208);
    xsi_vlogvar_wait_assign_value(t26, t4, 0, 0, 16, 0LL);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = ((char*)((ng7)));
    memset(t4, 0, 8);
    t13 = (t6 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB116;

LAB115:    t19 = (t12 + 4);
    if (*((unsigned int *)t19) != 0)
        goto LAB116;

LAB119:    if (*((unsigned int *)t6) < *((unsigned int *)t12))
        goto LAB117;

LAB118:    t22 = (t4 + 4);
    t7 = *((unsigned int *)t22);
    t8 = (~(t7));
    t9 = *((unsigned int *)t4);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB120;

LAB121:    xsi_set_current_line(141, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = ((char*)((ng15)));
    memset(t4, 0, 8);
    t13 = (t6 + 4);
    t19 = (t12 + 4);
    t7 = *((unsigned int *)t6);
    t8 = *((unsigned int *)t12);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t13);
    t11 = *((unsigned int *)t19);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t13);
    t17 = *((unsigned int *)t19);
    t18 = (t16 | t17);
    t24 = (~(t18));
    t25 = (t15 & t24);
    if (t25 != 0)
        goto LAB126;

LAB123:    if (t18 != 0)
        goto LAB125;

LAB124:    *((unsigned int *)t4) = 1;

LAB126:    t22 = (t4 + 4);
    t29 = *((unsigned int *)t22);
    t30 = (~(t29));
    t31 = *((unsigned int *)t4);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB127;

LAB128:    xsi_set_current_line(143, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = ((char*)((ng18)));
    memset(t4, 0, 8);
    t13 = (t6 + 4);
    t19 = (t12 + 4);
    t7 = *((unsigned int *)t6);
    t8 = *((unsigned int *)t12);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t13);
    t11 = *((unsigned int *)t19);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t13);
    t17 = *((unsigned int *)t19);
    t18 = (t16 | t17);
    t24 = (~(t18));
    t25 = (t15 & t24);
    if (t25 != 0)
        goto LAB135;

LAB132:    if (t18 != 0)
        goto LAB134;

LAB133:    *((unsigned int *)t4) = 1;

LAB135:    t22 = (t4 + 4);
    t29 = *((unsigned int *)t22);
    t30 = (~(t29));
    t31 = *((unsigned int *)t4);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB136;

LAB137:
LAB138:
LAB129:
LAB122:    goto LAB113;

LAB116:    t20 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB118;

LAB117:    *((unsigned int *)t4) = 1;
    goto LAB118;

LAB120:    xsi_set_current_line(140, ng0);
    t23 = (t0 + 4728);
    t26 = (t23 + 56U);
    t28 = *((char **)t26);
    t34 = (t0 + 5528);
    t35 = (t34 + 56U);
    t39 = *((char **)t35);
    xsi_vlog_get_part_select_value(t108, 40, t39, 39, 0);
    xsi_vlogtype_concat(t107, 48, 48, 2U, t108, 40, t28, 8);
    t40 = (t0 + 5528);
    xsi_vlogvar_wait_assign_value(t40, t107, 0, 0, 48, 0LL);
    goto LAB122;

LAB125:    t20 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB126;

LAB127:    xsi_set_current_line(142, ng0);
    t23 = (t0 + 4728);
    t26 = (t23 + 56U);
    t28 = *((char **)t26);
    t34 = (t0 + 5688);
    t35 = (t0 + 5688);
    t39 = (t35 + 72U);
    t40 = *((char **)t39);
    t41 = ((char*)((ng16)));
    t42 = ((char*)((ng17)));
    xsi_vlog_convert_partindices(t27, t43, t59, ((int*)(t40)), 2, t41, 32, 1, t42, 32, 1);
    t44 = (t27 + 4);
    t36 = *((unsigned int *)t44);
    t21 = (!(t36));
    t45 = (t43 + 4);
    t37 = *((unsigned int *)t45);
    t91 = (!(t37));
    t92 = (t21 && t91);
    t58 = (t59 + 4);
    t38 = *((unsigned int *)t58);
    t109 = (!(t38));
    t110 = (t92 && t109);
    if (t110 == 1)
        goto LAB130;

LAB131:    goto LAB129;

LAB130:    t46 = *((unsigned int *)t59);
    t111 = (t46 + 0);
    t47 = *((unsigned int *)t27);
    t48 = *((unsigned int *)t43);
    t112 = (t47 - t48);
    t113 = (t112 + 1);
    xsi_vlogvar_wait_assign_value(t34, t28, t111, *((unsigned int *)t43), t113, 0LL);
    goto LAB131;

LAB134:    t20 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB135;

LAB136:    xsi_set_current_line(143, ng0);

LAB139:    xsi_set_current_line(144, ng0);
    t23 = (t0 + 4728);
    t26 = (t23 + 56U);
    t28 = *((char **)t26);
    t34 = (t0 + 5688);
    t35 = (t0 + 5688);
    t39 = (t35 + 72U);
    t40 = *((char **)t39);
    t41 = ((char*)((ng8)));
    t42 = ((char*)((ng1)));
    xsi_vlog_convert_partindices(t27, t43, t59, ((int*)(t40)), 2, t41, 32, 1, t42, 32, 1);
    t44 = (t27 + 4);
    t36 = *((unsigned int *)t44);
    t21 = (!(t36));
    t45 = (t43 + 4);
    t37 = *((unsigned int *)t45);
    t91 = (!(t37));
    t92 = (t21 && t91);
    t58 = (t59 + 4);
    t38 = *((unsigned int *)t58);
    t109 = (!(t38));
    t110 = (t92 && t109);
    if (t110 == 1)
        goto LAB140;

LAB141:    xsi_set_current_line(145, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(146, ng0);
    t2 = (t0 + 5528);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = ((char*)((ng19)));
    xsi_vlog_unsigned_equal(t107, 48, t6, 48, t12, 48);
    t13 = (t107 + 4);
    t7 = *((unsigned int *)t13);
    t8 = (~(t7));
    t9 = *((unsigned int *)t107);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB142;

LAB143:    xsi_set_current_line(149, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB144:    xsi_set_current_line(150, ng0);
    t2 = (t0 + 5688);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    memset(t4, 0, 8);
    t12 = (t4 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (t7 >> 8);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t13);
    t10 = (t9 >> 8);
    *((unsigned int *)t12) = t10;
    t11 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t11 & 255U);
    t14 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t14 & 255U);
    t19 = ((char*)((ng21)));
    memset(t27, 0, 8);
    t20 = (t4 + 4);
    t22 = (t19 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t19);
    t17 = (t15 ^ t16);
    t18 = *((unsigned int *)t20);
    t24 = *((unsigned int *)t22);
    t25 = (t18 ^ t24);
    t29 = (t17 | t25);
    t30 = *((unsigned int *)t20);
    t31 = *((unsigned int *)t22);
    t32 = (t30 | t31);
    t33 = (~(t32));
    t36 = (t29 & t33);
    if (t36 != 0)
        goto LAB148;

LAB145:    if (t32 != 0)
        goto LAB147;

LAB146:    *((unsigned int *)t27) = 1;

LAB148:    t26 = (t27 + 4);
    t37 = *((unsigned int *)t26);
    t38 = (~(t37));
    t46 = *((unsigned int *)t27);
    t47 = (t46 & t38);
    t48 = (t47 != 0);
    if (t48 > 0)
        goto LAB149;

LAB150:
LAB151:    xsi_set_current_line(154, ng0);
    t2 = (t0 + 5688);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    memset(t4, 0, 8);
    t12 = (t4 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (t7 >> 8);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t13);
    t10 = (t9 >> 8);
    *((unsigned int *)t12) = t10;
    t11 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t11 & 255U);
    t14 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t14 & 255U);
    t19 = ((char*)((ng22)));
    memset(t27, 0, 8);
    t20 = (t4 + 4);
    t22 = (t19 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t19);
    t17 = (t15 ^ t16);
    t18 = *((unsigned int *)t20);
    t24 = *((unsigned int *)t22);
    t25 = (t18 ^ t24);
    t29 = (t17 | t25);
    t30 = *((unsigned int *)t20);
    t31 = *((unsigned int *)t22);
    t32 = (t30 | t31);
    t33 = (~(t32));
    t36 = (t29 & t33);
    if (t36 != 0)
        goto LAB156;

LAB153:    if (t32 != 0)
        goto LAB155;

LAB154:    *((unsigned int *)t27) = 1;

LAB156:    t26 = (t27 + 4);
    t37 = *((unsigned int *)t26);
    t38 = (~(t37));
    t46 = *((unsigned int *)t27);
    t47 = (t46 & t38);
    t48 = (t47 != 0);
    if (t48 > 0)
        goto LAB157;

LAB158:
LAB159:    xsi_set_current_line(158, ng0);
    t2 = (t0 + 5688);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    memset(t4, 0, 8);
    t12 = (t4 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (t7 >> 8);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t13);
    t10 = (t9 >> 8);
    *((unsigned int *)t12) = t10;
    t11 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t11 & 255U);
    t14 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t14 & 255U);
    t19 = ((char*)((ng23)));
    memset(t27, 0, 8);
    t20 = (t4 + 4);
    t22 = (t19 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t19);
    t17 = (t15 ^ t16);
    t18 = *((unsigned int *)t20);
    t24 = *((unsigned int *)t22);
    t25 = (t18 ^ t24);
    t29 = (t17 | t25);
    t30 = *((unsigned int *)t20);
    t31 = *((unsigned int *)t22);
    t32 = (t30 | t31);
    t33 = (~(t32));
    t36 = (t29 & t33);
    if (t36 != 0)
        goto LAB164;

LAB161:    if (t32 != 0)
        goto LAB163;

LAB162:    *((unsigned int *)t27) = 1;

LAB164:    t26 = (t27 + 4);
    t37 = *((unsigned int *)t26);
    t38 = (~(t37));
    t46 = *((unsigned int *)t27);
    t47 = (t46 & t38);
    t48 = (t47 != 0);
    if (t48 > 0)
        goto LAB165;

LAB166:
LAB167:    xsi_set_current_line(163, ng0);
    t2 = (t0 + 5688);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    memset(t4, 0, 8);
    t12 = (t4 + 4);
    t13 = (t6 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (t7 >> 8);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t13);
    t10 = (t9 >> 8);
    *((unsigned int *)t12) = t10;
    t11 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t11 & 255U);
    t14 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t14 & 255U);
    t19 = ((char*)((ng24)));
    memset(t27, 0, 8);
    t20 = (t4 + 4);
    t22 = (t19 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t19);
    t17 = (t15 ^ t16);
    t18 = *((unsigned int *)t20);
    t24 = *((unsigned int *)t22);
    t25 = (t18 ^ t24);
    t29 = (t17 | t25);
    t30 = *((unsigned int *)t20);
    t31 = *((unsigned int *)t22);
    t32 = (t30 | t31);
    t33 = (~(t32));
    t36 = (t29 & t33);
    if (t36 != 0)
        goto LAB172;

LAB169:    if (t32 != 0)
        goto LAB171;

LAB170:    *((unsigned int *)t27) = 1;

LAB172:    t26 = (t27 + 4);
    t37 = *((unsigned int *)t26);
    t38 = (~(t37));
    t46 = *((unsigned int *)t27);
    t47 = (t46 & t38);
    t48 = (t47 != 0);
    if (t48 > 0)
        goto LAB173;

LAB174:
LAB175:    goto LAB138;

LAB140:    t46 = *((unsigned int *)t59);
    t111 = (t46 + 0);
    t47 = *((unsigned int *)t27);
    t48 = *((unsigned int *)t43);
    t112 = (t47 - t48);
    t113 = (t112 + 1);
    xsi_vlogvar_wait_assign_value(t34, t28, t111, *((unsigned int *)t43), t113, 0LL);
    goto LAB141;

LAB142:    xsi_set_current_line(147, ng0);
    t19 = ((char*)((ng20)));
    t20 = (t0 + 4568);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 7, 0LL);
    goto LAB144;

LAB147:    t23 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB148;

LAB149:    xsi_set_current_line(150, ng0);

LAB152:    xsi_set_current_line(151, ng0);
    t28 = ((char*)((ng1)));
    t34 = (t0 + 4088);
    xsi_vlogvar_wait_assign_value(t34, t28, 0, 0, 1, 0LL);
    xsi_set_current_line(152, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB151;

LAB155:    t23 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB156;

LAB157:    xsi_set_current_line(154, ng0);

LAB160:    xsi_set_current_line(155, ng0);
    t28 = ((char*)((ng2)));
    t34 = (t0 + 4088);
    xsi_vlogvar_wait_assign_value(t34, t28, 0, 0, 1, 0LL);
    xsi_set_current_line(156, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB159;

LAB163:    t23 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB164;

LAB165:    xsi_set_current_line(158, ng0);

LAB168:    xsi_set_current_line(159, ng0);
    t28 = ((char*)((ng12)));
    t34 = (t0 + 4568);
    xsi_vlogvar_wait_assign_value(t34, t28, 0, 0, 7, 0LL);
    xsi_set_current_line(160, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(161, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB167;

LAB171:    t23 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB172;

LAB173:    xsi_set_current_line(163, ng0);

LAB176:    xsi_set_current_line(164, ng0);
    t28 = ((char*)((ng12)));
    t34 = (t0 + 4568);
    xsi_vlogvar_wait_assign_value(t34, t28, 0, 0, 7, 0LL);
    xsi_set_current_line(165, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB175;

LAB178:    xsi_set_current_line(171, ng0);

LAB181:    xsi_set_current_line(172, ng0);
    t19 = (t0 + 5208);
    t20 = (t19 + 56U);
    t22 = *((char **)t20);
    t23 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t22, 16, t23, 32);
    t26 = (t0 + 5208);
    xsi_vlogvar_wait_assign_value(t26, t4, 0, 0, 16, 0LL);
    xsi_set_current_line(173, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = ((char*)((ng1)));
    memset(t4, 0, 8);
    t13 = (t6 + 4);
    t19 = (t12 + 4);
    t7 = *((unsigned int *)t6);
    t8 = *((unsigned int *)t12);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t13);
    t11 = *((unsigned int *)t19);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t13);
    t17 = *((unsigned int *)t19);
    t18 = (t16 | t17);
    t24 = (~(t18));
    t25 = (t15 & t24);
    if (t25 != 0)
        goto LAB185;

LAB182:    if (t18 != 0)
        goto LAB184;

LAB183:    *((unsigned int *)t4) = 1;

LAB185:    t22 = (t4 + 4);
    t29 = *((unsigned int *)t22);
    t30 = (~(t29));
    t31 = *((unsigned int *)t4);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB186;

LAB187:    xsi_set_current_line(175, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = ((char*)((ng2)));
    memset(t4, 0, 8);
    t13 = (t6 + 4);
    t19 = (t12 + 4);
    t7 = *((unsigned int *)t6);
    t8 = *((unsigned int *)t12);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t13);
    t11 = *((unsigned int *)t19);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t13);
    t17 = *((unsigned int *)t19);
    t18 = (t16 | t17);
    t24 = (~(t18));
    t25 = (t15 & t24);
    if (t25 != 0)
        goto LAB194;

LAB191:    if (t18 != 0)
        goto LAB193;

LAB192:    *((unsigned int *)t4) = 1;

LAB194:    t22 = (t4 + 4);
    t29 = *((unsigned int *)t22);
    t30 = (~(t29));
    t31 = *((unsigned int *)t4);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB195;

LAB196:
LAB197:
LAB188:    goto LAB180;

LAB184:    t20 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB185;

LAB186:    xsi_set_current_line(174, ng0);
    t23 = (t0 + 4728);
    t26 = (t23 + 56U);
    t28 = *((char **)t26);
    t34 = (t0 + 5848);
    t35 = (t0 + 5848);
    t39 = (t35 + 72U);
    t40 = *((char **)t39);
    t41 = ((char*)((ng16)));
    t42 = ((char*)((ng17)));
    xsi_vlog_convert_partindices(t27, t43, t59, ((int*)(t40)), 2, t41, 32, 1, t42, 32, 1);
    t44 = (t27 + 4);
    t36 = *((unsigned int *)t44);
    t21 = (!(t36));
    t45 = (t43 + 4);
    t37 = *((unsigned int *)t45);
    t91 = (!(t37));
    t92 = (t21 && t91);
    t58 = (t59 + 4);
    t38 = *((unsigned int *)t58);
    t109 = (!(t38));
    t110 = (t92 && t109);
    if (t110 == 1)
        goto LAB189;

LAB190:    goto LAB188;

LAB189:    t46 = *((unsigned int *)t59);
    t111 = (t46 + 0);
    t47 = *((unsigned int *)t27);
    t48 = *((unsigned int *)t43);
    t112 = (t47 - t48);
    t113 = (t112 + 1);
    xsi_vlogvar_wait_assign_value(t34, t28, t111, *((unsigned int *)t43), t113, 0LL);
    goto LAB190;

LAB193:    t20 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB194;

LAB195:    xsi_set_current_line(175, ng0);

LAB198:    xsi_set_current_line(176, ng0);
    t23 = (t0 + 4728);
    t26 = (t23 + 56U);
    t28 = *((char **)t26);
    t34 = (t0 + 5848);
    t35 = (t0 + 5848);
    t39 = (t35 + 72U);
    t40 = *((char **)t39);
    t41 = ((char*)((ng8)));
    t42 = ((char*)((ng1)));
    xsi_vlog_convert_partindices(t27, t43, t59, ((int*)(t40)), 2, t41, 32, 1, t42, 32, 1);
    t44 = (t27 + 4);
    t36 = *((unsigned int *)t44);
    t21 = (!(t36));
    t45 = (t43 + 4);
    t37 = *((unsigned int *)t45);
    t91 = (!(t37));
    t92 = (t21 && t91);
    t58 = (t59 + 4);
    t38 = *((unsigned int *)t58);
    t109 = (!(t38));
    t110 = (t92 && t109);
    if (t110 == 1)
        goto LAB199;

LAB200:    xsi_set_current_line(177, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(178, ng0);
    t2 = ((char*)((ng25)));
    t3 = (t0 + 4568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 7, 0LL);
    goto LAB197;

LAB199:    t46 = *((unsigned int *)t59);
    t111 = (t46 + 0);
    t47 = *((unsigned int *)t27);
    t48 = *((unsigned int *)t43);
    t112 = (t47 - t48);
    t113 = (t112 + 1);
    xsi_vlogvar_wait_assign_value(t34, t28, t111, *((unsigned int *)t43), t113, 0LL);
    goto LAB200;

LAB202:    xsi_set_current_line(185, ng0);

LAB205:    xsi_set_current_line(186, ng0);
    t13 = (t0 + 5208);
    t19 = (t13 + 56U);
    t20 = *((char **)t19);
    t22 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t20, 16, t22, 32);
    t23 = (t0 + 5208);
    xsi_vlogvar_wait_assign_value(t23, t4, 0, 0, 16, 0LL);
    xsi_set_current_line(187, ng0);
    t2 = (t0 + 4728);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 3448);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 8, 0LL);
    xsi_set_current_line(188, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(189, ng0);
    t2 = (t0 + 5208);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 5848);
    t13 = (t12 + 56U);
    t19 = *((char **)t13);
    t20 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_minus(t4, 32, t19, 16, t20, 32);
    memset(t27, 0, 8);
    t22 = (t6 + 4);
    t23 = (t4 + 4);
    t7 = *((unsigned int *)t6);
    t8 = *((unsigned int *)t4);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t22);
    t11 = *((unsigned int *)t23);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t22);
    t17 = *((unsigned int *)t23);
    t18 = (t16 | t17);
    t24 = (~(t18));
    t25 = (t15 & t24);
    if (t25 != 0)
        goto LAB209;

LAB206:    if (t18 != 0)
        goto LAB208;

LAB207:    *((unsigned int *)t27) = 1;

LAB209:    t28 = (t27 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (~(t29));
    t31 = *((unsigned int *)t27);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB210;

LAB211:
LAB212:    goto LAB204;

LAB208:    t26 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB209;

LAB210:    xsi_set_current_line(189, ng0);

LAB213:    xsi_set_current_line(190, ng0);
    t34 = ((char*)((ng12)));
    t35 = (t0 + 4568);
    xsi_vlogvar_wait_assign_value(t35, t34, 0, 0, 7, 0LL);
    xsi_set_current_line(191, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(192, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB212;

LAB217:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB218;

LAB219:    xsi_set_current_line(200, ng0);
    t20 = ((char*)((ng9)));
    t22 = (t0 + 4568);
    xsi_vlogvar_wait_assign_value(t22, t20, 0, 0, 7, 0LL);
    goto LAB221;

}


extern void work_m_16567664446884120176_2901397797_init()
{
	static char *pe[] = {(void *)Always_63_0,(void *)Always_96_1};
	xsi_register_didat("work_m_16567664446884120176_2901397797", "isim/Ultrasonic_Radar_Top_isim_beh.exe.sim/work/m_16567664446884120176_2901397797.didat");
	xsi_register_executes(pe);
}
