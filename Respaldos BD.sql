-- Visualizar el contenido del archivo .bak

restore headeronly from disk =
'D:\Base de Datos\Respaldos\Northwind.bak'

restore filelistonly from disk =
'D:\Base de Datos\Respaldos\Northwind.bak'
with file = 1

-- Restaurando la base de datos Northwind

restore database Northwind
from disk = 'D:\Base de Datos\Respaldos\Northwind.bak'
with file = 1,
move 'Northwind' to 'D:\Base de Datos\Archivos BD\MDF\northwnd.mdf',
move 'Northwind_1' to 'D:\Base de Datos\Archivos BD\NDF\Northwind_1.ndf',
move 'Northwind_2' to 'D:\Base de Datos\Archivos BD\NDF\Northwind_2.ndf',
move 'Northwind_log' to 'D:\Base de Datos\Archivos BD\LDF\northwnd.ldf'

-- Respaldo BD Northwind con nueva ubicacion

backup database Northwind to disk =
'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'

restore filelistonly from disk =
'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'
with file = 2

restore headeronly from disk =
'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'

-----------------------------------------------------------
use master
go
drop database Northwind
-----------------------------------------------------------
restore database Northwind
from disk = 'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'
with file = 1

-- Separacion y vinculacion de base de datos Northwind

sp_detach_db Northwind

sp_attach_db Northwind,
'D:\Base de Datos\Archivos BD\Archivos BD Northwind\MDF\northwnd.mdf',
'D:\Base de Datos\Archivos BD\Archivos BD Northwind\NDF\Northwind_1.ndf',
'D:\Base de Datos\Archivos BD\Archivos BD Northwind\NDF\Northwind_2.ndf',
'D:\Base de Datos\Archivos BD\Archivos BD Northwind\LDF\northwnd.ldf'

-- Respaldo del registro de transacciones
use Northwind
go
select * from Region

backup database Northwind to disk =
'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'
-------------------------------------------------
backup database Northwind to disk =
'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'
with
differential
-------------------------------------------------
backup log Northwind to disk =
'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'

insert into Region values(7, 'América')

restore database Northwind from disk =
'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'
with file = 1,
noRecovery

-- Modelo de recuperacion: Full-Simple-Insercion Masiva

sp_helpdb Northwind

alter database Northwind
set recovery Simple

alter database Northwind
set recovery Full

-- creacion de dispositivo de almacenamiento

sp_addumpdevice 'Disk', -- Medio
'Respaldo_Northwind',  -- Nombre del dispositivo
'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak' -- Direccion

backup database Northwind to Respaldo_Northwind

restore database Northwind from Respaldo_Northwind
with file = 6, replace

restore headeronly from disk =
'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'

sp_helpdevice

-- Investigar bulk insert