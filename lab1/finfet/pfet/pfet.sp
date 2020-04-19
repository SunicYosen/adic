* .title pfet.sp

*------------------------------------------------
* Parameters and models
*------------------------------------------------
.lib "../../../ptm_mg_lib/lib/models" ptm7lstp
.options post
.global vddp gnd
.temp   25.0

.param NFINP=1

*------------------------------------------------
* Simulation netlist
*------------------------------------------------
* pmos
Vgs g gnd 0
Vds d gnd vddp
*--  d g  s   b  model
Xmn1 d g gnd gnd pfet l=lg nfin=NFINP

*------------------------------------------------
* Stimulus
*------------------------------------------------
.op all
.dc Vgs 0 vddp -0.01 SWEEP vds -0.05  vddp 'vddp+0.05'

*------------------------------------------------
* OUTPUT
*------------------------------------------------
.probe dc Ids = par('-I(Vds)')

* Find Vth
.measure dc vth find V(g) when I(Vds)='0.1u * NFINP * (2 * fin_height + fin_width) / lg'
.measure dc v2 find V(g) when I(Vds)='0.01u * NFINP * (2 * fin_height + fin_width) / lg'
* Find I off
.measure dc Ioff find par('-I(Vds)') when V(g)=0
* Find I on
.measure dc Ion find par('-I(Vds)') when V(g)=vddp
* SS
.measure dc ss PARAM='vth - v2'

* dibl
* .measure dc dibl PARAM='(vthvds2 - vthvds1)/(vdd - 0.05)'

.end