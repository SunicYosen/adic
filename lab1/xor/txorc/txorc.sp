* .title xor

*------------------------------------------------
* Parameters and models
*------------------------------------------------
.lib "../../../ptm_mg_lib/lib/models" ptm7hp
.global  vdd gnd
.temp    25.0
.options post
.param   trant  =10ns
.param   pulset_a =1ns
.param   pulset_b =2ns
.param   pulset_c =4ns


*------------------------------------------------
* Invertor Sub-Circuit
*------------------------------------------------
.SUBCKT inv invin invout l=lg nfinn=1 beta=1
Xmp1 invout invin vdd vdd pfet l='l' nfin='nfinn*beta'
Xmn2 invout invin gnd gnd nfet l='l' nfin='nfinn'
.ENDS

.SUBCKT invl invin invout vddl l=lg nfinn=1 beta=1
Xmp1 invout  invin vddl vddl pfet l='l' nfin='nfinn*beta'
Xmn2 invout  invin gnd  gnd  nfet l='l' nfin='nfinn'
.ENDS


*------------------------------------------------
* Circuit Netlist
*------------------------------------------------
* Driver
*----------------
Vdd1 vdd    gnd  'vdd'
Vddl vddl   gnd  'vdd'
VinA in_a   gnd  pulse 0 'vdd' 100ps 100ps 100ps 400ps 'pulset_a'
VinB in_b   gnd  pulse 0 'vdd' 100ps 100ps 100ps 900ps 'pulset_b'
VinC in_c   gnd  pulse 0 'vdd' 100ps 100ps 100ps 1900ps 'pulset_c'

*----------------
* Logic
*----------------
x1 in_b in_a a   vdd pfet nfin=2
x2 in_a in_b a   vdd pfet nfin=2
x3 in_c a    b   vdd pfet nfin=2
x4 a    in_c b   vdd pfet nfin=2

x5 in_b in_a c   gnd nfet nfin=2
x6 in_a in_b c   gnd nfet nfin=2
x7 in_c c    b   gnd nfet nfin=2
x8 c    in_c b   gnd nfet nfin=2

x9 b    outn    inv nfinn=8 beta=1
xa outn out     inv nfinn=16 beta=1

* Load
Xload out end vddl invl nfinn=16 beta=1

*------------------------------------------------
* Simulation
*------------------------------------------------
.tran 1fs 'trant'
.op all

*------------------------------------------------
* OUTPUT
*------------------------------------------------

*------------------------------------------------
* Measure
*------------------------------------------------
*     abc
* in: 000 -> 111 
* out:0   -> 1
.measure tran tp000111
+ trig v(in_a) val='vdd/2' td=4ns rise=1
+ targ v(out)  val='vdd/2' rise=1

*     abc
* in: 111 -> 011 
* out:1   -> 0
.measure tran tp111011
+ trig v(in_a) val='vdd/2' td=4n fall=1
+ targ v(out)  val='vdd/2' fall=1

*     abc
* in: 101 -> 001 
* out:0   -> 1
.measure tran tp101001 
+ trig v(in_a) val='vdd/2' td=5n fall=1
+ targ v(out)  val='vdd/2' rise=1

*     abc
* in: 001 -> 110 
* out:1   -> 0
.measure tran tp001110 
+ trig v(in_a) val='vdd/2' td=6n rise=1
+ targ v(out)  val='vdd/2' fall=1

*     abc
* in: 110 -> 010 
* out:0   -> 1
.measure tran tp110010 
+ trig v(in_a) val='vdd/2' td=6n fall=1
+ targ v(out)  val='vdd/2' rise=1

*     abc
* in: 100 -> 000 
* out:1   -> 0
.measure tran tp100000 
+ trig v(in_a) val='vdd/2' td=7n fall=1
+ targ v(out)  val='vdd/2' fall=1

.measure tpavg_ns param="(abs(tp000111)+abs(tp111011)+abs(tp101001)+abs(tp001110)+abs(tp110010)+abs(tp100000)) / 6"

.measure area_m2 param="2 * (2 * fin_height + fin_width) * lg * 26"

.measure pwr_w avg '-p(vdd1)' from=4ns to=8ns
.measure pdp param='pwr_w * pulset_a / 2'
.measure edp param='pdp * tpavg_ns'

.end
