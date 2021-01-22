-- SQL Script
-- Issue:           VICS-2543
-- Author:          Claudio Silva
-- Version:         XYZ (By svn/maven/nexus)
-- System/DB:       Import / TTransAngivelse
-- Expected result: Creation of 1 new rows in svar_txt table.

print '## VICS-2543 Script'
print '## SELECT svar_txt where svar_txt_kod = 5194'
print '## Expected result is only 0 results. If one exists it will cause the insert to fail.'

select svar_txt
from svar_txt
where svar_txt_kod = '5194'
go
print '## insert txt'
insert into svar_txt(Svar_txt_kod, Svar_txt_start_dto, Svar_txt, Svar_txt_slut_dto, BrugerId, BrugerProcess, BrugerTid, Land_kod)
values('5194','2017-01-01 00:00:00', 'Det angivne udenlandske momsnummer i rubrik 44.2 kunne ikke kontrolleres. Prøv igen senere.',null,'','','2017-01-01 00:00:00','DK')
go
print '## SELECT svar_txt where svar_txt_kod = 5194. Expected result is 1 row.'
select svar_txt
from svar_txt
where svar_txt_kod = '5194'
go
