* .title Sum circuit

*------------------------------------------------
* Sub-circuit
*------------------------------------------------
.SUBCKT sum  p1 g0t0 outs l=lg nfinn=4 pfinn=4 inv_beta=1
Xxor0   p1 g0t0 outs xor2 l=lg nfinn='nfinn' pfinn='pfinn' inv_beta='inv_beta'
.ENDS
