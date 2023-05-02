-- Conformacion del esquema Estrella orientado al producto

use Adventure

create view DimProducto
as
select
  p.ProductID,
  p.Name,
  p.Size as Talla,
  p.Color,
  p.ListPrice
from Production.Product p

-------------------------------------

create view DimCategoria
as
select
  sc.ProductSubcategoryID,
  sc.Name as [Nombre subcategoria],
  c.Name as [Nombre Categoria]
from Production.ProductSubcategory sc
inner join Production.ProductCategory c on sc.ProductCategoryID = c.ProductCategoryID

-----------------------------------------

create view DimFecha
as
select distinct
  so.OrderDate as IDFecha,
  YEAR(so.OrderDate) as Año,
  MONTH(so.OrderDate) as Mes,
  DAY(so.OrderDate) as Dia,
  DATEPART(QQ, so.OrderDate) as Trimestre,
  DATEPART(WW, so.OrderDate) as Semana,
  DATEPART(DY, so.OrderDate) as [Dia del año],
  DATENAME(MONTH, so.OrderDate) as [Nombre Mdes],
  DATENAME(WEEKDAY, so.OrderDate) as [Nombre Dia]
from Sales.SalesOrderHeader so

----------------------------------------------

create view FactOrder
as
select
  sod.ProductID as ProductID,
  soh.OrderDate as IDFecha,
  --count(sod.SalesOrderID) as Cantidad,
  sod.OrderQty as CantidadProducto,
  sod.UnitPrice as Precio,
  (sod.OrderQty * sod.UnitPrice) as SubTotal,
  (sod.UnitPriceDiscount * sod.UnitPrice) as Descuento,
  (sod.OrderQty * (sod.UnitPrice * (1-sod.UnitPriceDiscount))) as Total
from Sales.SalesOrderDetail sod
inner join Sales.SalesOrderHeader soh on soh.SalesOrderID = sod.SalesOrderID
--group by sod.OrderQty, sod.UnitPrice, sod.UnitPriceDiscount, soh.OrderDate, sod.ProductID

select * from Production.ProductCategory
select * from Production.ProductSubcategory

select
  sod.ProductID as ProductID,
  sum(sod.OrderQty) as Cantidad,
  round(sum((sod.OrderQty * sod.UnitPrice)),2) as SubTotal,
  round(sum((sod.UnitPriceDiscount * sod.UnitPrice)),2) as Descuento,
  round(sum((sod.OrderQty * (sod.UnitPrice * (1-sod.UnitPriceDiscount)))),2) as Total
from Sales.SalesOrderDetail sod
inner join Sales.SalesOrderHeader soh on soh.SalesOrderID = sod.SalesOrderID
where ProductID = 945
group by sod.ProductID

select
  *
from Sales.SalesOrderDetail sod
inner join Sales.SalesOrderHeader soh on soh.SalesOrderID = sod.SalesOrderID
where ProductID = 945
