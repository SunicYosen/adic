* .title Carry Propagation by dynamic

*------------------------------------------------
* Sub-circuit
*------------------------------------------------
.SUBCKT pro clk   ina  inb  ina_n inb_n pout l=lg  nfinn=3     pfinn=1 inv_beta=1
Xmp0 pout_n clk   vdd  vdd  pfet  l='l' nfin='pfinn'
Xmp1 pout_n pout  vdd  vdd  pfet  l='l' nfin='pfinn'
Xmn0 pout_n ina_n p1   gnd  nfet  l='l' nfin='nfinn'
Xmn1 p1     inb   pc   gnd  nfet  l='l' nfin='nfinn'
Xmn2 pout_n inb_n p2   gnd  nfet  l='l' nfin='nfinn'
Xmn3 p2     ina   pc   gnd  nfet  l='l' nfin='nfinn'
Xmn4 pc     clk   gnd  gnd  nfet  l='l' nfin='nfinn'
Xinv pout_n pout            inv   l="l" nfinn='nfinn*2' beta='inv_beta'
.ENDS