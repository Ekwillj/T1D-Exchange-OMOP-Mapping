--------------- If the data in the tables ever need to be cleared, use TRUNCATE TABLE dbo.t1dx_[table]


BULK INSERT dbo.T1DX_patients
FROM 'C:\t1dexchangesamples\t1dx_patients_sample.txt'
WITH
	(
	FIELDTERMINATOR = '|',
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2,
	TABLOCK,
	CODEPAGE = '65001',
	KEEPNULLS
	);

	SELECT *
	FROM dbo.T1DX_patients

	EXEC xp_fileexist 'C:\t1dexchangesamples\t1dx_patients_sample.txt';

BULK INSERT dbo.T1DX_providers
FROM 'C:\t1dexchangesamples\t1dx_providers_sample.txt'
WITH
	(
	FIELDTERMINATOR = '|',
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2,
	TABLOCK,
	CODEPAGE = '65001',
	KEEPNULLS
	);

SELECT *
FROM dbo.T1DX_providers


BULK INSERT dbo.t1dx_conditions
FROM 'C:\t1dexchangesamples\t1dx_conditions_sample.txt'
WITH
	(
	FIELDTERMINATOR = '|',
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2,
	TABLOCK,
	CODEPAGE = '65001',
	KEEPNULLS
	);

SELECT *
FROM dbo.T1DX_conditions

BULK INSERT dbo.T1DX_encounters
FROM 'C:\t1dexchangesamples\t1dx_encounters_sample.txt'
WITH
	(
	FIELDTERMINATOR = '|',
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2,
	TABLOCK,
	CODEPAGE = '65001',
	KEEPNULLS
	);

SELECT *
FROM dbo.T1DX_encounters

BULK INSERT dbo.t1dx_observations
FROM 'C:\t1dexchangesamples\t1dx_observations_sample.txt'
WITH
	(
	FIELDTERMINATOR = '|',
	ROWTERMINATOR = '0x0a',
	TABLOCK,
	CODEPAGE = '65001',
	KEEPNULLS
	);
SELECT *
FROM dbo.T1DX_observations

BULK INSERT dbo.T1DX_medications
FROM 'C:\t1dexchangesamples\t1dx_medications_sample.txt'
WITH
	(
	FIELDTERMINATOR = '|',
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2,
	TABLOCK,
	CODEPAGE = '65001',
	KEEPNULLS
	);

SELECT *
FROM dbo.T1DX_medications