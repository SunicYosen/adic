* .title com cmos xor

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
x1 a in_a vdd vdd pfet l=lg nfin=2
x2 a in_b vdd vdd pfet l=lg nfin=2
x3 b in_c a   vdd pfet l=lg nfin=2
x4 b in_c c   gnd nfet l=lg nfin=2
x5 c in_a gnd gnd nfet l=lg nfin=2 
x6 c in_b gnd gnd nfet l=lg nfin=2

x7 d in_b vdd vdd pfet l=lg nfin=2
x8 b in_a d   vdd pfet l=lg nfin=2
x9 b in_a e   gnd nfet l=lg nfin=2
xa e in_b gnd gnd nfet l=lg nfin=2

xb f in_a vdd vdd pfet l=lg nfin=2
xc f in_b vdd vdd pfet l=lg nfin=2
xd f in_c vdd vdd pfet l=lg nfin=2
xe g b    f   vdd pfet l=lg nfin=2
xf g b    h   gnd nfet l=lg nfin=2
xg h in_a gnd gnd nfet l=lg nfin=2 
xh h in_b gnd gnd nfet l=lg nfin=2
xi h in_c gnd gnd nfet l=lg nfin=2

xj i in_a vdd vdd pfet l=lg nfin=2
xk j in_b i   vdd pfet l=lg nfin=2
xl g in_c j   vdd pfet l=lg nfin=2
xm g in_c k   gnd nfet l=lg nfin=2
xn k in_b l   gnd nfet l=lg nfin=2
xo l in_a gnd gnd nfet l=lg nfin=2

xp g out  inv  nfinn=2  beta=1

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
