cd "/Users/yexiaofeng/Desktop/2022-Technology reduce insecurity/R&R/IV/"

use IVData0219.dta

xtset BILACCT_K Year
 



 
************* Heterogeneity of new technology adoption on residential energy insecurity status 

* 1. Income
 
/*income_factor:
           1 $100,000 to $149,999
           2 $15,000 to $24,999
           3 $150,000 or more
           4 $25,000 to $34,999
           5 $35,000 to $49,999
           6 $50,000 to $74,999
           7 $75,000 to $99,999
           8 Less than $15,000
*/
 
 
xtreg CBP Heatpump Size Age Ethnic Dwelling_Age i.Year if Income== 8, r
est store m1
xtreg CBP Heatpump Size Age Ethnic Dwelling_Age i.Year if Income== 2, r
est store m2
xtreg CBP Heatpump Size Age Ethnic Dwelling_Age i.Year if Income== 4, r
est store m3
xtreg CBP Heatpump Size Age Ethnic Dwelling_Age i.Year if Income== 5, r
est store m4
xtreg CBP Heatpump Size Age Ethnic Dwelling_Age i.Year if Income== 6, r
est store m5
xtreg CBP Heatpump Size Age Ethnic Dwelling_Age i.Year if Income== 7, r
est store m6
xtreg CBP Heatpump Size Age Ethnic Dwelling_Age i.Year if Income== 1, r
est store m7
xtreg CBP Heatpump Size Age Ethnic Dwelling_Age i.Year if Income== 3, r
est store m8

xtreg CS Heatpump Size Age Ethnic Dwelling_Age i.Year if Income== 8, r
est store m9
xtreg CS Heatpump Size Age Ethnic Dwelling_Age i.Year if Income== 2, r
est store m10
xtreg CS Heatpump Size Age Ethnic Dwelling_Age i.Year if Income== 4, r
est store m11
xtreg CS Heatpump Size Age Ethnic Dwelling_Age i.Year if Income== 5, r
est store m12
xtreg CS Heatpump Size Age Ethnic Dwelling_Age i.Year if Income== 6, r
est store m13
xtreg CS Heatpump Size Age Ethnic Dwelling_Age i.Year if Income== 7, r
est store m14
xtreg CS Heatpump Size Age Ethnic Dwelling_Age i.Year if Income== 1, r
est store m15
xtreg CS Heatpump Size Age Ethnic Dwelling_Age i.Year if Income== 3, r
est store m16

 
esttab m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12 m13 m14 m15 m16 using "regression_results.csv", replace ///
b(%9.3f) se(%9.3f) star(* 0.10 ** 0.05 *** 0.01) ///
compress

esttab m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12 m13 m14 m15 m16 using "regression_results_ci.csv", replace ///
b(%9.3f) ci(%9.3f) star(* 0.10 ** 0.05 *** 0.01) compress



* 2. Size 
/*size_factor:
           1 1,000 - 1,499 sq. ft.
           2 1,500 - 1,999 sq. ft.
           3 2,000 - 2,999 sq. ft.
           4 3,000 - 3,999 sq. ft.
           5 4,000 or more sq.
           6 Under 1,000 sq. ft.
*/		   

xtreg CBP Heatpump Income Age Ethnic Dwelling_Age i.Year if Size== 6, r
est store m1
xtreg CBP Heatpump Income Age Ethnic Dwelling_Age i.Year if Size== 1, r
est store m2
xtreg CBP Heatpump Income Age Ethnic Dwelling_Age i.Year if Size== 2, r
est store m3
xtreg CBP Heatpump Income Age Ethnic Dwelling_Age i.Year if Size== 3, r
est store m4
xtreg CBP Heatpump Income Age Ethnic Dwelling_Age i.Year if Size== 4, r
est store m5
xtreg CBP Heatpump Income Age Ethnic Dwelling_Age i.Year if Size== 5, r
est store m6

xtreg CS Heatpump Income Age Ethnic Dwelling_Age i.Year if Size== 6, r
est store m11
xtreg CS Heatpump Income Age Ethnic Dwelling_Age i.Year if Size== 1, r
est store m12
xtreg CS Heatpump Income Age Ethnic Dwelling_Age i.Year if Size== 2, r
est store m13
xtreg CS Heatpump Income Age Ethnic Dwelling_Age i.Year if Size== 3, r
est store m14
xtreg CS Heatpump Income Age Ethnic Dwelling_Age i.Year if Size== 4, r
est store m15
xtreg CS Heatpump Income Age Ethnic Dwelling_Age i.Year if Size== 5, r
est store m16

esttab m1 m2 m3 m4 m5 m6 m11 m12 m13 m14 m15 m16 using heatpump_SIZEresult.rtf


* 3. Ethnic
xtreg CBP Heatpump Income Age Size Dwelling_Age i.Year if Ethnic== 1, r
est store m1

xtreg CBP Heatpump Income Age Size Dwelling_Age i.Year if Ethnic== 0, r
est store m2

xtreg CS Heatpump Income Age Size Dwelling_Age i.Year if Ethnic== 1, r
est store m3

xtreg CS Heatpump Income Age Size Dwelling_Age i.Year if Ethnic== 0, r
est store m4


esttab m1 m2 m3 m4 using "ethnic.csv", replace ///
b(%9.3f) se(%9.3f) star(* 0.10 ** 0.05 *** 0.01) ///
compress

esttab m1 m2 m3 m4 using "ethnic_results_ci_results_ci.csv", replace ///
b(%9.3f) ci(%9.3f) star(* 0.10 ** 0.05 *** 0.01) compress





