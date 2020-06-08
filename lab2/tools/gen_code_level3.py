#! /usr/bin/python3

def gen_code_level3(num):
    for i in range(num):
        print('Xblk3%02d clk pout%dt%d pout%dt%d pout%dt%d pout%dt%d gout%dt%d gout%dt%d gout%dt%d gout%dt%d gout%dt%d pout%dt%d blk4' %(i+15, i+7, i+4, i+11, i+8, i+15, i+12, i+19, i+16, i+7, i+4, i+11, i+8, i+15, i+12, i+19, i+16, i+19, i+4, i+19, i+4))

gen_code_level3(30)