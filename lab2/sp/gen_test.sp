* .title Generator test

*------------------------------------------------
* Libs and sub-circuits
*------------------------------------------------
.lib "../../ptm_mg_lib/lib/models" ptm7lstp
.include gen_dynamic.sp
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
VinA in_a   gnd  pulse 0 'vdd' 100ps 100ps 100ps 400ps 1ns
VinB in_b   gnd  pulse 0 'vdd' 100ps 100ps 100ps 900ps 2ns
** Circuit
Xgen  clk   in_a in_b out gen
** Load inv
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
