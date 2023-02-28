Study-2 on taken antibiotics (n= 304) by who_advised_antibiotic (find the self administered in last two month)

*Title: Prevalence and determinanets of self-administered antibiotics use among the antibiotics taken people in last two months(Yes/No) 

*Outcome: self_administered antibiotics

* Final analysis demoghraphic

*Table 1: Background characteristics of the study participants 
tab1 age_cat Gender Marital_status_new Educational_status_new  self_administered 

*table 2: Background characteristics by antibiotics self-administration 
*demoghraphic vs self-administered
tab age_cat self_administered , chi row
tab Gender self_administered , chi row
tab Marital_status_new self_administered , chi row
tab Residence self_administered , chi row
tab Educational_status_new  self_administered , chi row

*****************
* Tablee 3: Antibiotics administration related information by self-administration
* use vs self-administered
tab frequiency_antibiotics_use self_administered, chi row

*sig
tab  antibiotics_in_proper_time self_administered, chi row

*sig
tab complete_dosages self_administered, chi row

tab problem_resolved self_administered , chi row

*****************
* Table 4 : Antibiotics resistance related variables by self-administration
*reason of resistance vs self-administered
tab k5_heard_resistance self_administered, chi row
tab k6_incomp_doses_resis self_administered, chi row

*Sig
tab k6_over_pres_resis self_administered, chi row

tab k6_use_livestock_resis self_administered, chi row

tab k6_over_sanitiser_resis self_administered, chi row
****************************
*Table 5: Antibiotics specification related variables by self-administration

* drugs vs self-administered

tab antibiotics_k2_a_Penicillin self_administered , chi row 
*sig
tab antibiotics_k2_f_Amoxicillin self_administered , chi row
tab antibiotics_k2_b_Cefixime  self_administered , chi row
*sig
tab antibiotics_k2_d_Azithromycin self_administered , chi row
tab antibiotics_k2_e_Remdisivir self_administered , chi row
tab antibiotics_k2_c_Albendazole  self_administered , chi row

****************************************************
* Analysis for draw figure

*Fig 1: 
tab1 frequiency_antibiotics_use antibiotics_in_proper_time complete_dosages problem_resolved

*Fig 2: 
tab1 k5_heard_resistance k6_incomp_doses_resis k6_over_pres_resis k6_use_livestock_resis k6_over_sanitiser_resis

*Fig 3: 
tab1 antibiotics_k2_a_Penicillin antibiotics_k2_f_Amoxicillin antibiotics_k2_b_Cefixime antibiotics_k2_d_Azithromycin antibiotics_k2_e_Remdisivir antibiotics_k2_c_Albendazole


****************************************************

*data mx
gen Marital_status_new = 4 if Marital_status ==1
replace Marital_status_new=5 if Marital_status ==2
replace Marital_status_new=5 if Marital_status ==3
recode Marital_status_new 4=1 5=2

label define Marital_status_new 1"married" 2"unmarried"
label value Marital_status_new Marital_status_new
*
gen age_cat =1 if age_cont <20
replace age_cat=2 if age_cont >=20 & age_cont <30
replace age_cat=3 if age_cont >=30 & age_cont <40
replace age_cat=4 if age_cont >=40 

label define age_cat 1 "<20" 2">=20 & <30" 3">=30 & <40" 4">=40"
label value age_cat age_cat

*
gen Educational_status_new = 7 if Educational_status ==1
replace Educational_status_new = 7 if Educational_status ==2
replace Educational_status_new = 8 if Educational_status ==3
replace Educational_status_new = 9 if Educational_status ==4
replace Educational_status_new = 9 if Educational_status ==5
replace Educational_status_new = 9 if Educational_status ==6

recode Educational_status_new 7=1 8=2 9=3

label define Educational_status_new 1 "graduate" 2 "HSC" 3 "upto SSC"
label value Educational_status_new Educational_status_new

#creating outcome variable

gen self_administered =1 if who_advised_antibiotic==3
replace self_administered=0 if who_advised_antibiotic==1
replace self_administered=0 if who_advised_antibiotic==2
label define self_administered 0 "no" 1 "yes"
label value self_administered self_administered


#creating predicting variable
*possible reason of antibiotics resistance 

tab1 k6_incomp_doses_resis k6_over_pres_resis k6_use_livestock_resis k6_over_sanitiser_resis


***************

gen frequiency_antibiotics_use = 8 if times_take_antibiotic== 0
replace frequiency_antibiotics_use = 8 if times_take_antibiotic== 1

replace frequiency_antibiotics_use = 9 if times_take_antibiotic== 2
replace frequiency_antibiotics_use = 9 if times_take_antibiotic== 3
replace frequiency_antibiotics_use = 9 if times_take_antibiotic== 4
replace frequiency_antibiotics_use = 9 if times_take_antibiotic== 5
replace frequiency_antibiotics_use = 9 if times_take_antibiotic== 7

recode frequiency_antibiotics_use 8=0 9=1
label define frequiency_antibiotics_use 0 "1 times" 1">1 times", replace 
label value frequiency_antibiotics_use frequiency_antibiotics_use
*
#sample test
tab1 p1_antibiotic_fever p2_antibiotic_cold p3_antibiotics_by_doc p4_antibiotics_quit p5_antibiotics_proper_time

tab p1_antibiotic_fever self_administered, chi row
tab p2_antibiotic_cold  self_administered, chi row
tab p3_antibiotics_by_doc  self_administered, chi row
tab p4_antibiotics_quit self_administered, chi row
tab p5_antibiotics_proper_time self_administered, chi row

*predictors from p1 to p5

gen p1_antibiotic_fever_new= 5 if p1_antibiotic_fever==1
replace p1_antibiotic_fever_new=6 if p1_antibiotic_fever==2
replace p1_antibiotic_fever_new=6 if p1_antibiotic_fever==3
replace p1_antibiotic_fever_new=7 if p1_antibiotic_fever==4

p2_antibiotic_cold

gen p2_antibiotic_cold_new= 5 if p2_antibiotic_cold==1
replace p2_antibiotic_cold_new=6 if p2_antibiotic_cold==2
replace p2_antibiotic_cold_new=6 if p2_antibiotic_cold==3
replace p2_antibiotic_cold_new=7 if p2_antibiotic_cold==4

tab p1_antibiotic_fever_new self_administered, chi row
tab p2_antibiotic_cold_new self_administered, chi row
















