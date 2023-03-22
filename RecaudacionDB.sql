
create database BDRepositorio
go
use BDRepositorio
go
create table Recaudaciones(
IdRecaudacion int primary key identity(1,1),
Fecha date
Año int,
Mes int,
Monto float,
Descuento float,
MontoFinal float,
CantidadOrdenes int
)
go
create table Detalle_Recaudaciones(
IdRecaudacion int foreign key references Recaudaciones(IdRecaudacion),
IdEmpleado int not null,
Monto float,
Descuento float,
MontoFinal float,
CantidadOrdenes int
)

select * from Orders
where cast(OrderDate as date) = cast(GETDATE() as date)

update Orders set OrderDate = GETDATE()
where YEAR(OrderDate) = 2018 and MONTH(OrderDate) = 5

use Northwind
go
select
	CAST(GETDATE() as date) as Fecha,
	--datepart(year, o.orderdate) as Año
	year(o.OrderDate) as Año,
	month(o.OrderDate) as Mes,
	round(sum((od.Quantity*od.UnitPrice)), 2) as [Monto],
	round(sum((od.Quantity*od.UnitPrice)*od.Discount), 2) as [Descuento],
	round(sum((od.Quantity*od.UnitPrice)*(1-od.Discount)), 2) as [MontoFinal] 
from Orders as o
inner join [Order Details] as od on od.OrderID = o.OrderID
where year(o.OrderDate) = year(GETDATE())
and MONTH(o.OrderDate) = month(GETDATE())
group by o.OrderDate

--Se puede hacer con subconsultas

