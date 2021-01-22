-- scripts for SKAT-438 - Import

DELETE FROM TTransAngivelse.dbo.Certifikat_kod 
WHERE Cert_kod = 'X002'
GO
COMMIT
GO

INSERT INTO TTransAngivelse.dbo.Certifikat_kod (Cert_kod, Cert_kod_start_dto, Cert_kod_txt, Cert_kod_slut_dto, BrugerID, BrugerProcess, BrugerTid) 
VALUES ( 'X002', '2016.05.01', 'Udførselstilladelse for Dual-Use produkter (Erhvervsstyrelsen)', null, 'w00324', 'CGI Opret', getdate() )
GO
COMMIT
GO

