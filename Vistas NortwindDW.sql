create database DWNorthwind
go
--use DWNorthwind
--go

select * from Shippers
----------------------
--Creacion de vistas para tablas del DW
create view DimEmpresa
as
select ShipperID, CompanyName as [Nombre de empresa] from Northwind.dbo.Shippers

create view DimCliente
as
select CustomerID, CompanyName as [Nombre de compañia], ContactName as [Nombre de contacto], 
City as [Ciudad], Country as [Pais] from Northwind.dbo.Customers

----------------------
create view DimEmpleado
as
select EmployeeID, 
FirstName as [Nombre], 
LastName as [Apellido],
BirthDate as [Fecha de nacimiento], 
Region, 
Country as [Pais], 
City as [Ciudad]
from Northwind.dbo.Employees

create view DimFecha
as
select distinct
OrderDate as DateID,
YEAR(OrderDate) as Año,
MONTH(OrderDate) as Mes,
Day(OrderDate) as Dia,
DATEPART(QQ, OrderDate) as Trimestre,
DATENAME(MONTH, OrderDate) as [Nombre mes],
DATENAME(WEEKDAY, OrderDate) as [Nombre dia]
from Northwind.dbo.Orders

--Tabla de hechos
create view FactOrders
as
select
o.CustomerID,
o.OrderDate as DateID,
o.EmployeeID,
o.ShipVia,
count(distinct o.OrderID) as [Cantidad de ordenes],
round(sum(od.Quantity*od.UnitPrice),2) as MontoVenta,
round(sum(od.Quantity*od.UnitPrice*od.Discount),2) as Descuento,
round(sum(od.Quantity*od.UnitPrice*(1-od.Discount)),2) as SubTotal,
o.Freight as [Cargo por envio],
round(sum(od.Quantity*od.UnitPrice*(1-od.Discount)),2) + o.Freight as [Total (SubTotal + Envio)]
from Northwind.dbo.Orders o
inner join Northwind.dbo.[Order Details] od on od.OrderID = o.OrderID
group by o.Freight, o.CustomerID, o.EmployeeID, o.OrderDate, o.ShipVia

select * from FactOrders