* .title 3-input block operation by dynamic


*------------------------------------------------
* Sub-circuit
*------------------------------------------------
.SUBCKT blk3 clk p0 p1 p2 g0 g1 g2 gout pout l=lg nfinn=3 pfinn=1 inv_beta=1
Xmp0  gout_n clk  vdd   vdd  pfet l='l' nfin='pfinn'
Xmp1  gout_n gout vdd   vdd  pfet l='l' nfin='pfinn'
Xmp2  p_p01  clk  vdd   vdd  pfet l='l' nfin='pfinn'
Xmp3  p_p12  clk  vdd   vdd  pfet l='l' nfin='pfinn'
Xmp4  pout_n clk  vdd   vdd  pfet l='l' nfin='pfinn'
Xmp5  pout_n pout vdd   vdd  pfet l='l' nfin='pfinn'
Xmn0  gout_n g2   gnd   gnd  nfet l='l' nfin='nfinn'
Xmn1  gout_n g1   p_p12 gnd  nfet l='l' nfin='nfinn'
Xmn2  gout_n g0   p_p01 gnd  nfet l='l' nfin='nfinn'
Xmn3  pout_n p0   p_p01 gnd  nfet l='l' nfin='nfinn'
Xmn4  p_p01  p1   p_p12 gnd  nfet l='l' nfin='nfinn'
Xmn5  p_p12  p2   gnd   gnd  nfet l='l' nfin='nfinn'
Xinv0 gout_n gout            inv  l="l" nfinn='nfinn'  beta='inv_beta'
Xinv1 pout_n pout            inv  l="l" nfinn='nfinn'  beta='inv_beta'
.ENDS