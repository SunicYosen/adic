#! /usr/bin/python3

def gen_code_level2(num):
    for i in range(num):
        print('Xblk2%02d clk pout%d pout%d pout%d pout%d gout%d gout%d gout%d gout%d gout%dt%d pout%dt%d blk4' %(i+2, i, i+1, i+2, i+3, i, i+1, i+2, i+3, i+3, i, i+3, i))

gen_code_level2(30)