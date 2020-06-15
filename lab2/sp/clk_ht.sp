* .title Clock H-Tree

*------------------------------------------------
* Clock Tree
* .SUBCKT inv invin invout l=lg nfinn=1 beta=2
*------------------------------------------------

.SUBCKT clk_ht clkin clkout0 clkout1 clkout2 clkout3 nfinn=4 beta=1
Xinv0 clkin     clk_temp inv nfinn='nfinn' beta=1
Xinv1 clk_temp  clkout0  inv nfinn='nfinn' beta=1
Xinv2 clk_temp  clkout1  inv nfinn='nfinn' beta=1
Xinv3 clk_temp  clkout2  inv nfinn='nfinn' beta=1
Xinv4 clk_temp  clkout3  inv nfinn='nfinn' beta=1
.ENDS
