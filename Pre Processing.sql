select * from livert;

-- Shape of Data 
/*Number of columns*/
SELECT COUNT(*) AS column_count
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'livert' AND table_schema = 'liver_db';

/*Number of rows*/
select count(*) from livert;

-- Missing values
SELECT *
FROM livert
WHERE Column1 IS NULL
   OR D_Age IS NULL
   OR D_BMI IS NULL
   OR D_Cause_of_Death IS NULL
   OR D_Diabetes IS NULL
   OR D_Hypertension IS NULL
   OR D_Alcohol_Abuse IS NULL
   OR D_Smoking IS NULL
   OR D_Lympochyte IS NULL
   OR D_Hepatitis_B IS NULL
   OR D_Hepatitis_C IS NULL
   OR R_Etiology IS NULL
   OR R_MELD_Score IS NULL
   OR R_Age IS NULL
   OR R_BMI IS NULL
   OR R_Diabetes IS NULL
   OR R_Hypertension IS NULL
   OR R_Alcohol_Abuse IS NULL
   OR R_Smoking IS NULL
   OR R_Lympochyte IS NULL
   OR R_Hepatitis_B IS NULL
   OR R_Hepatitis_C IS NULL
   OR R_Albumin_level IS NULL
   OR R_Alcoholic_cirrhosis IS NULL
   OR R_Primary_biliary_cirrhosis IS NULL
   OR R_Na IS NULL
   OR R_Mg IS NULL
   OR R_WBC IS NULL
   OR R_Platelets IS NULL
   OR R_Cold_Ischemia_Time IS NULL
   OR R_Warm_Ischemia_Time IS NULL
   OR R_Blood_Transfusion IS NULL
   OR R_Immunosuppressant_Medication IS NULL
   OR R_Rejection_Episodes IS NULL
   OR Complications IS NULL;
 
-- Removing missing values
 DELETE FROM livert WHERE D_Hepatitis_B IS NULL;
 DELETE FROM livert WHERE R_Etiology IS NULL;
 DELETE FROM livert WHERE R_Gender IS NULL;
 DELETE FROM livert WHERE R_BMI IS NULL;
 DELETE FROM livert WHERE R_Lympochyte IS NULL;
 DELETE FROM livert WHERE R_Blood_Transfusion IS NULL;
 
-- do i need to remove outliers
/*Whether you should remove outliers from your data in SQL depends on the specific context of your analysis and the goals you are trying to achieve.
 Outliers are data points that significantly differ from other observations in the dataset.
 Removing outliers can sometimes be beneficial for certain types of analysis, but it can also potentially lead to a loss of valuable information.
 Consider the purpose of your analysis. If you are performing statistical analysis or building a predictive model, removing outliers might be necessary to ensure that your results are not skewed by extreme values. 
 On the other hand, if you are interested in understanding the full range of your data, removing outliers may not be appropriate.
 Here we are only interested in analysis so for this project we don't need to remove outliers.
*/

