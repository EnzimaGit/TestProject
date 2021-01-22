-- SQL Scripts 
-- Name: skat-1847_import 
-- Issue: SKAT-1847 
-- Environment: PRODUCTION 
-- System/DB: Import/TTansAngivelse 
-- Expected result: Creation of 1 record in the Oplysningstype_Koder table
-- Expected Output:
--   SKAT-1847 - Script starting
--   SKAT-1847 - Declaring variables
--   SKAT-1847(<DATE><TIME>) - Quick select before
--   SKAT-1847(<DATE><TIME>) - Total records in table: <ROWCOUNT>
--   SKAT-1847(<DATE><TIME>) - Existing OPLAGSHAVER records in table: 0
--   SKAT-1847(<DATE><TIME>) - Begin transaction
--   SKAT-1847(<DATE><TIME>) - Inserting record
--   SKAT-1847(<DATE><TIME>) - Comitting transaction
--   SKAT-2157 - Declaring Variables (2)
--   SKAT-1847(<DATE><TIME>) - Quick select after
--   SKAT-1847(<DATE><TIME>) - Total records in table: <ROWCOUNT>+1
--   SKAT-1847(<DATE><TIME>) - Existing OPLAGSHAVER records in table: 1
--   SKAT-1847 - Script finishing


PRINT 'SKAT-1847 - Script starting' 

PRINT 'SKAT-1847 - Declaring variables' 
DECLARE 
        @now datetime 
        , @nowString varchar(30) 
        , @tmpCount int 
SET @now = getdate() 
SET @nowString = CONVERT(char(26), getdate(), 23) 


PRINT 'SKAT-1847(%1!) - Quick select before', @nowString 
SELECT @tmpCount = COUNT(Oplys_kode) 
FROM Oplysningstype_Koder NOHOLDLOCK 
PRINT 'SKAT-1847(%1!) - Total records in table: %2!', @nowString, @tmpCount 
SELECT @tmpCount = COUNT(Oplys_kode) 
FROM Oplysningstype_Koder NOHOLDLOCK 
WHERE Oplys_kode = 'OPLAGSHAVER' 
PRINT 'SKAT-1847(%1!) - Existing OPLAGSHAVER records in table: %2!', @nowString, @tmpCount 

PRINT 'SKAT-1847(%1!) - Begin transaction', @nowString 
BEGIN TRANSACTION transaction1847 

PRINT 'SKAT-1847(%1!) - Inserting record', @nowString 
INSERT INTO Oplysningstype_Koder (Oplys_kode, Oplys_kode_Start_dto, Txt, Systemkode, Regel_kode, Oplys_kode_Slut_dto, BrugerID, BrugerProcess, BrugerTid) 
VALUES ('OPLAGSHAVER', '2017-01-01', 'Alternativ oplagshaver', NULL, '1', null, 'siigerm', 'SKAT-1847', getDate() ) 

IF @@sqlstatus = 0 
BEGIN 
        PRINT 'SKAT-1847(%1!) - Comitting transaction', @nowString 
        COMMIT TRANSACTION transaction1847 
END 
ELSE 
BEGIN 
        PRINT 'SKAT-1847(%1!) - Rolling back transaction', @nowString 
        ROLLBACK TRANSACTION transaction1847 
END 
GO 

PRINT 'SKAT-2157 - Declaring variables (2)' 
DECLARE 
        @now datetime 
        , @nowString varchar(30) 
        , @tmpCount int 
SET @now = getdate() 
SET @nowString = CONVERT(char(26), getdate(), 23) 
PRINT 'SKAT-1847(%1!) - Quick select after', @nowString 
SELECT @tmpCount = COUNT(Oplys_kode) 
FROM Oplysningstype_Koder NOHOLDLOCK 
PRINT 'SKAT-1847(%1!) - Total records in table: %2!', @nowString, @tmpCount 
SELECT @tmpCount = COUNT(Oplys_kode) 
FROM Oplysningstype_Koder NOHOLDLOCK  
WHERE Oplys_kode = 'OPLAGSHAVER' 
PRINT 'SKAT-1847(%1!) - Existing OPLAGSHAVER records in table: %2!', @nowString, @tmpCount 
GO 

PRINT 'SKAT-1847 - Script finishing' 

