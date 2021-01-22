-- SQL Rollback Script
-- Issue:           VICS-2543
-- Author:          Claudio Silva
-- Version:         XYZ (By svn/maven/nexus)
-- System/DB:       Import / TTransAngivelse
-- Expected result: Roolback of 1 row in svar_txt table.

print '## VICS-2543 Rollback Script'
print '## SELECT svar_txt where svar_txt_kod = 5194'
print '## Expected result is only 1 results. If it does not exist it will cause the roolback to fail.'

select svar_txt
from svar_txt
where svar_txt_kod = '5194'
go

print '## rollback'
delete from svar_txt where svar_txt_kod = '5194'
go
print '## SELECT svar_txt where svar_txt_kod = 5194. Expected result is 0 row.'
select svar_txt
from svar_txt
where svar_txt_kod = '5194'
go
