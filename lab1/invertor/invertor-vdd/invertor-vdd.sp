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
.param   trant  =10ns
.param   pulset =1ns

*------------------------------------------------
* Invertor Sub-Circuit
*------------------------------------------------
.SUBCKT inv invin invout vdd l=lg nfinn=1 beta=2
Xmp1 invout invin vdd vdd pfet l='l' nfin='nfinn*beta'
Xmn2 invout invin gnd gnd nfet l='l' nfin='nfinn'
.ENDS

*------------------------------------------------
* Circuit Netlist
*------------------------------------------------
Vdd1     vdd  gnd  'vdd'
Vddt     vddt gnd  'vdd'
Vin1     in   gnd  pulse 0 'vdd' 100ps 100ps 100ps 400ps 'pulset'
* Shape input 
Xininv   in   out1 vdd  inv   l=lg    nfinn=1            beta='beta'
* Dut
Xdutinv  out1 out  vddt inv   l=lg    nfinn='invnfinn'   beta='beta'
* Load FO4
Xloadinv out  out2 vdd  inv   l=lg    nfinn='invnfinn*4' beta='beta'

*------------------------------------------------
* Simulation
*------------------------------------------------
.tran 1fs 'trant' sweep vdd 0.15 0.7 0.01
.op all

*------------------------------------------------
* OUTPUT
*------------------------------------------------

*------------------------------------------------
* Measure
*------------------------------------------------
.measure tphl
+ trig v(out1) val='vdd/2' rise=1
+ targ v(out)  val='vdd/2' fall=1

.measure tplh
+ trig v(out1) val='vdd/2' fall=1
+ targ v(out)  val='vdd/2' rise=1

.measure tpd   param='(tplh + tphl)/2'

.measure pwr avg '-p(vddt)' from=0ns to=10ns
* .measure charge avg '-i(vddt)' from=0ns to=10ns
* .measure pwr param='charge * vdd'
.measure pdp param='pwr * pulset / 2'
.measure edp param='pdp * tpd'

.end
