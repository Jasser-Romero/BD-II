use model
go
create table Estudiante(IdEstudiante int)

create database Universidad

-- Con consulta
exec msdb.dbo.sp_send_dbmail
@profile_name = 'Administrador de Base de datos',
@recipients = 'jasseromero@outlook.com',
@copy_recipients = 'jasseromero@outlook.com',
@subject = 'Catalogo de regiones',
@body = 'Lista de regiones en el sistema',
@query = 'select * from Northwind.dbo.Region',
@attach_query_result_as_file = 1

--Con SP
exec msdb.dbo.sp_send_dbmail
@profile_name = 'Administrador de Base de datos',
@recipients = 'jasseromero@outlook.com',
@copy_recipients = 'jasseromero@outlook.com',
@subject = 'Catalogo de regiones',
@body = 'Lista de regiones en el sistema',
@query = 'Execute Northwind.dbo.Regiones_Northwind',
@attach_query_result_as_file = 1

create procedure Regiones_Northwind
as
select * from Northwind.dbo.Region

exec Regiones_Northwind

--Realizar un SP que reciba el numero de la orden y enviar por correo electronico la factura utilizando la BD Northwind
--Presentar Fecha, Nombre Cliente, No Orden
--NoProducto, Nombre Producto, Cantidad comprada, precio, descuento, subtotal(precio*cant)
--SubTotal, Total (IVA)

--Como insertar un HTML para darle formato al cuerpo de la factura o mandar en excel o en PDF