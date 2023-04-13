use Northwind

create login Sistemas with password = 'uni2023'
go
-- El procedimiento sp_adduser crea el esquema junto el usuario en la BD
exec sp_adduser Sistemas, Sistemas

--Create user solo crea el usuario sin esquema
create user Sistemas from login Sistemas


exec sp_addrolemember [db_backupoperator], Sistemas

exec sp_droprolemember db_owner, Sistemas
exec sp_changedbowner sa

exec sp_srvrolepermission

exec sp_droprolemember db_backupoperator, sistemas

-- Se borra 
drop user Sistemas
drop schema Sistemas

exec sp_helprolemember
sp_helpuser Sistemas

-- Agrega al rol datareader
exec sp_addrolemember db_datareader, Sistemas

create schema Administracion

create table Administracion.Factura(Id int)

--deny select on schema::Administracion to Sistemas
deny select on dbo.Customers to Sistemas

sp_droprolemember db_datareader, Sistemas
exec sp_helprotect null, sistemas

grant select on dbo.Products to Sistemas

sp_droprolemember db_denydatareader, Sistemas
sp_helprolemember 

grant create table to Sistemas
revoke create table to Sistemas

sp_droprolemember db_ddladmin, Sistemas

sp_addrolemember db_datawriter, sistemas

revoke update on Region to Sistemas
revoke select on Region to Sistemas
revoke select on Customers to Sistemas
revoke select on Products to Sistemas

alter table Region add Estado varchar(50)

sp_helprolemember

revoke update, insert, select
on Region to Sistemas

ALTER AUTHORIZATION ON SCHEMA::[Sistemas] TO [dbo]
GO

create role SistemaAdministrador

grant select, update, insert on Products to SistemaAdministrador
grant select on Orders to SistemaAdministrador

exec sp_helprotect null, SistemaAdministrador

exec sp_addrolemember SistemaAdministrador, Sistemas

--Terminar la guia

