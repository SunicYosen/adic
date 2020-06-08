* .title 32-bit adder test
* Read vector input and drive adder

*------------------------------------------------
* Parameters and models
*------------------------------------------------
.lib     "../../ptm_mg_lib/lib/models" ptm7lstp
.include adder32_kogge_stone.sp

.vec     stimulus.vect
.global  vdd gnd
.temp    25.0
.options post=2 nomod
.param   invnfinn=1
.param   beta=1

*------------------------------------------------
* Test Circuit Netlist
*------------------------------------------------
** Driver
Vdd1 vdd gnd 'vdd'
VClk clk gnd pulse 0 'vdd' 10ps 10ps 10ps 500ps 1000ps

** Circuit
Xadder32 A[0]  A[1]  A[2]  A[3]  A[4]  A[5]  A[6]  A[7]  A[8]  A[9] 
+        A[10] A[11] A[12] A[13] A[14] A[15] A[16] A[17] A[18] A[19]
+        A[20] A[21] A[22] A[23] A[24] A[25] A[26] A[27] A[28] A[29] 
+        A[30] A[31]
+        B[0]  B[1]  B[2]  B[3]  B[4]  B[5]  B[6]  B[7]  B[8]  B[9] 
+        B[10] B[11] B[12] B[13] B[14] B[15] B[16] B[17] B[18] B[19]
+        B[20] B[21] B[22] B[23] B[24] B[25] B[26] B[27] B[28] B[29] 
+        B[30] B[31]
+        S[0]  S[1]  S[2]  S[3]  S[4]  S[5]  S[6]  S[7]
+        S[8]  S[9]  S[10] S[11] S[12] S[13] S[14] S[15]
+        S[16] S[17] S[18] S[19] S[20] S[21] S[22] S[23]
+        S[24] S[25] S[26] S[27] S[28] S[29] S[30] S[31]
+        clk   c32   adder32

** Load 16 inv


*------------------------------------------------
*  Optimization setup
*------------------------------------------------
.op all

*------------------------------------------------
* Simulation
*------------------------------------------------
.tran 10ps 5ns

.end
