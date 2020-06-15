* .title block 3 test

*------------------------------------------------
* Libs and sub-circuits
*------------------------------------------------
.lib "../../ptm_mg_lib/lib/models" ptm7lstp
.include block_3.sp
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
Vdd1  vdd    gnd  'vdd'
VClk  clk    gnd  pulse 0 'vdd' 100ps 100ps 100ps 500ps 1ns
VinP0 in_p0  gnd  pulse 0 'vdd' 100ps 100ps 100ps 500ps 1ns
VinP1 in_p1  gnd  pulse 0 'vdd' 200ps 100ps 100ps 400ps 1ns
VinP2 in_p2  gnd  pulse 0 'vdd' 300ps 100ps 100ps 300ps 1ns
VinG0 in_g0  gnd  pulse 0 'vdd' 300ps 100ps 100ps 300ps 1ns
VinG1 in_g1  gnd  pulse 0 'vdd' 400ps 100ps 100ps 200ps 1ns
VinG2 in_g2  gnd  pulse 0 'vdd' 500ps 100ps 100ps 100ps 1ns

** Circuit
Xblk2  clk   in_p0 in_p1 in_p2 in_g0 in_g1 in_g2 gout pout blk3
** Load inv
Xinvlg gout   outinvp   inv l=lg nfinn=4 beta=1
Xinvlp pout   outinvg   inv l=lg nfinn=4 beta=1

*------------------------------------------------
*  Optimization setup
*------------------------------------------------
.op all

*------------------------------------------------
* Simulation
*------------------------------------------------
.tran 1ps 4ns

.end
