-- SQL Scripts 
-- Name: skat-1847_import_procedurekoder 
-- Issue: SKAT-1847 
-- Environment: PRODUCTION 
-- System/DB: Import/TTansAngivelse 
-- Expected result: Creation of multible records in the Procedurekode table
-- Expected Output:
--SKAT-1847 - Script starting
--SKAT-1847 - Allocating cursor
--SKAT-1847 - Declaring variables
--SKAT-1847(2017-05-22T11:21:23) - Quick select before
--SKAT-1847(2017-05-22T11:21:23) - Number of 71* records in Procedurekode table: 24
--SKAT-1847(2017-05-22T11:21:23) - Existing 71* records in Proc_bev table: 0
--SKAT-1847(2017-05-22T11:21:23) - Begin transaction
--SKAT-1847(2017-05-22T11:21:23) - Opening cursor
--SKAT-1847(2017-05-22T11:21:23) - Inserting new records
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7100099
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7100099/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7100099/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7100099/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7100099/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7100099/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7100099/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7110000
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7110000/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7110000/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7110000/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7110000/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7110000/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7110000/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7121199
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121199/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121199/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121199/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121199/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121199/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121199/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7121299
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121299/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121299/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121299/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121299/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121299/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121299/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7121B05
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121B05/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121B05/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121B05/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121B05/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121B05/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121B05/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7121F31
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121F31/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121F31/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121F31/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121F31/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121F31/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7121F31/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7122299
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7122299/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7122299/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7122299/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7122299/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7122299/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7122299/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7122B05
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7122B05/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7122B05/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7122B05/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7122B05/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7122B05/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7122B05/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7123099
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7123099/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7123099/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7123099/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7123099/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7123099/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7123099/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7131000
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7131000/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7131000/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7131000/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7131000/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7131000/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7131000/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7141199
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141199/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141199/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141199/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141199/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141199/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141199/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7141299
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141299/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141299/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141299/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141299/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141299/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141299/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7141F32
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141F32/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141F32/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141F32/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141F32/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141F32/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7141F32/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7151199
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151199/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151199/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151199/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151199/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151199/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151199/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7151299
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151299/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151299/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151299/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151299/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151299/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151299/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7151F32
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151F32/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151F32/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151F32/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151F32/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151F32/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7151F32/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7153099
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7153099/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7153099/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7153099/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7153099/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7153099/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7153099/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7154099
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7154099/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7154099/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7154099/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7154099/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7154099/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7154099/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7154F32
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7154F32/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7154F32/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7154F32/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7154F32/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7154F32/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7154F32/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7171099
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7171099/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7171099/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7171099/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7171099/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7171099/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7171099/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7191099
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7191099/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7191099/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7191099/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7191099/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7191099/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7191099/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7191F34
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7191F34/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7191F34/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7191F34/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7191F34/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7191F34/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7191F34/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7192099
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7192099/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7192099/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7192099/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7192099/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7192099/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7192099/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Procesing procedurekode: 7192F34
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7192F34/165 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7192F34/171 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7192F34/263 record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7192F34/396record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7192F34/398record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Inserted 7192F34/415record in Proc_bev
--SKAT-1847(2017-05-22T11:21:23) - Comitting transaction
--SKAT-2157 - Declaring variables (2)
--SKAT-1847(2017-05-22T11:21:23) - Quick select after
--SKAT-1847(2017-05-22T11:21:23) - Existing 71* records in Proc_bev table: 144
--SKAT-1847 - Script finishing



PRINT 'SKAT-1847 - Script starting' 

PRINT 'SKAT-1847 - Allocating cursor'
DEALLOCATE CURSOR curProcedurekode 
GO

DECLARE curProcedurekode CURSOR FOR 
        SELECT 
                Proc_kod 
        FROM TTransAngivelse..Procedurekode 
        WHERE Proc_kod LIKE '71%'
        AND ( Proc_kod_start_dto  < getDate() ) 
        AND ( Proc_kod_slut_dto = NULL OR Proc_kod_slut_dto > getDate() ) 
        FOR READ ONLY 
GO 

PRINT 'SKAT-1847 - Declaring variables' 
DECLARE 
        @now datetime 
        , @nowString varchar(30) 
        , @tmpCount int
        , @session varchar(6)
        , @userName varchar(8)
        , @curProc_kod varchar(7) 
SET @now = getdate() 
SET @nowString = CONVERT(char(26), getdate(), 23) 
SET @session = 'UPDATE' -- Values should be TEST or UPDATE
SET @userName = 'W04285'



PRINT 'SKAT-1847(%1!) - Quick select before', @nowString 
SELECT @tmpCount = COUNT(Proc_kod) 
FROM TTransAngivelse..Procedurekode NOHOLDLOCK 
WHERE Proc_kod LIKE '71%'
AND ( Proc_kod_slut_dto = NULL OR Proc_kod_slut_dto > getDate() ) 
PRINT 'SKAT-1847(%1!) - Number of 71* records in Procedurekode table: %2!', @nowString, @tmpCount 
SELECT @tmpCount = COUNT(Proc_kod) 
FROM TTransAngivelse..Proc_bev NOHOLDLOCK 
WHERE Proc_kod LIKE '71%'
PRINT 'SKAT-1847(%1!) - Existing 71* records in Proc_bev table: %2!', @nowString, @tmpCount 

PRINT 'SKAT-1847(%1!) - Begin transaction', @nowString 
BEGIN TRANSACTION transaction1847 

PRINT 'SKAT-1847(%1!) - Opening cursor', @nowString 
OPEN curProcedurekode 

FETCH curProcedurekode INTO @curProc_kod 

IF @@sqlstatus != 0 
BEGIN 
        SET @now = getDate() 
        PRINT 'SKAT-1847(%1!) - Status: %1!', @now, @@sqlstatus 
        PRINT 'SKAT-1847(%1!) - Cursor is empty!', @now 
END 

PRINT 'SKAT-1847(%1!) - Inserting new records', @nowString 
WHILE @@sqlstatus = 0 
BEGIN 

    PRINT 'SKAT-1847(%1!) - Procesing procedurekode: %2!', @nowString, @curProc_kod  
    BEGIN
        IF @session = 'UPDATE'
        BEGIN
                INSERT INTO TTransAngivelse..Proc_bev (Proc_kod, Bev_kod, Proc_bev_start_dto, Proc_bev_kod, Proc_bev_slut_dto, BrugerID, BrugerProcess, BrugerTid) 
                VALUES (@curProc_kod, '165', @now, '1', NULL, @userName, 'SKAT-1847', @now)
        END
        PRINT 'SKAT-1847(%1!) - Inserted %2!/165 record in Proc_bev', @nowString, @curProc_kod 

        IF @session = 'UPDATE'
        BEGIN
                INSERT INTO TTransAngivelse..Proc_bev (Proc_kod, Bev_kod, Proc_bev_start_dto, Proc_bev_kod, Proc_bev_slut_dto, BrugerID, BrugerProcess, BrugerTid) 
                VALUES (@curProc_kod, '171', @now, '1', NULL, @userName, 'SKAT-1847', @now)
        END
        PRINT 'SKAT-1847(%1!) - Inserted %2!/171 record in Proc_bev', @nowString, @curProc_kod 

        IF @session = 'UPDATE'
        BEGIN
                INSERT INTO TTransAngivelse..Proc_bev (Proc_kod, Bev_kod, Proc_bev_start_dto, Proc_bev_kod, Proc_bev_slut_dto, BrugerID, BrugerProcess, BrugerTid) 
                VALUES (@curProc_kod, '263', @now, '1', NULL, @userName, 'SKAT-1847', @now)
        END
        PRINT 'SKAT-1847(%1!) - Inserted %2!/263 record in Proc_bev', @nowString, @curProc_kod 

        IF @session = 'UPDATE'
        BEGIN
                INSERT INTO TTransAngivelse..Proc_bev (Proc_kod, Bev_kod, Proc_bev_start_dto, Proc_bev_kod, Proc_bev_slut_dto, BrugerID, BrugerProcess, BrugerTid) 
                VALUES (@curProc_kod, '396', @now, '1', NULL, @userName, 'SKAT-1847', @now)
        END
        PRINT 'SKAT-1847(%1!) - Inserted %2!/396record in Proc_bev', @nowString, @curProc_kod 

        IF @session = 'UPDATE'
        BEGIN
                INSERT INTO TTransAngivelse..Proc_bev (Proc_kod, Bev_kod, Proc_bev_start_dto, Proc_bev_kod, Proc_bev_slut_dto, BrugerID, BrugerProcess, BrugerTid) 
                VALUES (@curProc_kod, '398', @now, '1', NULL, @userName, 'SKAT-1847', @now)
        END
        PRINT 'SKAT-1847(%1!) - Inserted %2!/398record in Proc_bev', @nowString, @curProc_kod 

        IF @session = 'UPDATE'
        BEGIN
                INSERT INTO TTransAngivelse..Proc_bev (Proc_kod, Bev_kod, Proc_bev_start_dto, Proc_bev_kod, Proc_bev_slut_dto, BrugerID, BrugerProcess, BrugerTid) 
                VALUES (@curProc_kod, '415', @now, '1', NULL, @userName, 'SKAT-1847', @now)
        END
        PRINT 'SKAT-1847(%1!) - Inserted %2!/415record in Proc_bev', @nowString, @curProc_kod 
    END
    
    FETCH curProcedurekode INTO @curProc_kod 
END

IF @@sqlstatus = 2 -- sqlStatus 2 means There is no more data in the result set.
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
SELECT @tmpCount = COUNT(Proc_kod) 
FROM Proc_bev NOHOLDLOCK 
WHERE Proc_kod LIKE '71%'
PRINT 'SKAT-1847(%1!) - Existing 71* records in Proc_bev table: %2!', @nowString, @tmpCount 
GO 

PRINT 'SKAT-1847 - Script finishing' 
