-- her laver vi db forfra

Use master
GO
DROP DATABASE IF EXISTS millersdb
CREATE DATABASE millersdb
GO 
USE millersdb;
GO



CREATE TABLE Measurements(
	MeasurementsId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Name NVARCHAR(MAX) NOT NULL,
	Code VARCHAR(3) NOT NULL,
	MeasurementTemplatesId int NOT NULL);

CREATE TABLE MeasurementTemplates(
		MeasurementTemplatesId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
		Name NVARCHAR(MAX) NOT NULL,
		ImagesId INT NULL);

CREATE TABLE Images(
		ImagesId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
		Img VARBINARY(MAX) NOT NULL);

ALTER TABLE MeasurementTemplates
    ADD CONSTRAINT MeasurementTemplates_Images_Fk
    FOREIGN KEY (ImagesId) REFERENCES Images (ImagesId);

ALTER TABLE Measurements
	ADD CONSTRAINT Measurements_MeasurementTemplates_Fk
	FOREIGN KEY (MeasurementTemplatesId) REFERENCES MeasurementTemplates (MeasurementTemplatesId);

GO

-- Insert dummy images
INSERT INTO Images (Img)
VALUES 
    (0x0102030405),
    (0x1122334455),
    (0xFFEEDDCCBB);

-- Insert dummy measurement templates
INSERT INTO MeasurementTemplates (Name, ImagesId)
VALUES
    ('Template A', 1),
    ('Template B', 2),
    ('Template C', NULL), -- no image
    ('Template D', 3);

-- Insert dummy measurements
INSERT INTO Measurements (Name, Code, MeasurementTemplatesId)
VALUES
    ('Length', 'LEN', 1),
    ('Width', 'WID', 1),
    ('Height', 'HGT', 2),
    ('Diameter', 'DIA', 2),
    ('Circumference', 'CIR', 3),
    ('Weight', 'WGT', 4);

GO


