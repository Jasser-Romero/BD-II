create database Universidad
go
use Universidad
go

sp_helpdb Universidad

create login Sistemas with password = '1234'

exec sp_changedbowner Sistemas

exec sp_changedbowner sa

exec sp_srvrolepermission

sp_helplogins Sistemas
exec sp_helpsrvrole
exec sp_helpsrvrolemember

create database MiEmpresa

use master
go
deny view any database to Sistemas

-- Asignando rol de servidor
exec sp_addsrvrolemember Sistemas, [diskadmin]

backup database Universidad to BackupUniversidad

-- Eliminando rol de servidor
exec sp_dropsrvrolemember Sistemas, diskadmin
exec sp_addsrvrolemember Sistemas, dbcreator

exec sp_dropsrvrolemember Sistemas, dbcreator

sp_helpsrvrolemember
sp_helpsrvrolemember dbCreator

exec sp_addsrvrolemember Sistemas, serveradmin

sp_helpuser
sp_adduser Sistemas, Sistemas

exec sp_addrolemember db_ddladmin, Sistemas
exec sp_addrolemember db_backupoperator, Sistemas
exec sp_droprolemember db_backupoperator, Sistemas



