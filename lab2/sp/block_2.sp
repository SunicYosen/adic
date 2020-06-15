* .title 2-input block operation by dynamic

*------------------------------------------------
* Sub-circuit
*------------------------------------------------
.SUBCKT blk2 clk  p0   p1   g0   g1    gout          pout l=lg nfinn=3 pfinn=1 inv_beta=1
Xmp0  gout_n clk  vdd  vdd  pfet l='l' nfin='pfinn'
Xmp1  gout_n gout vdd  vdd  pfet l='l' nfin='pfinn'
Xmp2  p_bp   clk  vdd  vdd  pfet l='l' nfin='pfinn'
Xmp3  pout_n clk  vdd  vdd  pfet l='l' nfin='pfinn'
Xmp4  pout_n pout vdd  vdd  pfet l='l' nfin='pfinn'
Xmn0  gout_n g1   gnd  gnd  nfet l='l' nfin='nfinn'
Xmn1  gout_n g0   p_bp gnd  nfet l='l' nfin='nfinn'
Xmn2  pout_n p0   p_bp gnd  nfet l='l' nfin='nfinn'
Xmn3  p_bp   p1   gnd  gnd  nfet l='l' nfin='nfinn'
Xinv0 gout_n gout           inv  l="l" nfinn='nfinn*2'  beta='inv_beta'
Xinv1 pout_n pout           inv  l="l" nfinn='nfinn*2'  beta='inv_beta'
.ENDS