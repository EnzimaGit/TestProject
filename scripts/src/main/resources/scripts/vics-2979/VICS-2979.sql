insert into TTransAngivelse.dbo.Svar_txt
(Svar_txt_kod, Svar_txt_start_dto, Svar_txt, BrugerId, BrugerProcess, BrugerTid, Land_kod)
values ('5193', '2016-03-30 00:00:00.0', 'Den angivne toldoplagstype D er ikke tilladt.', 'CGI', 'Oprettet', getDate(), 'DK')
go

commit
go