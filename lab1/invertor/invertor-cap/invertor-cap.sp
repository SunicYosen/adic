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
.param   Cdelay=1f

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
X1       a    b    inv   l=lg    nfinn=1     beta='beta'
X2       b    c    inv   l=lg    nfinn=4     beta='beta'
X3       c    d    inv   l=lg    nfinn=8     beta='beta'
* x1 
* X4       d    e    inv   l=lg    nfinn=1     beta='beta'
* X5       e    f    inv   l=lg    nfinn=4     beta='beta'
* x4
* X4       d    e    inv   l=lg    nfinn=4     beta='beta'
* X5       e    f    inv   l=lg    nfinn=16    beta='beta'
* x16
* X4       d    e    inv   l=lg    nfinn=16    beta='beta'
* X5       e    f    inv   l=lg    nfinn=64    beta='beta'
* 32
X4       d    e    inv   l=lg    nfinn=32    beta='beta'
X5       e    f    inv   l=lg    nfinn=128    beta='beta'
X6       c    g    inv   l=lg    nfinn=8     beta='beta'
Cd       g    gnd  'Cdelay'

*------------------------------------------------
* Optimization Setup
*------------------------------------------------
.measure errorR param='invR - capR' goal=0
.measure errorF param='invF - capF' goal=0
.param   Cdelay=optrange(4f, 0.01f, 10.0f)
.model   optmod opt itropt=1000
.measure Cdel   param = 'Cdelay'

*------------------------------------------------
* Stimulus
*------------------------------------------------
.tran 1ps 20ns SWEEP OPTIMIZE = optrange
+   RESULTS=errorR,errorF MODEL=optmod


*------------------------------------------------
* Measure
*------------------------------------------------
.measure invR
+ TRIG v(c) VAL='vdd/2' FALL=1
+ TARG v(d) VAL='vdd/2' RISE=1

.measure capR
+ TRIG v(c) VAL='vdd/2' FALL=1
+ TARG v(g) VAL='vdd/2' RISE=1

.measure invF
+ TRIG v(c) VAL='vdd/2' RISE=1
+ TARG v(d) VAL='vdd/2' FALL=1
 
.measure capF
+ TRIG v(c) VAL='vdd/2' RISE=1
+ TARG v(g) VAL='vdd/2' FALL=1

.end
