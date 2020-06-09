* .title 32-bit adder test
* Read vector input and drive adder

*------------------------------------------------
* Parameters and models
*------------------------------------------------
.lib     "../../ptm_mg_lib/lib/models" ptm7lstp
.vec     stimulus.vect
.global  vdd gnd
.temp    25.0
.options post=2 nomod

*------------------------------------------------
* Sub-Circuits
*------------------------------------------------
.include adder32_kogge_stone.sp
.include invertor_load.sp

*------------------------------------------------
* Test Circuit Netlist
*------------------------------------------------
** Drive Circuits
Vddd vdd  gnd 'vdd'
VClk clk  gnd pulse 0 'vdd' 10ps 10ps 10ps 500ps 1000ps

** Drive Load
Vddl vddl gnd 'vdd'

** Circuit DUT
Xadder32 A[0]  A[1]  A[2]  A[3]  A[4]  A[5]  A[6]  A[7]
+        A[8]  A[9]  A[10] A[11] A[12] A[13] A[14] A[15]
+        A[16] A[17] A[18] A[19] A[20] A[21] A[22] A[23] 
+        A[24] A[25] A[26] A[27] A[28] A[29] A[30] A[31]
+        B[0]  B[1]  B[2]  B[3]  B[4]  B[5]  B[6]  B[7]  
+        B[8]  B[9]  B[10] B[11] B[12] B[13] B[14] B[15]
+        B[16] B[17] B[18] B[19] B[20] B[21] B[22] B[23]
+        B[24] B[25] B[26] B[27] B[28] B[29] B[30] B[31]
+        S[0]  S[1]  S[2]  S[3]  S[4]  S[5]  S[6]  S[7]
+        S[8]  S[9]  S[10] S[11] S[12] S[13] S[14] S[15]
+        S[16] S[17] S[18] S[19] S[20] S[21] S[22] S[23]
+        S[24] S[25] S[26] S[27] S[28] S[29] S[30] S[31]
+        clk   c32   adder32

** Load 16-inv
* .SUBCKT invl invin invout vdd l=lg nfinn=16 beta=1
Xinvl00  S[0]  S_N[0]  vddl invl
Xinvl01  S[1]  S_N[1]  vddl invl
Xinvl02  S[2]  S_N[2]  vddl invl
Xinvl03  S[3]  S_N[3]  vddl invl
Xinvl04  S[4]  S_N[4]  vddl invl
Xinvl05  S[5]  S_N[5]  vddl invl
Xinvl06  S[6]  S_N[6]  vddl invl
Xinvl07  S[7]  S_N[7]  vddl invl
Xinvl08  S[8]  S_N[8]  vddl invl
Xinvl09  S[9]  S_N[9]  vddl invl
Xinvl10  S[10] S_N[10] vddl invl
Xinvl11  S[11] S_N[11] vddl invl
Xinvl12  S[12] S_N[12] vddl invl
Xinvl13  S[13] S_N[13] vddl invl
Xinvl14  S[14] S_N[14] vddl invl
Xinvl15  S[15] S_N[15] vddl invl
Xinvl16  S[16] S_N[16] vddl invl
Xinvl17  S[17] S_N[17] vddl invl
Xinvl18  S[18] S_N[18] vddl invl
Xinvl19  S[19] S_N[19] vddl invl
Xinvl20  S[20] S_N[20] vddl invl
Xinvl21  S[21] S_N[21] vddl invl
Xinvl22  S[22] S_N[22] vddl invl
Xinvl23  S[23] S_N[23] vddl invl
Xinvl24  S[24] S_N[24] vddl invl
Xinvl25  S[25] S_N[25] vddl invl
Xinvl26  S[26] S_N[26] vddl invl
Xinvl27  S[27] S_N[27] vddl invl
Xinvl28  S[28] S_N[28] vddl invl
Xinvl29  S[29] S_N[29] vddl invl
Xinvl30  S[30] S_N[30] vddl invl
Xinvl31  S[31] S_N[31] vddl invl
Xinvl32  c32   c32_n   vddl invl

*------------------------------------------------
*  Optimization setup
*------------------------------------------------
.op all

*------------------------------------------------
* Simulation
*------------------------------------------------
.tran 10ps 5ns

.end
