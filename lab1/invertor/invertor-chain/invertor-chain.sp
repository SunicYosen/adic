* .title Invertor cap

*------------------------------------------------
* Parameters and models
*------------------------------------------------
.lib "../../../ptm_mg_lib/lib/models" ptm7hp
.global  vdd gnd
.temp    25.0
.options post
.param   invnfinn=1
.param   beta=1
.param   f=4

*------------------------------------------------
* Invertor Sub-Circuit
*------------------------------------------------
.SUBCKT inv invin invout l=lg nfinn=1 beta=1
Xmp1 invout invin vdd vdd pfet l='l' nfin='nfinn*beta'
Xmn2 invout invin gnd gnd nfet l='l' nfin='nfinn'
.ENDS

*------------------------------------------------
* Circuit Netlist
*------------------------------------------------
Vdd1     vdd  gnd  'vdd'
Vin1     a    gnd  pulse 0 'vdd' 100ps 100ps 100ps 400ps 1000ps
*------------------------------------------------
* N=4
*------------------------------------------------
X1       a    b    inv   l=lg    nfinn=1      beta='beta'
X2       b    c    inv   l=lg    nfinn='f'    beta='beta'
X3       c    d    inv   l=lg    nfinn='f**2' beta='beta'
X4       d    e    inv   l=lg    nfinn='f**3' beta='beta'
* Load
X6       e    f    inv   l=lg    nfinn=120   beta='beta'
* LOAD of Load
X7       f    g    inv   l=lg    nfinn=480   beta='beta'

*------------------------------------------------
* N=3
*------------------------------------------------
* X1       a    b    inv   l=lg    nfinn=1      beta='beta'
* X2       b    c    inv   l=lg    nfinn='f'    beta='beta'
* X3       c    e    inv   l=lg    nfinn='f**2' beta='beta'
* * Load
* X6       e    f    inv   l=lg    nfinn=120   beta='beta'
* * LOAD of Load
* X7       f    g    inv   l=lg    nfinn=480   beta='beta'


*------------------------------------------------
* Stimulus
*------------------------------------------------
.tran 1ps 20ns sweep f 3 4 1


*------------------------------------------------
* Measure
*------------------------------------------------
.measure tplh
+ TRIG v(a) VAL='vdd/2' FALL=1
+ TARG v(e) VAL='vdd/2' RISE=1


.measure tphl
+ TRIG v(a) VAL='vdd/2' RISE=1
+ TARG v(e) VAL='vdd/2' FALL=1

.measure tp param="(tphl + tplh)/2"

.end
