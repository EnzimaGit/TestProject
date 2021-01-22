-- scripts for SKAT-438 - e-Export

DELETE FROM TTransAngivelse.dbo.Certifikat_kod 
WHERE Cert_kod = 'X002'
GO
COMMIT
GO

