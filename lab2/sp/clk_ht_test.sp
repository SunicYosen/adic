* .title Clock tree test

*------------------------------------------------
* Libs and sub-circuits
*------------------------------------------------
.lib "../../ptm_mg_lib/lib/models" ptm7lstp
.include clk_ht.sp
.include invertor_cmos.sp

*------------------------------------------------
* Parameters
*------------------------------------------------
.global  vdd gnd
.temp    25.0
.options post=2 nomod

*------------------------------------------------
* Test Circuit Netlist
*------------------------------------------------
** Driver
Vdd1 vdd    gnd  'vdd'
VClk clk    gnd  pulse 0 'vdd' 100ps 100ps 100ps 400ps 1ns

** Circuit
Xclk clk clkout0 clkout1 clkout2 clkout3 clk_ht nfinn=4 beta=1
** Load inv
Xinvl0 clkout0   outinv        inv l=lg nfinn=16 beta=1
Xinvl1 clkout1   outinv        inv l=lg nfinn=16 beta=1
Xinvl2 clkout2   outinv        inv l=lg nfinn=16 beta=1
Xinvl3 clkout3   outinv        inv l=lg nfinn=16 beta=1

*------------------------------------------------
*  Optimization setup
*------------------------------------------------
.op all

*------------------------------------------------
* Simulation
*------------------------------------------------
.tran 1ps 4ns

.end
