-- creating T1DX data spec tables 
CREATE TABLE dbo.T1DX_patients (
organization_id NVARCHAR(32),
patient_id NVARCHAR(32) PRIMARY KEY,
provider_id NVARCHAR(32),
birth_date DATE,
postal_code CHAR(5),
death_date DATE NULL,
cause_of_death NVARCHAR(255) NULL,
sex NVARCHAR(20),
gender_identity NVARCHAR(50),
race_1 NVARCHAR(20),
race_2 NVARCHAR(20),
ethnicity NVARCHAR(20),
language NVARCHAR(10),
caregivers_language NVARCHAR(10),
primary_insurance_type INT,
secondary_insurance_type INT,
tertiary_insurance_type INT,
education_level NVARCHAR(20)
);


ALTER TABLE dbo.T1DX_patients
ALTER COLUMN birth_date DATE NULL


ALTER TABLE dbo.T1DX_patients
ALTER COLUMN postal_code CHAR(5) NULL;



SELECT *
FROM dbo.T1DX_patients

CREATE TABLE dbo.T1DX_providers (
organization_id NVARCHAR(32),
npi_id NVARCHAR(20),
pos_id NVARCHAR(32),
dea_id NVARCHAR(20),
provider_id NVARCHAR(32) PRIMARY KEY,
provider_id_type NVARCHAR(50)
);

SELECT *
FROM dbo.T1DX_providers

DROP TABLE dbo.T1DX_encounters

CREATE TABLE dbo.T1DX_encounters (
organization_id NVARCHAR(32),
patient_id NVARCHAR(32),
encounter_id NVARCHAR(32) PRIMARY KEY,
encounter_date DATE,
encounter_time TIME,
class NVARCHAR (30),
encounter_reason_code NVARCHAR(50),
encounter_reason_code_type NVARCHAR(20),
provider_id NVARCHAR(32),
status NVARCHAR(20),
status_actor NVARCHAR(20),
status_reason NVARCHAR(255),
primary_insurance_type NVARCHAR(10),
secondary_insurance_type NVARCHAR(10),
endo_visit NVARCHAR(10)
);

SELECT *
FROM T1DX_encounters

CREATE TABLE dbo.T1DX_observations (
organization_id NVARCHAR(32),
patient_id NVARCHAR(32),
encounter_id NVARCHAR(32),
observation_id NVARCHAR(32) PRIMARY KEY,
category NVARCHAR(30),
effective_date DATE,
effective_time TIME,
code NVARCHAR(20),
code_type NVARCHAR(20),
status NVARCHAR(20),
value NVARCHAR(20),
value_units NVARCHAR(20),
low_test_vaLue NVARCHAR(20),
high_test_value NVARCHAR(20)
);

ALTER TABLE dbo.T1DX_observations
ALTER COLUMN effective_date DATE 

ALTER TABLE dbo.T1DX_observations
ALTER COLUMN effective_time TIME

CREATE TABLE dbo.T1DX_conditions (
organiztion_id NVARCHAR(32),
patient_id NVARCHAR(32),
encounter_id NVARCHAR(32),
condition_id NVARCHAR(32) PRIMARY KEY,
provider_id NVARCHAR(32),
recorded_date DATE,
order_num INT,
onset_date DATE,
abatement_date DATE,
code NVARCHAR(20),
code_type NVARCHAR(20)
);

CREATE TABLE dbo.T1DX_medications (
organiztion_id NVARCHAR(32),
patient_id NVARCHAR(32),
encounter_id NVARCHAR(32),
medication_id NVARCHAR(32),
prescriber_id NVARCHAR(32),
written_date DATE,
status NVARCHAR(20),
code NVARCHAR(20),
code_type NVARCHAR(20),
drug_name NVARCHAR (50),
drug_name_generic NVARCHAR(50),
drug_class NVARCHAR(50),
drug_sub_class NVARCHAR(50)
);

-- loading all of the allowed values in one table
CREATE TABLE dbo.allowed_values (
field_name NVARCHAR(100), 
allowed_value NVARCHAR(100)
);


Select *
From dbo.allowed_values
--Adding allowed values from the patient table
-- Sex
INSERT INTO dbo.allowed_values VALUES ('sex', 'male');
INSERT INTO dbo.allowed_values VALUES ('sex', 'female');
INSERT INTO dbo.allowed_values VALUES ('sex', 'non-binary');
INSERT INTO dbo.allowed_values VALUES ('sex', 'other');
INSERT INTO dbo.allowed_values VALUES ('sex', 'unknown');

alter table allowed_values
ADD CONSTRAINT

-- Gender Identity
INSERT INTO dbo.allowed_values VALUES ('gender_identity', 'female');
INSERT INTO dbo.allowed_values VALUES ('gender_identity', 'male');
INSERT INTO dbo.allowed_values VALUES ('gender_identity', 'transgender_female');
INSERT INTO dbo.allowed_values VALUES ('gender_identity', 'transgender_male');
INSERT INTO dbo.allowed_values VALUES ('gender_identity', 'gender_queer');
INSERT INTO dbo.allowed_values VALUES ('gender_identity', 'non-binary');
INSERT INTO dbo.allowed_values VALUES ('gender_identity', 'other');
INSERT INTO dbo.allowed_values VALUES ('gender_identity', 'choose_not_to_disclose');
INSERT INTO dbo.allowed_values VALUES ('gender_identity', 'unknown');

-- Race
INSERT INTO dbo.allowed_values VALUES ('race', '1002-5');
INSERT INTO dbo.allowed_values VALUES ('race', '2028-9');
INSERT INTO dbo.allowed_values VALUES ('race', '2054-5');
INSERT INTO dbo.allowed_values VALUES ('race', '2076-8');
INSERT INTO dbo.allowed_values VALUES ('race', '2131-1');
INSERT INTO dbo.allowed_values VALUES ('race', '2106-3');
INSERT INTO dbo.allowed_values VALUES ('race', '9999-9');

-- Ethnicity
INSERT INTO dbo.allowed_values VALUES ('ethnicity', '2135-2');
INSERT INTO dbo.allowed_values VALUES ('ethnicity', '2186-5');
INSERT INTO dbo.allowed_values VALUES ('ethnicity', '9999-9');

-- Language
INSERT INTO dbo.allowed_values VALUES ('language', 'en');
INSERT INTO dbo.allowed_values VALUES ('language', 'es');
INSERT INTO dbo.allowed_values VALUES ('language', 'zh');
INSERT INTO dbo.allowed_values VALUES ('language', 'vi');
INSERT INTO dbo.allowed_values VALUES ('language', 'fr');
INSERT INTO dbo.allowed_values VALUES ('language', 'ar');
INSERT INTO dbo.allowed_values VALUES ('language', 'ko');
INSERT INTO dbo.allowed_values VALUES ('language', 'hy');
INSERT INTO dbo.allowed_values VALUES ('language', 'ru');
INSERT INTO dbo.allowed_values VALUES ('language', 'tl');
INSERT INTO dbo.allowed_values VALUES ('language', 'other');
INSERT INTO dbo.allowed_values VALUES ('language', 'unknown');

-- Caregivers Language
INSERT INTO dbo.allowed_values VALUES ('caregivers_language', 'en');
INSERT INTO dbo.allowed_values VALUES ('caregivers_language', 'es');
INSERT INTO dbo.allowed_values VALUES ('caregivers_language', 'zh');
INSERT INTO dbo.allowed_values VALUES ('caregivers_language', 'vi');
INSERT INTO dbo.allowed_values VALUES ('caregivers_language', 'fr');
INSERT INTO dbo.allowed_values VALUES ('caregivers_language', 'ar');
INSERT INTO dbo.allowed_values VALUES ('caregivers_language', 'ko');
INSERT INTO dbo.allowed_values VALUES ('caregivers_language', 'hy');
INSERT INTO dbo.allowed_values VALUES ('caregivers_language', 'ru');
INSERT INTO dbo.allowed_values VALUES ('caregivers_language', 'tl');
INSERT INTO dbo.allowed_values VALUES ('caregivers_language', 'other');
INSERT INTO dbo.allowed_values VALUES ('caregivers_language', 'unknown');

-- Insurance Types
INSERT INTO dbo.allowed_values VALUES ('primary_insurance_type', '1');
INSERT INTO dbo.allowed_values VALUES ('primary_insurance_type', '2');
INSERT INTO dbo.allowed_values VALUES ('primary_insurance_type', '3');
INSERT INTO dbo.allowed_values VALUES ('primary_insurance_type', '4');
INSERT INTO dbo.allowed_values VALUES ('primary_insurance_type', '5');
INSERT INTO dbo.allowed_values VALUES ('primary_insurance_type', '9');
INSERT INTO dbo.allowed_values VALUES ('primary_insurance_type', '10');
-- Repeat for secondary and tertiary insurance types

-- Education Level
INSERT INTO dbo.allowed_values VALUES ('education_level', 'ps');
INSERT INTO dbo.allowed_values VALUES ('education_level', 'kg');
INSERT INTO dbo.allowed_values VALUES ('education_level', 'es');
INSERT INTO dbo.allowed_values VALUES ('education_level', 'ms');
INSERT INTO dbo.allowed_values VALUES ('education_level', 'shs');
INSERT INTO dbo.allowed_values VALUES ('education_level', 'hsg');
INSERT INTO dbo.allowed_values VALUES ('education_level', 'sc');
INSERT INTO dbo.allowed_values VALUES ('education_level', 'cg');
INSERT INTO dbo.allowed_values VALUES ('education_level', 'pg');
INSERT INTO dbo.allowed_values VALUES ('education_level', 'unknown');

--Adding allowed values from provider table

-- Allowed values for provider_type
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('provider_type', 'MD');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('provider_type', 'DO');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('provider_type', 'PA');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('provider_type', 'NP');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('provider_type', 'RN');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('provider_type', 'RD');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('provider_type', 'EP');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('provider_type', 'PS');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('provider_type', 'SW');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('provider_type', 'CDE');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('provider_type', 'PH');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('provider_type', 'OD');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('provider_type', 'PO');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('provider_type', 'PT');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('provider_type', 'OT');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('provider_type', 'OTH');

--Creating allowed values for encounters
-- Allowed values for class
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('class', 'inpatient');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('class', 'outpatient');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('class', 'ambulatory');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('class', 'emergency');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('class', 'home');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('class', 'field');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('class', 'daytime');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('class', 'virtual');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('class', 'education');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('class', 'other');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('class', 'medication');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('class', 'laboratory');

-- Allowed values for encounter_reason_code_type
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('encounter_reason_code_type', 'cpt');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('encounter_reason_code_type', 'snomedct');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('encounter_reason_code_type', 'icd10');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('encounter_reason_code_type', 'icd9');

-- Allowed values for status
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('status', 'planned');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('status', 'completed');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('status', 'canceled');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('status', 'rescheduled');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('status', 'left_before_seen');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('status', 'left_before_completed');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('status', 'no_show');

-- Allowed values for insurance types
-- Secondary Insurance Type
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('secondary_insurance_type', '1');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('secondary_insurance_type', '2');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('secondary_insurance_type', '3');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('secondary_insurance_type', '4');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('secondary_insurance_type', '5');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('secondary_insurance_type', '9');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('secondary_insurance_type', '10');

-- Tertiary Insurance Type
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('tertiary_insurance_type', '1');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('tertiary_insurance_type', '2');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('tertiary_insurance_type', '3');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('tertiary_insurance_type', '4');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('tertiary_insurance_type', '5');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('tertiary_insurance_type', '9');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('tertiary_insurance_type', '10');

-- Allowed values for endo_visit
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('endo_visit', '0');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('endo_visit', '1');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('endo_visit', '2');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('endo_visit', '99');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('endo_visit', '100');

--creating allowed values for observations
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('category', 'social history');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('category', 'vital signs');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('category', 'laboratory');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('category', 'survey');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '8280-0');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '29463-7');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '8302-2');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '8310-5');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '39156-5');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '59408-5');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '9279-1');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '8460-6');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '8462-4');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '8478-0');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', 'social-history');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '54845-3');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '11367-0');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '74011-8');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '97063-2');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '55758-7');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '70272-0');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '94328-2');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '44261-6');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', 'asgs');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '70274-6');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '88124-3');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '88122-7');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '93030-5');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '93033-9');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '4548-4');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '17856-6');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '4549-2');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', 'poca1c');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '31209-0');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '56718-0');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '32636-3');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '8072-1');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '76651-9');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '13926-1');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '56540-8');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '2093-3');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '2085-9');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '2089-1');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '13457-5');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '2571-8');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '3024-7');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '3026-2');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '14957-5');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '6942-7');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '2161-8');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '2160-0');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '10466-1');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '1863-0');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '33037-3');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code', '1986-9');

--creating allowed values for the conditions table
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code_type', 'snomedct');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code_type', 'icd11');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code_type', 'icd10');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code_type', 'icd9');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code_type', 'rxnorm');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code_type', 'ndc');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('code_type', 'internal');

INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('status', 'active');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('status', 'inactive');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('status', 'others');

INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('encounter_reason_code_type', 'cpt');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('encounter_reason_code_type', 'snomed ct');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('encounter_reason_code_type', 'icd10');
INSERT INTO dbo.allowed_values (field_name, allowed_value) VALUES ('encounter_reason_code_type', 'icd9');

--removing duplicates 
WITH CTE AS (
    SELECT 
        field_name,
        allowed_value,
        ROW_NUMBER() OVER (PARTITION BY field_name, allowed_value ORDER BY (SELECT NULL)) AS rn
    FROM dbo.allowed_values
)
DELETE FROM CTE WHERE rn > 1;



