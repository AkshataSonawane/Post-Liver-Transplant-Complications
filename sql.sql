-- Basic Analysis
/*How many records are there in the dataset?*/
select count(*) from livert;

/*What is the average age and BMI of donors and recipients?*/
select 
'donor' as person_type,
avg(D_age) as average_age,
avg(D_BMI) as average_bmi
from livert
union
select
'recipient' as peson_type,
avg(R_age) as average_age,
avg(R_BMI) as average_bmi
from livert;

/*What are the most common causes of death among donors?*/
select D_cause_of_death from livert;
select D_cause_of_death as cause_of_death ,count(D_cause_of_death) as death_count
from livert 
group by cause_of_death
order by death_count DESC;

/*What is the distribution of gender among donors and recipients?*/
SELECT 
    'Donor' AS Person_Type,
    D_Gender AS Gender,
    COUNT(*) AS Count
FROM 
    livert
GROUP BY D_Gender
UNION ALL
SELECT 
    'Recipient' AS Person_Type,
    R_Gender AS Gender,
    COUNT(*) AS Count
FROM 
    livert
GROUP BY R_Gender;

-- Prevalence Analysis
/*How many donors have Hepatitis B?*/
Select Count(D_Hepatitis_B) from livert where D_Hepatitis_B = 1;

/*How many donors and recipients have hepatitis B?*/
Select 
'Donor' as Person_Type,
Count(D_Hepatitis_B) from livert where D_Hepatitis_B = 1
union 
select
'Recipient' as Person_type,
Count(R_Hepatitis_B) from livert where R_Hepatitis_B = 1;

/*How many donors and recipients have hepatitis B or hepatitis C?*/
SELECT 
    'Donor' AS Person_Type,
    SUM(CASE WHEN D_Hepatitis_B = 1 THEN 1 ELSE 0 END + CASE WHEN D_Hepatitis_C = 1 THEN 1 ELSE 0 END) AS Donor_Hepatitis_B_or_C_Count
FROM 
    livert
UNION ALL
SELECT 
    'Recipient' AS Person_Type,
    SUM(CASE WHEN R_Hepatitis_B = 1 THEN 1 ELSE 0 END + CASE WHEN R_Hepatitis_C = 1 THEN 1 ELSE 0 END) AS Donor_Hepatitis_B_or_C_Count
FROM 
    livert;

-- OR

SELECT 
    'Donor' AS Person_Type,
    SUM(CASE WHEN D_Hepatitis_B = 1 THEN 1 ELSE 0 END) AS Donor_Hepatitis_B_Count,
    SUM(CASE WHEN D_Hepatitis_C = 1 THEN 1 ELSE 0 END) AS Donor_Hepatitis_C_Count
FROM 
    livert
UNION ALL
SELECT 
    'Recipient' AS Person_Type,
    SUM(CASE WHEN R_Hepatitis_B = 1 THEN 1 ELSE 0 END) AS Recipient_Hepatitis_B_Count,
    SUM(CASE WHEN R_Hepatitis_C = 1 THEN 1 ELSE 0 END) AS Recipient_Hepatitis_C_Count
FROM 
    livert;

/*What percentage of donors and recipients have diabetes, hypertension, alcohol abuse, or smoking history?*/
SELECT 
    'Donor' AS person_type,
    (SUM(CASE WHEN D_Diabetes = 'Yes' THEN 1 ELSE 0 END) +
     SUM(CASE WHEN D_Hypertension = 'Yes' THEN 1 ELSE 0 END) +
     SUM(CASE WHEN D_Alcohol_Abuse = 'Yes' THEN 1 ELSE 0 END) +
     SUM(CASE WHEN D_Smoking = 'Yes' THEN 1 ELSE 0 END)) * 100.0 / COUNT(*) 
    AS "Donor with diabetes, hypertension, alcohol abuse, or smoking history"
FROM 
    livert
UNION ALL 
SELECT 
    'Recipient' AS person_type,
    (SUM(CASE WHEN R_Diabetes = 'Yes' THEN 1 ELSE 0 END) +
     SUM(CASE WHEN R_Hypertension = 'Yes' THEN 1 ELSE 0 END) +
     SUM(CASE WHEN R_Alcohol_Abuse = 'Yes' THEN 1 ELSE 0 END) +
     SUM(CASE WHEN R_Smoking = 'Yes' THEN 1 ELSE 0 END)) * 100.0 / COUNT(*) 
    AS "Recipient with diabetes, hypertension, alcohol abuse, or smoking history"
FROM 
    livert;
    
-- Complication Analysis    
/*What are the most common complications post-liver transplant?*/
select Complications, count(Complications) as complication_count
from livert 
group by Complications
order by complication_count desc;

/*How many recipients have experienced rejection episodes?*/
select count(r_rejection_episodes) 
from livert
where r_rejection_episodes != 0;

/*How many recipients have experienced complications based on different etiologies?*/
select R_Etiology, count(*) as Recipient_count_with_complications 
from livert 
where complications not like "no complication"
group by R_Etiology;

-- Transplant Characteristics Analysis:
/*What is the average cold ischemia time for recipients?*/
Select avg(R_Cold_Ischemia_Time) 
from livert;

/*What is the average warm ischemia time for recipients?*/
Select avg(R_Warm_Ischemia_Time) 
from livert;

/*How many recipients received blood transfusions during the transplant process?*/
Select count(R_Blood_Transfusion) 
from livert
where R_Blood_Transfusion = 1;

-- Risk Factor Analysis
/*Do specific etiologies pose a higher risk of certain complications?*/
SELECT R_Etiology, Complications, COUNT(*) AS Complication_Count
FROM livert 
WHERE Complications != 'no complication'
GROUP BY R_Etiology, Complications
ORDER BY R_Etiology, Complication_Count DESC;

SELECT R_Etiology, Complications, COUNT(*) AS Complication_Count
FROM livert 
WHERE Complications IS NOT NULL
GROUP BY R_Etiology, Complications
ORDER BY R_Etiology, Complication_Count DESC;

















