* .title 2-input xor by Dynamic

*------------------------------------------------
* Sub-circuit
*------------------------------------------------
.SUBCKT xor2 ina inb out l=lg  nfinn=4 pfinn=4 inv_beta=1
Xinv0 ina ina_n inv  l="l" nfinn='nfinn'  beta='inv_beta'
Xinv1 inb inb_n inv  l="l" nfinn='nfinn'  beta='inv_beta'
Xmp0  p1  ina_n vdd  vdd pfet l='l' nfin='pfinn'
Xmp1  out inb   p1   vdd pfet l='l' nfin='pfinn'
Xmp2  p2  ina   vdd  vdd pfet l='l' nfin='pfinn'
Xmp3  out inb_n p2   vdd pfet l='l' nfin='pfinn'
Xmn0  p3  ina   gnd  gnd nfet l='l' nfin='nfinn'
Xmn1  out inb   p3   gnd nfet l='l' nfin='nfinn'
Xmn2  p4  ina_n gnd  gnd nfet l='l' nfin='nfinn'
Xmn3  out inb_n p4   gnd nfet l='l' nfin='nfinn'
.ENDS
