
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:052

00:00:062	
520.1372	
135.902Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/utils_1/imports/synth_1/CPU.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2x
vC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/utils_1/imports/synth_1/CPU.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
_
Command: %s
53*	vivadotcl2.
,synth_design -top CPU -part xc7s25csga324-1QZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
y
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2
xc7s25Z17-347h px� 
i
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2
xc7s25Z17-349h px� 
E
Loading part %s157*device2
xc7s25csga324-1QZ21-403h px� 
[
$Part: %s does not have CEAM library.966*device2
xc7s25csga324-1QZ21-9227h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
17296Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:03 . Memory (MB): peak = 1355.422 ; gain = 448.461
h px� 
�
synthesizing module '%s'638*oasys2
CPU2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
88@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ProgramCounter2D
BC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/pc.vhd2
52
cpu_program_counter2
ProgramCounter2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
1938@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
ProgramCounter2F
BC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/pc.vhd2
148@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ProgramCounter2
02
12F
BC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/pc.vhd2
148@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
RegisterFile2I
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
52
cpu_registerfile2
RegisterFile2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
1998@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
RegisterFile2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
268@Z8-638h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2

reset_in2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
318@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
RegisterFile2
02
12K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
268@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
Decoder2r
pC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Decoder.vhd2
42
cpu_decoder2	
Decoder2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
2178@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2	
Decoder2t
pC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Decoder.vhd2
188@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2	
Decoder2
02
12t
pC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Decoder.vhd2
188@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ALU2E
CC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/ALU.vhd2
52	
cpu_alu2
ALU2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
2298@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
ALU2G
CC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/ALU.vhd2
178@Z8-638h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2

reset_in2G
CC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/ALU.vhd2
208@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ALU2
02
12G
CC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/ALU.vhd2
178@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
RAM2E
CC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RAM.vhd2
52	
cpu_ram2
RAM2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
2388@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
RAM2G
CC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RAM.vhd2
178@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
RAM2
02
12G
CC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RAM.vhd2
178@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ROM2E
CC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/ROM.vhd2
52	
cpu_rom2
ROM2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
2488@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
ROM2G
CC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/ROM.vhd2
148@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ROM2
02
12G
CC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/ROM.vhd2
148@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Control_Unit_STM2w
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
42
cpu_control_unit_stm2
Control_Unit_STM2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
2558@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Control_Unit_STM2y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
168@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Control_Unit_STM2
02
12y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
168@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Control_Unit_PIPE2w
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
542
cpu_control_unit_pipeline2
Control_Unit_PIPE2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
2648@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Control_Unit_PIPE2y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
978@Z8-638h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2	
toggle22y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
1868@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Control_Unit_PIPE2
02
12y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
978@Z8-256h px� 
�
&ignoring unsynthesizable construct: %s312*oasys2!
wait statement with no conditon2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
2998@Z8-312h px� 
�
&ignoring unsynthesizable construct: %s312*oasys2!
wait statement with no conditon2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
3078@Z8-312h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
CPU2
02
12p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
88@Z8-256h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
ROM_enable_m_out_reg2F
BC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/pc.vhd2
318@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
enable_ALU_m_out_reg2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
398@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
RAM_enable_s_out_reg2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
598@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
DEC_buffer_enable_out_reg2t
pC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Decoder.vhd2
348@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
opcode_temp_reg2t
pC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Decoder.vhd2
258@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
REG_enable_l_out_reg2G
CC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RAM.vhd2
278@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
ROM_buffer_enable_out_reg2G
CC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/ROM.vhd2
358@Z8-6014h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
	reset_out2
Control_Unit_STM2y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
78@Z8-3848h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
enable_PC_m_out_reg2y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
1448@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
enable_DEC_m_out_reg2y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
1738@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
toggle2_reg2y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
1708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
enable_RAM_l_out_reg2y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
2188@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
enable_RAM_l_out_reg2y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
2188@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
execute_reg_1_reg2y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
2438@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
writeback_reg_1_reg2y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
2648@Z8-6014h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
	reset_out2
Control_Unit_PIPE2y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
588@Z8-3848h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2t
rC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd-193.42
1st2 
cpu_control_unit_stm/reset_out2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
1938@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2t
rC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd-193.42
2nd2
GND2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
1938@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2t
rC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd-193.42p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
1938@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2t
rC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd-199.42
1st2 
cpu_control_unit_stm/reset_out2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
1998@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2t
rC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd-199.42
2nd2
GND2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
1998@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2t
rC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd-199.42p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
1998@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2t
rC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd-217.42
1st2 
cpu_control_unit_stm/reset_out2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
2178@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2t
rC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd-217.42
2nd2
GND2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
2178@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2t
rC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd-217.42p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
2178@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2t
rC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd-229.42
1st2 
cpu_control_unit_stm/reset_out2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
2298@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2t
rC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd-229.42
2nd2
GND2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
2298@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2t
rC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd-229.42p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
2298@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2t
rC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd-238.42
1st2 
cpu_control_unit_stm/reset_out2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
2388@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2t
rC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd-238.42
2nd2
GND2p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
2388@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2t
rC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd-238.42p
lC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/CPU.vhd2
2388@Z8-6858h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
	reset_out2
Control_Unit_PIPEZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
enable_fet_in2
Control_Unit_PIPEZ8-7129h px� 
|
9Port %s in module %s is either unconnected or has no load4866*oasys2
	reset_out2
Control_Unit_STMZ8-7129h px� 
n
9Port %s in module %s is either unconnected or has no load4866*oasys2

reset_in2
RAMZ8-7129h px� 
n
9Port %s in module %s is either unconnected or has no load4866*oasys2

reset_in2
ALUZ8-7129h px� 
r
9Port %s in module %s is either unconnected or has no load4866*oasys2

reset_in2	
DecoderZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1469.602 ; gain = 562.641
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1469.602 ; gain = 562.641
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1469.602 ; gain = 562.641
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0072

1469.6022
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2w
sC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/constrs_1/new/Settings_1.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2w
sC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/constrs_1/new/Settings_1.xdc8Z20-178h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1523.5742
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0072

1523.5742
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 1523.574 ; gain = 616.613
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Loading part: xc7s25csga324-1Q
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 1523.574 ; gain = 616.613
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 1523.574 ; gain = 616.613
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
t
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2
Control_Unit_STMZ8-802h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_file_reg[0]2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
348@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_file_reg[1]2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
348@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_file_reg[2]2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
348@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_file_reg[3]2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
348@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_file_reg[4]2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
348@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_file_reg[5]2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
348@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_file_reg[6]2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
348@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_file_reg[7]2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
348@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_file_reg[8]2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
348@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_file_reg[9]2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
348@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_file_reg[10]2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
348@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_file_reg[11]2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
348@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_file_reg[12]2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
348@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_file_reg[13]2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
348@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_file_reg[14]2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
348@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
reg_file_reg[15]2K
GC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/RegFile.vhd2
348@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
enable_fet_reg2y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
358@Z8-327h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                   fetch |                             0001 |                               00
h p
x
� 
y
%s
*synth2a
_                  decode |                             0010 |                               01
h p
x
� 
y
%s
*synth2a
_                 execute |                             0100 |                               10
h p
x
� 
y
%s
*synth2a
_               writeback |                             1000 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2	
one-hot2
Control_Unit_STMZ8-3354h px� 
�
!inferring latch for variable '%s'327*oasys2
enable_dec_reg2y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
388@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
enable_exe_reg2y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
418@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
enable_wb_reg2y
uC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.srcs/sources_1/new/Control_Unit.vhd2
448@Z8-327h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:08 ; elapsed = 00:00:10 . Memory (MB): peak = 1523.574 ; gain = 616.613
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   3 Input   16 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit       Adders := 1     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input     16 Bit         XORs := 1     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               16 Bit    Registers := 15    
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 4     
h p
x
� 
H
%s
*synth20
.	                7 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 17    
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 13    
h p
x
� 
&
%s
*synth2
+---RAMs : 
h p
x
� 
X
%s
*synth2@
>	               4K Bit	(256 X 16 bit)          RAMs := 1     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	  13 Input   16 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	  13 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 19    
h p
x
� 
F
%s
*synth2.
,	  13 Input    1 Bit        Muxes := 1     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
o
%s
*synth2W
UPart Resources:
DSPs: 80 (col length:40)
BRAMs: 90 (col length: RAMB18 40 RAMB36 20)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[0][15]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[0][14]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[0][13]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[0][12]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[0][11]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[0][10]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[0][9]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[0][8]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[0][7]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[0][6]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[0][5]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[0][4]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[0][3]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[0][2]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[0][1]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[0][0]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[1][15]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[1][14]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[1][13]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[1][12]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[1][11]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[1][10]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[1][9]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[1][8]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[1][7]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[1][6]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[1][5]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[1][4]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[1][3]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[1][2]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[1][1]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[1][0]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[2][15]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[2][14]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[2][13]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[2][12]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[2][11]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[2][10]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[2][9]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[2][8]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[2][7]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[2][6]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[2][5]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[2][4]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[2][3]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[2][2]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[2][1]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[2][0]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[3][15]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[3][14]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[3][13]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[3][12]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[3][11]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[3][10]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[3][9]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[3][8]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[3][7]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[3][6]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[3][5]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[3][4]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[3][3]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[3][2]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[3][1]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[3][0]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[4][15]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[4][14]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[4][13]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[4][12]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[4][11]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[4][10]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[4][9]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[4][8]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[4][7]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[4][6]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[4][5]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[4][4]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[4][3]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[4][2]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[4][1]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[4][0]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[5][15]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[5][14]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[5][13]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[5][12]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[5][11]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[5][10]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[5][9]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[5][8]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[5][7]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[5][6]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[5][5]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[5][4]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[5][3]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[5][2]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[5][1]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpu_registerfile/reg_file_reg[5][0]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[6][15]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[6][14]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[6][13]__12
CPUZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpu_registerfile/reg_file_reg[6][12]__12
CPUZ8-3332h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-33322
100Z17-14h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1523.574 ; gain = 616.613
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1523.574 ; gain = 616.613
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1523.574 ; gain = 616.613
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1523.574 ; gain = 616.613
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:15 ; elapsed = 00:00:17 . Memory (MB): peak = 1523.574 ; gain = 616.613
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:15 ; elapsed = 00:00:17 . Memory (MB): peak = 1523.574 ; gain = 616.613
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:15 ; elapsed = 00:00:17 . Memory (MB): peak = 1523.574 ; gain = 616.613
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:15 ; elapsed = 00:00:17 . Memory (MB): peak = 1523.574 ; gain = 616.613
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:15 ; elapsed = 00:00:17 . Memory (MB): peak = 1523.574 ; gain = 616.613
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:15 ; elapsed = 00:00:17 . Memory (MB): peak = 1523.574 ; gain = 616.613
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
+
%s*synth2
+-+-----+------+
h px� 
+
%s*synth2
| |Cell |Count |
h px� 
+
%s*synth2
+-+-----+------+
h px� 
+
%s*synth2
+-+-----+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:15 ; elapsed = 00:00:17 . Memory (MB): peak = 1523.574 ; gain = 616.613
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
b
%s
*synth2J
HSynthesis finished with 0 errors, 0 critical warnings and 285 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:10 ; elapsed = 00:00:16 . Memory (MB): peak = 1523.574 ; gain = 562.641
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:15 ; elapsed = 00:00:17 . Memory (MB): peak = 1523.574 ; gain = 616.613
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1523.5742
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1523.5742
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

14f2f8d6Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
482
1482
152
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:182

00:00:202

1523.5742	
994.281Z17-268h px� 
c
%s6*runtcl2G
ESynthesis results are not added to the cache due to CRITICAL_WARNING
h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2h
fC:/Users/jankr/Documents/DHBW/FPGA/16_Bit_Risc/FPGA_Project/16Bit_RISC/16Bit_RISC.runs/synth_1/CPU.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2Q
Oreport_utilization -file CPU_utilization_synth.rpt -pb CPU_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Sun Dec  1 22:46:47 2024Z17-206h px� 


End Record