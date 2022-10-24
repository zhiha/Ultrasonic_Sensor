gui_open_window Wave
gui_sg_create PLL_WIFI_group
gui_list_add_group -id Wave.1 {PLL_WIFI_group}
gui_sg_addsignal -group PLL_WIFI_group {PLL_WIFI_tb.test_phase}
gui_set_radix -radix {ascii} -signals {PLL_WIFI_tb.test_phase}
gui_sg_addsignal -group PLL_WIFI_group {{Input_clocks}} -divider
gui_sg_addsignal -group PLL_WIFI_group {PLL_WIFI_tb.CLK_IN1}
gui_sg_addsignal -group PLL_WIFI_group {{Output_clocks}} -divider
gui_sg_addsignal -group PLL_WIFI_group {PLL_WIFI_tb.dut.clk}
gui_list_expand -id Wave.1 PLL_WIFI_tb.dut.clk
gui_sg_addsignal -group PLL_WIFI_group {{Status_control}} -divider
gui_sg_addsignal -group PLL_WIFI_group {PLL_WIFI_tb.RESET}
gui_sg_addsignal -group PLL_WIFI_group {PLL_WIFI_tb.LOCKED}
gui_sg_addsignal -group PLL_WIFI_group {{Counters}} -divider
gui_sg_addsignal -group PLL_WIFI_group {PLL_WIFI_tb.COUNT}
gui_sg_addsignal -group PLL_WIFI_group {PLL_WIFI_tb.dut.counter}
gui_list_expand -id Wave.1 PLL_WIFI_tb.dut.counter
gui_zoom -window Wave.1 -full
