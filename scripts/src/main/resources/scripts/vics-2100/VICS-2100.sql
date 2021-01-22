UPDATE Svar_txt
SET
	Svar_txt_slut_dto = '2015-09-30 23:59:59.0',
	BrugerProcess = 'Lukket',
	BrugerTid = getDate()
WHERE Svar_txt_kod = '1088'
AND Svar_txt_slut_dto = null;

INSERT INTO Svar_txt
(Svar_txt_kod, Svar_txt_start_dto, Svar_txt, BrugerId, BrugerProcess, BrugerTid, Land_kod)
VALUES ('1088', '2015-10-01 00:00:00.0', 'Det grænseoverskridende aktive transportmiddels identitet og nationalitet skal udfyldes', 'CGI', 'Oprettet', getDate(), 'DK');

INSERT INTO Svar_txt
(Svar_txt_kod, Svar_txt_start_dto, Svar_txt, BrugerId, BrugerProcess, BrugerTid, Land_kod)
VALUES ('1316', '2015-10-01 00:00:00.0', 'Rubrik 2, 6, 12, 18, 21, 22, 36 og 39 er ikke alle udfyldt korekt', 'CGI', 'Oprettet', getDate(), 'DK');

INSERT INTO Svar_txt
(Svar_txt_kod, Svar_txt_start_dto, Svar_txt, BrugerId, BrugerProcess, BrugerTid, Land_kod)
VALUES ('1317', '2015-10-01 00:00:00.0', 'Rubrik 42 skal udfyldes, jf procedurekoden/toldoplagstype', 'CGI', 'Oprettet', getDate(), 'DK');

