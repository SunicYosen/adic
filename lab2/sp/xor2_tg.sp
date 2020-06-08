* .title 2-input xor by Transmission Gate

*------------------------------------------------
* Sub-circuit
*------------------------------------------------
.SUBCKT xor2   ina inb out  l=lg  nfinn=2        pfinn=1 inv_beta=1
Xmp0 out_n ina vdd vdd pfet l='l' nfin='pfinn'
Xmn1 out_n ina inb gnd nfet l='l' nfin='nfinn'
Xmn2 out_n inb ina gnd nfet l='l' nfin='nfinn'
Xinv out_n out         inv  l="l" nfinn='nfinn'  beta='inv_beta'
.ENDS
