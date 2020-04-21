* .title Invertor sub circuit

*------------------------------------------------
* Parameters and models
*------------------------------------------------
.lib "../../../ptm_mg_lib/lib/models" ptm7hp
.global  vdd gnd
.temp    25.0
.options post=2 nomod
.param   invnfinn=1
.param   beta=1

*------------------------------------------------
* Invertor Sub-Circuit
*------------------------------------------------
.SUBCKT inv invin invout l=lg nfinn=1 beta=2
Xmp1 invout invin vdd vdd pfet l='l' nfin='nfinn*beta'
Xmn2 invout invin gnd gnd nfet l='l' nfin='nfinn'
.ENDS

*------------------------------------------------
* Circuit Netlist
*------------------------------------------------
Vdd1     vdd  gnd  'vdd'
Vin1     in   gnd  pulse 0 'vdd' 100ps 100ps 100ps 400ps 1000ps
Xininv   in   out1 inv   l=lg    nfinn=1           beta=2
Xdutinv  out1 out  inv   l=lg    nfinn='invnfinn'  beta='beta'
Xloadinv out  out2 inv   l=lg    nfinn=4           beta=2
* Cload  gnd  out  5f

*------------------------------------------------
*  Optimization setup
*------------------------------------------------
.param beta=optrange(1, 1, 4)
.model optmod opt itropt=40
.measure bestbeta param='beta'

*------------------------------------------------
* Simulation
*------------------------------------------------
.tran 1fs 1000ps sweep optimize=optrange results=diff model=optmod
.op all

*------------------------------------------------
* OUTPUT
*------------------------------------------------
.measure tphl
+ trig v(out1) val='vdd/2' rise=1
+ targ v(out)  val='vdd/2' fall=1

.measure tplh
+ trig v(out1) val='vdd/2' fall=1
+ targ v(out)  val='vdd/2' rise=1

.measure diff param='abs(tplh - tphl)' goal=0

.end
