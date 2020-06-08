def gen_code_level4(num):
    for i in range(num):
        print('Xblk4%02d clk pout%dt0 pout%dt%d gout%dt0 gout%dt%d gout%dt0 pout%dt0 blk2' %(i+2, i+2, i+18, i+3, i+2, i+18, i+3, i+18, i+18))

gen_code_level4(15)