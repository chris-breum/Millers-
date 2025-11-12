-- her laver vi db forfra

Use master
GO
DROP DATABASE IF EXISTS millersdb
CREATE DATABASE millesrdb
GO 
USE millersdb;
GO



CREATE TABLE Measurements(
	MeasurementsId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Name NVARCHAR(MAX) NOT NULL,
	Code VARCHAR(3) NOT NULL);

	CREATE TABLE MeasurementTemplates(
		MeasurementTemplatesId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
		Name NVARCHAR(MAX) NOT NULL);

	CREATE TABLE Images(
		ImagesId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
		Img VARBINARY(MAX) NOT NULL);

