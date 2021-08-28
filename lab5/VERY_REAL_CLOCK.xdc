###################################################################################
# Mentor Graphics Corporation
#
###################################################################################


################
# create clock #
################

# Precision Generated
create_clock -period 10.000 -name CLK -waveform {0.000 5.000} [get_ports CLK]
create_clock -period 10.000 -name VirtualClock -waveform {0.000 5.000}

###################
# set input delay #
###################

# Precision Generated
set_input_delay -clock [get_clocks VirtualClock] -add_delay 0.000 [get_ports {ADDRS* DATA_IN* LOAD RST TEST_MODE}]

####################
# set output delay #
####################

# Precision Generated
set_output_delay -clock [get_clocks VirtualClock] -add_delay 0.000 [get_ports {ANODE_OUT* B_SEG_OUT* CATHODE_OUT SSD_SEG_OUT*}]


set_property PACKAGE_PIN W5 [get_ports CLK]
set_property IOSTANDARD LVCMOS33 [get_ports CLK]
set_property PACKAGE_PIN U18 [get_ports RST]
set_property IOSTANDARD LVCMOS33 [get_ports RST]
set_property PACKAGE_PIN T17 [get_ports TEST_MODE]
set_property IOSTANDARD LVCMOS33 [get_ports TEST_MODE]
set_property PACKAGE_PIN W4 [get_ports {ANODE_OUT[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ANODE_OUT[0]}]
set_property PACKAGE_PIN V4 [get_ports {ANODE_OUT[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ANODE_OUT[1]}]
set_property PACKAGE_PIN U2 [get_ports {ANODE_OUT[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ANODE_OUT[2]}]
set_property PACKAGE_PIN U4 [get_ports {ANODE_OUT[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ANODE_OUT[3]}]
set_property PACKAGE_PIN W6 [get_ports {B_SEG_OUT[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B_SEG_OUT[0]}]
set_property PACKAGE_PIN W7 [get_ports {B_SEG_OUT[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B_SEG_OUT[1]}]
set_property PACKAGE_PIN U5 [get_ports {B_SEG_OUT[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B_SEG_OUT[2]}]
set_property PACKAGE_PIN V5 [get_ports {B_SEG_OUT[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B_SEG_OUT[3]}]
set_property PACKAGE_PIN U8 [get_ports {B_SEG_OUT[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B_SEG_OUT[4]}]
set_property PACKAGE_PIN V8 [get_ports {B_SEG_OUT[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B_SEG_OUT[5]}]
set_property PACKAGE_PIN U7 [get_ports {B_SEG_OUT[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B_SEG_OUT[6]}]
set_property PACKAGE_PIN P18 [get_ports CATHODE_OUT]
set_property IOSTANDARD LVCMOS33 [get_ports CATHODE_OUT]
set_property PACKAGE_PIN B16 [get_ports {SSD_SEG_OUT[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SSD_SEG_OUT[0]}]
set_property PACKAGE_PIN K17 [get_ports {SSD_SEG_OUT[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SSD_SEG_OUT[1]}]
set_property PACKAGE_PIN B15 [get_ports {SSD_SEG_OUT[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SSD_SEG_OUT[2]}]
set_property PACKAGE_PIN A14 [get_ports {SSD_SEG_OUT[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SSD_SEG_OUT[3]}]
set_property PACKAGE_PIN A16 [get_ports {SSD_SEG_OUT[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SSD_SEG_OUT[4]}]
set_property PACKAGE_PIN N17 [get_ports {SSD_SEG_OUT[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SSD_SEG_OUT[5]}]
set_property PACKAGE_PIN M18 [get_ports {SSD_SEG_OUT[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SSD_SEG_OUT[6]}]
set_property PACKAGE_PIN J3 [get_ports {ADDRS[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ADDRS[0]}]
set_property PACKAGE_PIN L3 [get_ports {ADDRS[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ADDRS[1]}]
set_property PACKAGE_PIN M2 [get_ports {DATA_IN[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DATA_IN[0]}]
set_property PACKAGE_PIN N2 [get_ports {DATA_IN[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DATA_IN[1]}]
set_property PACKAGE_PIN K3 [get_ports {DATA_IN[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DATA_IN[2]}]
set_property PACKAGE_PIN M3 [get_ports {DATA_IN[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DATA_IN[3]}]
set_property PACKAGE_PIN M1 [get_ports {DATA_IN[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DATA_IN[4]}]
set_property PACKAGE_PIN N1 [get_ports {DATA_IN[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DATA_IN[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports LOAD]
set_property PACKAGE_PIN W19 [get_ports LOAD]
