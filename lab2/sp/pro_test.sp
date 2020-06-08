* .title Propagation test

*------------------------------------------------
* Libs and sub-circuits
*------------------------------------------------
.lib "../../ptm_mg_lib/lib/models" ptm7lstp
.include pro_dynamic.sp
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
VClk clk    gnd  pulse 0 'vdd' 10ps  10ps  10ps  100ps 200ps
VinA in_a   gnd  pulse 0 'vdd' 100ps 100ps 100ps 400ps 1ns
VinB in_b   gnd  pulse 0 'vdd' 100ps 100ps 100ps 900ps 2ns
** Circuit
Xinva in_a  ina_n inv
Xinvb in_b  inb_n inv
Xpro  clk   in_a  in_b ina_n inb_n out pro
** Load 2 inv
Xinvl out   outinv        inv l=lg nfinn=4 beta=1

*------------------------------------------------
*  Optimization setup
*------------------------------------------------
.op all

*------------------------------------------------
* Simulation
*------------------------------------------------
.tran 1ps 4ns

.end
