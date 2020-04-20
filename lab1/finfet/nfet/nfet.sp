* .title nfet.sp

*------------------------------------------------
* Parameters and models
*------------------------------------------------
.lib "../../../ptm_mg_lib/lib/models" ptm7hp
.options post postlvl-2
.global vdd gnd
.temp   25.0

.param NFINN=1

*------------------------------------------------
* Simulation netlist
*------------------------------------------------
* nmos
Vgs g gnd 0
Vds d gnd vdd
*--  d g  s   b  model
Xmn1 d g gnd gnd nfet l=lg nfin=NFINN

*------------------------------------------------
* Stimulus
*------------------------------------------------
.op all
* .dc Vds 0 vdd 0.001 SWEEP Vgs 0 vdd 0.1
* .dc Vgs 0 vdd 0.001 SWEEP Vds 0 vdd 0.1
.dc Vgs 0 vdd 0.001 SWEEP Vds 0.05 vdd 'vdd-0.05'

*------------------------------------------------
* OUTPUT
*------------------------------------------------
.probe dc Ids = par('-I(Vds)')

* Find Vth
.measure dc vth find V(g) when I(Vds)='-0.1u * NFINN * (2 * fin_height + fin_width) / lg'
.measure dc v2 find V(g) when I(Vds)='-0.01u * NFINN * (2 * fin_height + fin_width) / lg'
* Find I off
.measure dc Ioff find par('-I(Vds)') when V(g)=0
* Find I on
.measure dc Ion find par('-I(Vds)') when V(g)=vdd
* SS
.measure dc ss PARAM='vth - v2'

* dibl
* .measure dc dibl PARAM='(vthvds2 - vthvds1)/(vdd - 0.05)'

.end