* .title Generator test

*------------------------------------------------
* Libs and sub-circuits
*------------------------------------------------
.lib "../../ptm_mg_lib/lib/models" ptm7lstp
.include xor2_static.sp
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
VinA in_a   gnd  pulse 0 'vdd' 10ps  10ps  10ps  490ps 1ns
VinB in_b   gnd  pulse 0 'vdd' 10ps  10ps  10ps  990ps 2ns

** Circuit
Xor2 in_a in_b out xor2

** Load 2 inv
Xinvl out   outinv inv l=lg nfinn=10 beta=1

*------------------------------------------------
*  Optimization setup
*------------------------------------------------
.op all

*------------------------------------------------
* Simulation
*------------------------------------------------
.tran 1ps 4ns

.end
