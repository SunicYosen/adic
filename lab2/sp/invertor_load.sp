* .title Invertor sub circuit

*------------------------------------------------
* Invertor load Sub-Circuit
*------------------------------------------------
.SUBCKT invl invin invout vdd l=lg nfinn=16 beta=1
Xmp1 invout invin vdd vdd pfet l='l' nfin='nfinn*beta'
Xmn2 invout invin gnd gnd nfet l='l' nfin='nfinn'
.ENDS