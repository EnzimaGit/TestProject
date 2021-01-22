-- SQL Scripts 
-- Name: skat-1847_import__procedurekode_rollback 
-- Issue: SKAT-1847 
-- Environment: PRODUCTION 
-- System/DB: Import/TTansAngivelse 
-- Expected result: Removal of any new 71* records from the Proc_bev table
-- Expected Output:
--   SKAT-1847 - Script starting
--   SKAT-1847 - Declaring variables
--   SKAT-1847(2017-05-22T12:51:02) - Quick select before
--   SKAT-1847(2017-05-22T12:51:02) - Total records in Proc_bev table: 909
--   SKAT-1847(2017-05-22T12:51:02) - Existing and recent 71* records in Proc_bev table: 144
--   SKAT-1847(2017-05-22T12:51:02) - Begin transaction
--   SKAT-1847(2017-05-22T12:51:02) - Deleting record(s)
--   SKAT-1847(2017-05-22T12:51:02) - Comitting transaction
--   SKAT-2157 - Declaring variables (2)
--   SKAT-1847(2017-05-22T12:51:03) - Quick select after
--   SKAT-1847(2017-05-22T12:51:03) - Total records in Proc_bev table: 765
--   SKAT-1847(2017-05-22T12:51:03) - Existing and recent 71* records in Proc_bev table: 0
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
SELECT @tmpCount = COUNT(Proc_kod) 
FROM TTransAngivelse..Proc_bev NOHOLDLOCK 
PRINT 'SKAT-1847(%1!) - Total records in Proc_bev table: %2!', @nowString, @tmpCount 
SELECT @tmpCount = COUNT(Proc_kod) 
FROM TTransAngivelse..Proc_bev NOHOLDLOCK 
WHERE Proc_kod LIKE '71%'
AND BrugerTid > '2017.05.22'
PRINT 'SKAT-1847(%1!) - Existing and recent 71* records in Proc_bev table: %2!', @nowString, @tmpCount 

PRINT 'SKAT-1847(%1!) - Begin transaction', @nowString 
BEGIN TRANSACTION transaction1847 

PRINT 'SKAT-1847(%1!) - Deleting record(s)', @nowString 
DELETE TTransAngivelse..Proc_bev
WHERE Proc_kod LIKE '71%'
AND BrugerTid > '2017.05.22'

IF @@error = 0 
BEGIN 
        PRINT 'SKAT-1847(%1!) - Comitting transaction', @nowString 
        COMMIT TRANSACTION transaction1847 
END 
ELSE 
BEGIN 
        PRINT 'SKAT-1847(%1!) - Roling back transaction', @nowString 
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
SELECT @tmpCount = COUNT(Proc_kod) 
FROM TTransAngivelse..Proc_bev NOHOLDLOCK 
PRINT 'SKAT-1847(%1!) - Total records in Proc_bev table: %2!', @nowString, @tmpCount 
SELECT @tmpCount = COUNT(Proc_kod) 
FROM TTransAngivelse..Proc_bev NOHOLDLOCK 
WHERE Proc_kod LIKE '71%'
AND BrugerTid > '2017.05.22'
PRINT 'SKAT-1847(%1!) - Existing and recent 71* records in Proc_bev table: %2!', @nowString, @tmpCount 
GO 

PRINT 'SKAT-1847 - Script finishing' 
