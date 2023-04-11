use Universidad

create table Estudiante(Id int primary key identity(1,1),
Carne varchar(50)
)

create schema Administracion

create table Administracion.Empleado(Id int)

exec sp_addumpdevice 'disk', 'BackupUniversidad', 'D:\Base de Datos\Respaldos\Universidad.bak'

backup database Universidad to BackupUniversidad

--Como agregar un archivo .ndf
--alter database Universidad
--add filegroup Datos

alter database Universidad
add file (
	name = Universidad_Extension,
	filename = 'D:\Base de Datos\Archivos BD\UniversidadE.ndf'
)
create table Alumno(Id int)

alter database Universidad set recovery Full

-- Con serveradmin
shutdown;

-- Con db_ddladmin
select * from Estudiante
alter table Estudiante add FechaIngreso date

create table dbo.Profesor(Id int)
select * from Profesor

create table Administracion.Finanzas(IdFinanzas int)

--Investigar securityadmin
-- Por que securityadmin debe ser tratado como equivalente a sysadmin y demostrarlo