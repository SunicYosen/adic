* .title 32-bit Adder

*------------------------------------------------
* Parameters
*------------------------------------------------
.global  vdd gnd

*------------------------------------------------------------------
* Include Sub circuits
*------------------------------------------------------------------
.include invertor_cmos.sp
.include xor2_tg.sp
.include gen_dynamic.sp
.include pro_dynamic.sp
.include block_2.sp
.include block_3.sp
.include block_4.sp
.include sum_xor2.sp

*------------------------------------------------------------------
* Sub-circuit
*------------------------------------------------------------------
.SUBCKT adder32  ina0  ina1  ina2  ina3  ina4  ina5  ina6  ina7  
+                ina8  ina9  ina10 ina11 ina12 ina13 ina14 ina15 
+                ina16 ina17 ina18 ina19 ina20 ina21 ina22 ina23 
+                ina24 ina25 ina26 ina27 ina28 ina29 ina30 ina31
+                inb0  inb1  inb2  inb3  inb4  inb5  inb6  inb7  
+                inb8  inb9  inb10 inb11 inb12 inb13 inb14 inb15 
+                inb16 inb17 inb18 inb19 inb20 inb21 inb22 inb23 
+                inb24 inb25 inb26 inb27 inb28 inb29 inb30 inb31 
+                sum00 sum01 sum02 sum03 sum04 sum05 sum06 sum07  
+                sum08 sum09 sum10 sum11 sum12 sum13 sum14 sum15 
+                sum16 sum17 sum18 sum19 sum20 sum21 sum22 sum23 
+                sum24 sum25 sum26 sum27 sum28 sum29 sum30 sum31
+                clk   cout

*----------------------------------------------------------------------
* Level 0  Inverte input
*----------------------------------------------------------------------
* INA
Xinv00 ina0  ina0_n  inv
Xinv01 ina1  ina1_n  inv
Xinv02 ina2  ina2_n  inv
Xinv03 ina3  ina3_n  inv
Xinv04 ina4  ina4_n  inv
Xinv05 ina5  ina5_n  inv
Xinv06 ina6  ina6_n  inv
Xinv07 ina7  ina7_n  inv
Xinv08 ina8  ina8_n  inv
Xinv09 ina9  ina9_n  inv
Xinv10 ina10 ina10_n inv
Xinv11 ina11 ina11_n inv
Xinv12 ina12 ina12_n inv
Xinv13 ina13 ina13_n inv
Xinv14 ina14 ina14_n inv
Xinv15 ina15 ina15_n inv
Xinv16 ina16 ina16_n inv
Xinv17 ina17 ina17_n inv
Xinv18 ina18 ina18_n inv
Xinv19 ina19 ina19_n inv
Xinv20 ina20 ina20_n inv
Xinv21 ina21 ina21_n inv
Xinv22 ina22 ina22_n inv
Xinv23 ina23 ina23_n inv
Xinv24 ina24 ina24_n inv
Xinv25 ina25 ina25_n inv
Xinv26 ina26 ina26_n inv
Xinv27 ina27 ina27_n inv
Xinv28 ina28 ina28_n inv
Xinv29 ina29 ina29_n inv
Xinv30 ina30 ina30_n inv
Xinv31 ina31 ina31_n inv
* INB
Xinv32 inb0  inb0_n  inv
Xinv33 inb1  inb1_n  inv
Xinv34 inb2  inb2_n  inv
Xinv35 inb3  inb3_n  inv
Xinv36 inb4  inb4_n  inv
Xinv37 inb5  inb5_n  inv
Xinv38 inb6  inb6_n  inv
Xinv39 inb7  inb7_n  inv
Xinv40 inb8  inb8_n  inv
Xinv41 inb9  inb9_n  inv
Xinv42 inb10 inb10_n inv
Xinv43 inb11 inb11_n inv
Xinv44 inb12 inb12_n inv
Xinv45 inb13 inb13_n inv
Xinv46 inb14 inb14_n inv
Xinv47 inb15 inb15_n inv
Xinv48 inb16 inb16_n inv
Xinv49 inb17 inb17_n inv
Xinv50 inb18 inb18_n inv
Xinv51 inb19 inb19_n inv
Xinv52 inb20 inb20_n inv
Xinv53 inb21 inb21_n inv
Xinv54 inb22 inb22_n inv
Xinv55 inb23 inb23_n inv
Xinv56 inb24 inb24_n inv
Xinv57 inb25 inb25_n inv
Xinv58 inb26 inb26_n inv
Xinv59 inb27 inb27_n inv
Xinv60 inb28 inb28_n inv
Xinv61 inb29 inb29_n inv
Xinv62 inb30 inb30_n inv
Xinv63 inb31 inb31_n inv

*----------------------------------------------------------------------
* Level 1  Gen Propagtion
*----------------------------------------------------------------------
* Generator
* .SUBCKT gen clk  ina  inb  gout l=lg nfinn=3 pfinn=1 inv_beta=1
*----------------------------------------------------------------------
Xgen00 clk ina0  inb0  gout0  gen
Xgen01 clk ina1  inb1  gout1  gen
Xgen02 clk ina2  inb2  gout2  gen
Xgen03 clk ina3  inb3  gout3  gen
Xgen04 clk ina4  inb4  gout4  gen
Xgen05 clk ina5  inb5  gout5  gen
Xgen06 clk ina6  inb6  gout6  gen
Xgen07 clk ina7  inb7  gout7  gen
Xgen08 clk ina8  inb8  gout8  gen
Xgen09 clk ina9  inb9  gout9  gen
Xgen10 clk ina10 inb10 gout10 gen
Xgen11 clk ina11 inb11 gout11 gen
Xgen12 clk ina12 inb12 gout12 gen
Xgen13 clk ina13 inb13 gout13 gen
Xgen14 clk ina14 inb14 gout14 gen
Xgen15 clk ina15 inb15 gout15 gen
Xgen16 clk ina16 inb16 gout16 gen
Xgen17 clk ina17 inb17 gout17 gen
Xgen18 clk ina18 inb18 gout18 gen
Xgen19 clk ina19 inb19 gout19 gen
Xgen20 clk ina20 inb20 gout20 gen
Xgen21 clk ina21 inb21 gout21 gen
Xgen22 clk ina22 inb22 gout22 gen
Xgen23 clk ina23 inb23 gout23 gen
Xgen24 clk ina24 inb24 gout24 gen
Xgen25 clk ina25 inb25 gout25 gen
Xgen26 clk ina26 inb26 gout26 gen
Xgen27 clk ina27 inb27 gout27 gen
Xgen28 clk ina28 inb28 gout28 gen
Xgen29 clk ina29 inb29 gout29 gen
Xgen30 clk ina30 inb30 gout30 gen
Xgen31 clk ina31 inb31 gout31 gen

*----------------------------------------------------------------------------------
* Propagation
* .SUBCKT pro clk   ina  inb  ina_n inb_n pout l=lg  nfinn=2     pfinn=1 inv_beta=1
*----------------------------------------------------------------------------------
Xpro00 clk ina0  inb0  ina0_n  inb0_n  pout0  pro
Xpro01 clk ina1  inb1  ina1_n  inb1_n  pout1  pro
Xpro02 clk ina2  inb2  ina2_n  inb2_n  pout2  pro
Xpro03 clk ina3  inb3  ina3_n  inb3_n  pout3  pro
Xpro04 clk ina4  inb4  ina4_n  inb4_n  pout4  pro
Xpro05 clk ina5  inb5  ina5_n  inb5_n  pout5  pro
Xpro06 clk ina6  inb6  ina6_n  inb6_n  pout6  pro
Xpro07 clk ina7  inb7  ina7_n  inb7_n  pout7  pro
Xpro08 clk ina8  inb8  ina8_n  inb8_n  pout8  pro
Xpro09 clk ina9  inb9  ina9_n  inb9_n  pout9  pro
Xpro10 clk ina10 inb10 ina10_n inb10_n pout10 pro
Xpro11 clk ina11 inb11 ina11_n inb11_n pout11 pro
Xpro12 clk ina12 inb12 ina12_n inb12_n pout12 pro
Xpro13 clk ina13 inb13 ina13_n inb13_n pout13 pro
Xpro14 clk ina14 inb14 ina14_n inb14_n pout14 pro
Xpro15 clk ina15 inb15 ina15_n inb15_n pout15 pro
Xpro16 clk ina16 inb16 ina16_n inb16_n pout16 pro
Xpro17 clk ina17 inb17 ina17_n inb17_n pout17 pro
Xpro18 clk ina18 inb18 ina18_n inb18_n pout18 pro
Xpro19 clk ina19 inb19 ina19_n inb19_n pout19 pro
Xpro20 clk ina20 inb20 ina20_n inb20_n pout20 pro
Xpro21 clk ina21 inb21 ina21_n inb21_n pout21 pro
Xpro22 clk ina22 inb22 ina22_n inb22_n pout22 pro
Xpro23 clk ina23 inb23 ina23_n inb23_n pout23 pro
Xpro24 clk ina24 inb24 ina24_n inb24_n pout24 pro
Xpro25 clk ina25 inb25 ina25_n inb25_n pout25 pro
Xpro26 clk ina26 inb26 ina26_n inb26_n pout26 pro
Xpro27 clk ina27 inb27 ina27_n inb27_n pout27 pro
Xpro28 clk ina28 inb28 ina28_n inb28_n pout28 pro
Xpro29 clk ina29 inb29 ina29_n inb29_n pout29 pro
Xpro30 clk ina30 inb30 ina30_n inb30_n pout30 pro
Xpro31 clk ina31 inb31 ina31_n inb31_n pout31 pro

*--------------------------------------------------------------------------------------------------------
* Level 2
* .SUBCKT blk2 clk p0 p1       g0 g1        gout pout l=lg nfinn=2 pfinn=1 inv_beta=1
* .SUBCKT blk3 clk p0 p1 p2    g0 g1 g2     gout pout l=lg nfinn=3 pfinn=1 inv_beta=1
* .SUBCKT blk4 clk p0 p1 p2 p3 g0 g1 g2 g3  gout pout l=lg nfinn=3 pfinn=1 inv_beta=1
*--------------------------------------------------------------------------------------------------------
Xblk200 clk pout0  pout1                gout0  gout1                gout1t0   pout1t0   blk2
Xblk201 clk pout0  pout1  pout2         gout0  gout1  gout2         gout2t0   pout2t0   blk3
Xblk202 clk pout0  pout1  pout2  pout3  gout0  gout1  gout2  gout3  gout3t0   pout3t0   blk4
Xblk203 clk pout1  pout2  pout3  pout4  gout1  gout2  gout3  gout4  gout4t1   pout4t1   blk4
Xblk204 clk pout2  pout3  pout4  pout5  gout2  gout3  gout4  gout5  gout5t2   pout5t2   blk4
Xblk205 clk pout3  pout4  pout5  pout6  gout3  gout4  gout5  gout6  gout6t3   pout6t3   blk4
Xblk206 clk pout4  pout5  pout6  pout7  gout4  gout5  gout6  gout7  gout7t4   pout7t4   blk4
Xblk207 clk pout5  pout6  pout7  pout8  gout5  gout6  gout7  gout8  gout8t5   pout8t5   blk4
Xblk208 clk pout6  pout7  pout8  pout9  gout6  gout7  gout8  gout9  gout9t6   pout9t6   blk4
Xblk209 clk pout7  pout8  pout9  pout10 gout7  gout8  gout9  gout10 gout10t7  pout10t7  blk4
Xblk210 clk pout8  pout9  pout10 pout11 gout8  gout9  gout10 gout11 gout11t8  pout11t8  blk4
Xblk211 clk pout9  pout10 pout11 pout12 gout9  gout10 gout11 gout12 gout12t9  pout12t9  blk4
Xblk212 clk pout10 pout11 pout12 pout13 gout10 gout11 gout12 gout13 gout13t10 pout13t10 blk4
Xblk213 clk pout11 pout12 pout13 pout14 gout11 gout12 gout13 gout14 gout14t11 pout14t11 blk4
Xblk214 clk pout12 pout13 pout14 pout15 gout12 gout13 gout14 gout15 gout15t12 pout15t12 blk4
Xblk215 clk pout13 pout14 pout15 pout16 gout13 gout14 gout15 gout16 gout16t13 pout16t13 blk4
Xblk216 clk pout14 pout15 pout16 pout17 gout14 gout15 gout16 gout17 gout17t14 pout17t14 blk4
Xblk217 clk pout15 pout16 pout17 pout18 gout15 gout16 gout17 gout18 gout18t15 pout18t15 blk4
Xblk218 clk pout16 pout17 pout18 pout19 gout16 gout17 gout18 gout19 gout19t16 pout19t16 blk4
Xblk219 clk pout17 pout18 pout19 pout20 gout17 gout18 gout19 gout20 gout20t17 pout20t17 blk4
Xblk220 clk pout18 pout19 pout20 pout21 gout18 gout19 gout20 gout21 gout21t18 pout21t18 blk4
Xblk221 clk pout19 pout20 pout21 pout22 gout19 gout20 gout21 gout22 gout22t19 pout22t19 blk4
Xblk222 clk pout20 pout21 pout22 pout23 gout20 gout21 gout22 gout23 gout23t20 pout23t20 blk4
Xblk223 clk pout21 pout22 pout23 pout24 gout21 gout22 gout23 gout24 gout24t21 pout24t21 blk4
Xblk224 clk pout22 pout23 pout24 pout25 gout22 gout23 gout24 gout25 gout25t22 pout25t22 blk4
Xblk225 clk pout23 pout24 pout25 pout26 gout23 gout24 gout25 gout26 gout26t23 pout26t23 blk4
Xblk226 clk pout24 pout25 pout26 pout27 gout24 gout25 gout26 gout27 gout27t24 pout27t24 blk4
Xblk227 clk pout25 pout26 pout27 pout28 gout25 gout26 gout27 gout28 gout28t25 pout28t25 blk4
Xblk228 clk pout26 pout27 pout28 pout29 gout26 gout27 gout28 gout29 gout29t26 pout29t26 blk4
Xblk229 clk pout27 pout28 pout29 pout30 gout27 gout28 gout29 gout30 gout30t27 pout30t27 blk4
Xblk230 clk pout28 pout29 pout30 pout31 gout28 gout29 gout30 gout31 gout31t28 pout31t28 blk4

*--------------------------------------------------------------------------------------------------------
* Level 3
* .SUBCKT blk2 clk p0 p1       g0 g1        gout pout l=lg nfinn=2 pfinn=1 inv_beta=1
* .SUBCKT blk3 clk p0 p1 p2    g0 g1 g2     gout pout l=lg nfinn=3 pfinn=1 inv_beta=1 
* .SUBCKT blk4 clk p0 p1 p2 p3 g0 g1 g2 g3  gout pout l=lg nfinn=3 pfinn=1 inv_beta=1 
*--------------------------------------------------------------------------------------------------------
Xblk300 clk pout0     pout4t1                       gout0     gout4t1                       gout4t0   pout4t0   blk2
Xblk301 clk pout1t0   pout5t2                       gout1t0   gout5t2                       gout5t0   pout5t0   blk2
Xblk302 clk pout2t0   pout6t3                       gout2t0   gout6t3                       gout6t0   pout6t0   blk2
Xblk303 clk pout3t0   pout7t4                       gout3t0   gout7t4                       gout7t0   pout7t0   blk2
Xblk304 clk pout0     pout4t1   pout8t5             gout0     gout4t1   gout8t5             gout8t0   pout8t0   blk3
Xblk305 clk pout1t0   pout5t2   pout9t6             gout1t0   gout5t2   gout9t6             gout9t0   pout9t0   blk3
Xblk306 clk pout2t0   pout6t3   pout10t7            gout2t0   gout6t3   gout10t7            gout10t0  pout10t0  blk3
Xblk307 clk pout3t0   pout7t4   pout11t8            gout3t0   gout7t4   gout11t8            gout11t0  pout11t0  blk3
Xblk308 clk pout0     pout4t1   pout8t5   pout12t9  gout0     gout4t1   gout8t5   gout12t9  gout12t0  pout12t0  blk4
Xblk309 clk pout1t0   pout5t2   pout9t6   pout13t10 gout1t0   gout5t2   gout9t6   gout13t10 gout13t0  pout13t0  blk4
Xblk310 clk pout2t0   pout6t3   pout10t7  pout14t11 gout2t0   gout6t3   gout10t7  gout14t11 gout14t0  pout14t0  blk4
Xblk311 clk pout3t0   pout7t4   pout11t8  pout15t12 gout3t0   gout7t4   gout11t8  gout15t12 gout15t0  pout15t0  blk4
Xblk312 clk pout4t1   pout8t5   pout12t9  pout16t13 gout4t1   gout8t5   gout12t9  gout16t13 gout16t1  pout16t1  blk4
Xblk313 clk pout5t2   pout9t6   pout13t10 pout17t14 gout5t2   gout9t6   gout13t10 gout17t14 gout17t2  pout17t2  blk4
Xblk314 clk pout6t3   pout10t7  pout14t11 pout18t15 gout6t3   gout10t7  gout14t11 gout18t15 gout18t3  pout18t3  blk4
Xblk315 clk pout7t4   pout11t8  pout15t12 pout19t16 gout7t4   gout11t8  gout15t12 gout19t16 gout19t4  pout19t4  blk4
Xblk316 clk pout8t5   pout12t9  pout16t13 pout20t17 gout8t5   gout12t9  gout16t13 gout20t17 gout20t5  pout20t5  blk4
Xblk317 clk pout9t6   pout13t10 pout17t14 pout21t18 gout9t6   gout13t10 gout17t14 gout21t18 gout21t6  pout21t6  blk4
Xblk318 clk pout10t7  pout14t11 pout18t15 pout22t19 gout10t7  gout14t11 gout18t15 gout22t19 gout22t7  pout22t7  blk4
Xblk319 clk pout11t8  pout15t12 pout19t16 pout23t20 gout11t8  gout15t12 gout19t16 gout23t20 gout23t8  pout23t8  blk4
Xblk320 clk pout12t9  pout16t13 pout20t17 pout24t21 gout12t9  gout16t13 gout20t17 gout24t21 gout24t9  pout24t9  blk4
Xblk321 clk pout13t10 pout17t14 pout21t18 pout25t22 gout13t10 gout17t14 gout21t18 gout25t22 gout25t10 pout25t10 blk4
Xblk322 clk pout14t11 pout18t15 pout22t19 pout26t23 gout14t11 gout18t15 gout22t19 gout26t23 gout26t11 pout26t11 blk4
Xblk323 clk pout15t12 pout19t16 pout23t20 pout27t24 gout15t12 gout19t16 gout23t20 gout27t24 gout27t12 pout27t12 blk4
Xblk324 clk pout16t13 pout20t17 pout24t21 pout28t25 gout16t13 gout20t17 gout24t21 gout28t25 gout28t13 pout28t13 blk4
Xblk325 clk pout17t14 pout21t18 pout25t22 pout29t26 gout17t14 gout21t18 gout25t22 gout29t26 gout29t14 pout29t14 blk4
Xblk326 clk pout18t15 pout22t19 pout26t23 pout30t27 gout18t15 gout22t19 gout26t23 gout30t27 gout30t15 pout30t15 blk4
Xblk327 clk pout19t16 pout23t20 pout27t24 pout31t28 gout19t16 gout23t20 gout27t24 gout31t28 gout31t16 pout31t16 blk4

*------------------------------------------------------------------------------------
* Level 4
* .SUBCKT blk2 clk p0 p1       g0 g1        gout pout l=lg nfinn=2 pfinn=1 inv_beta=1
*------------------------------------------------------------------------------------
Xblk400 clk pout0    pout16t1  gout0    gout16t1  gout16t0 pout16t0 blk2
Xblk401 clk pout1t0  pout17t2  gout1t0  gout17t2  gout17t0 pout17t0 blk2
Xblk402 clk pout2t0  pout18t3  gout2t0  gout18t3  gout18t0 pout18t0 blk2
Xblk403 clk pout3t0  pout19t4  gout3t0  gout19t4  gout19t0 pout19t0 blk2
Xblk404 clk pout4t0  pout20t5  gout4t0  gout20t5  gout20t0 pout20t0 blk2
Xblk405 clk pout5t0  pout21t6  gout5t0  gout21t6  gout21t0 pout21t0 blk2
Xblk406 clk pout6t0  pout22t7  gout6t0  gout22t7  gout22t0 pout22t0 blk2
Xblk407 clk pout7t0  pout23t8  gout7t0  gout23t8  gout23t0 pout23t0 blk2
Xblk408 clk pout8t0  pout24t9  gout8t0  gout24t9  gout24t0 pout24t0 blk2
Xblk409 clk pout9t0  pout25t10 gout9t0  gout25t10 gout25t0 pout25t0 blk2
Xblk410 clk pout10t0 pout26t11 gout10t0 gout26t11 gout26t0 pout26t0 blk2
Xblk411 clk pout11t0 pout27t12 gout11t0 gout27t12 gout27t0 pout27t0 blk2
Xblk412 clk pout12t0 pout28t13 gout12t0 gout28t13 gout28t0 pout28t0 blk2
Xblk413 clk pout13t0 pout29t14 gout13t0 gout29t14 gout29t0 pout29t0 blk2
Xblk414 clk pout14t0 pout30t15 gout14t0 gout30t15 gout30t0 pout30t0 blk2
Xblk415 clk pout15t0 pout31t16 gout15t0 gout31t16 gout31t0 pout31t0 blk2

*------------------------------------------------------------------------------------
* Level 5 Sum
* .SUBCKT sum  p1 g0t0 outs l=lg nfinn=5 pfinn=1 inv_beta=1
*------------------------------------------------------------------------------------
Xsum0  pout0  gnd      sum00 sum
Xsum01 pout1  gout0    sum01 sum
Xsum02 pout2  gout1t0  sum02 sum
Xsum03 pout3  gout2t0  sum03 sum
Xsum04 pout4  gout3t0  sum04 sum
Xsum05 pout5  gout4t0  sum05 sum
Xsum06 pout6  gout5t0  sum06 sum
Xsum07 pout7  gout6t0  sum07 sum
Xsum08 pout8  gout7t0  sum08 sum
Xsum09 pout9  gout8t0  sum09 sum
Xsum10 pout10 gout9t0  sum10 sum
Xsum11 pout11 gout10t0 sum11 sum
Xsum12 pout12 gout11t0 sum12 sum
Xsum13 pout13 gout12t0 sum13 sum
Xsum14 pout14 gout13t0 sum14 sum
Xsum15 pout15 gout14t0 sum15 sum
Xsum16 pout16 gout15t0 sum16 sum
Xsum17 pout17 gout16t0 sum17 sum
Xsum18 pout18 gout17t0 sum18 sum
Xsum19 pout19 gout18t0 sum19 sum
Xsum20 pout20 gout19t0 sum20 sum
Xsum21 pout21 gout20t0 sum21 sum
Xsum22 pout22 gout21t0 sum22 sum
Xsum23 pout23 gout22t0 sum23 sum
Xsum24 pout24 gout23t0 sum24 sum
Xsum25 pout25 gout24t0 sum25 sum
Xsum26 pout26 gout25t0 sum26 sum
Xsum27 pout27 gout26t0 sum27 sum
Xsum28 pout28 gout27t0 sum28 sum
Xsum29 pout29 gout28t0 sum29 sum
Xsum30 pout30 gout29t0 sum30 sum
Xsum31 pout31 gout30t0 sum31 sum
Xsum32 gnd    gout31t0 cout  sum

.ENDS
