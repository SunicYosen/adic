* .title 4-input block operation by dynamic

*------------------------------------------------
* Sub-circuit
*------------------------------------------------
.SUBCKT blk4 clk  p0    p1   p2   p3    g0             g1  g2  g3  gout  pout  l=lg nfinn=4 pfinn=1 inv_beta=1
Xmp0  gout_n clk  vdd   vdd  pfet l='l' nfin='pfinn'
Xmp1  gout_n gout vdd   vdd  pfet l='l' nfin='pfinn'
Xmp2  p_p01  clk  vdd   vdd  pfet l='l' nfin='pfinn'
Xmp3  p_p12  clk  vdd   vdd  pfet l='l' nfin='pfinn'
Xmp4  p_p23  clk  vdd   vdd  pfet l='l' nfin='pfinn'
Xmp5  pout_n clk  vdd   vdd  pfet l='l' nfin='pfinn'
Xmp6  pout_n pout vdd   vdd  pfet l='l' nfin='pfinn'
Xmn0  gout_n g3   gnd   gnd  nfet l='l' nfin='nfinn'
Xmn1  gout_n g2   p_p23 gnd  nfet l='l' nfin='nfinn'
Xmn2  gout_n g1   p_p12 gnd  nfet l='l' nfin='nfinn'
Xmn3  gout_n g0   p_p01 gnd  nfet l='l' nfin='nfinn'
Xmn4  pout_n p0   p_p01 gnd  nfet l='l' nfin='nfinn'
Xmn5  p_p01  p1   p_p12 gnd  nfet l='l' nfin='nfinn'
Xmn6  p_p12  p2   p_p23 gnd  nfet l='l' nfin='nfinn'
Xmn7  p_p23  p3   gnd   gnd  nfet l='l' nfin='nfinn'
Xinv0 gout_n gout            inv  l="l" nfinn='nfinn*2'  beta='inv_beta'
Xinv1 pout_n pout            inv  l="l" nfinn='nfinn*2'  beta='inv_beta'
.ENDS