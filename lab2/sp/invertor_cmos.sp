* .title Invertor sub circuit

*------------------------------------------------
* Invertor Sub-Circuit
*------------------------------------------------
.SUBCKT inv invin invout l=lg nfinn=1 beta=1
Xmp1 invout invin vdd vdd pfet l='l' nfin='nfinn*beta'
Xmn2 invout invin gnd gnd nfet l='l' nfin='nfinn'
.ENDS
