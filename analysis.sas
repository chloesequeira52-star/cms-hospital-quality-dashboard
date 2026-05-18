/*=====================================================*/
/* Hospital Quality Dashboard Project                  */
/* Import CMS datasets                                 */
/*=====================================================*/

/* Import Hospital General Information */

proc import
    datafile="/home/u64136090/sasuser.v94/Hospital_General_Information.csv"
    out=hospital
    dbms=csv
    replace;
    guessingrows=max;
run;


/* Import HCAHPS Patient Survey */

proc import
    datafile="/home/u64136090/sasuser.v94/HCAHPS-Hospital.csv"
    out=hcahps
    dbms=csv
    replace;
    guessingrows=max;
run;


/* Review variable structure */

proc contents data=hospital;
run;

proc contents data=hcahps;
run;


/* Preview first few observations */

proc print data=hospital(obs=10);
run;

proc print data=hcahps(obs=10);
run;
/* Keep only nurse communication star rating */

data survey_rating;
    set hcahps;

    if 'HCAHPS Measure ID'n = "H_COMP_1_STAR_RATING";

    keep 'Facility ID'n
         'Patient Survey Star Rating'n;
run;


/* Sort before merge */

proc sort data=hospital;
    by 'Facility ID'n;
run;

proc sort data=survey_rating;
    by 'Facility ID'n;
run;


/* Merge */

data hospital_final;
    merge hospital(in=a)
          survey_rating(in=b);

    by 'Facility ID'n;

    if a;
run;


/* Clean variables and make numeric versions */

data hospital_final2;
    set hospital_final;

    if 'Patient Survey Star Rating'n ne "Not Available";
    if 'Hospital overall rating'n ne "Not Available";

    patient_star_num = input('Patient Survey Star Rating'n, best12.);
    overall_rating_num = input('Hospital overall rating'n, best12.);
run;


/* Check final dataset */

proc print data=hospital_final2(obs=10);
run;


/* Graph: average hospital rating by hospital type */

proc sgplot data=hospital_final2;
    vbar 'Hospital Type'n /
        response=overall_rating_num
        stat=mean;

    xaxis fitpolicy=rotate;
    yaxis label="Average Hospital Overall Rating";
run;
/* Average ratings by hospital type */

proc means data=hospital_final2 mean std n maxdec=2;
    class 'Hospital Type'n;

    var overall_rating_num
        patient_star_num;

run;
/* Relationship between patient experience and quality */

proc corr data=hospital_final2;
    var overall_rating_num
        patient_star_num;
run;
/*====================================================*/
/* Create binary outcome                              */
/* High-rated hospital = 4-5 stars                    */
/*====================================================*/

data hospital_model;
    set hospital_final2;

    if overall_rating_num >=4 then high_rating=1;
    else if overall_rating_num <4 then high_rating=0;

run;


/*====================================================*/
/* Logistic regression                                */
/*====================================================*/

proc logistic data=hospital_model descending;

    model high_rating =
        patient_star_num;

    oddsratio patient_star_num;

run;
