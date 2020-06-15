* .title Carry Generrator by dynamic

*------------------------------------------------
* Sub-circuit
*------------------------------------------------
.SUBCKT gen clk  ina  inb  gout l=lg  nfinn=4 pfinn=1 inv_beta=1
Xmp0 gout_n clk  vdd  vdd  pfet l='l' nfin='pfinn'
Xmp1 p_ab   clk  vdd  vdd  pfet l='l' nfin='pfinn'
Xmp2 gout_n gout vdd  vdd  pfet l='l' nfin='pfinn'
Xmn0 gout_n ina  p_ab gnd  nfet l='l' nfin='nfinn'
Xmn1 p_ab   inb  p_cb gnd  nfet l='l' nfin='nfinn'
Xmn2 p_cb   clk  gnd  gnd  nfet l='l' nfin='nfinn'
Xinv gout_n gout           inv  l="l" nfinn='nfinn*2'  beta='inv_beta'
.ENDS