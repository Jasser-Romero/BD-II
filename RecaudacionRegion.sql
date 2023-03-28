use Northwind
go
select e.EmployeeID, e.FirstName, et.TerritoryID, t.TerritoryDescription,
		r.RegionDescription
from EmployeeTerritories et
inner join Employees e on e.EmployeeID = et.EmployeeID
inner join Territories t on t.TerritoryID = et.TerritoryID
inner join Region r on t.RegionID = r.RegionID
group by r.RegionDescription

--select * from Territories

select RegionDescription, sum(Recaudacion) as Recaudacion from
(select 
		distinct e.EmployeeID,
		r.RegionDescription
from EmployeeTerritories et
inner join Employees e on e.EmployeeID = et.EmployeeID
inner join Territories t on t.TerritoryID = et.TerritoryID
inner join Region r on t.RegionID = r.RegionID) A

inner join

(select 
	o.EmployeeID,
	round(sum((od.UnitPrice*od.Quantity)*(1-od.Discount)),2) Recaudacion 
from [Order Details] od
inner join Orders o on o.OrderID = od.OrderID
inner join Employees e on e.EmployeeID = o.EmployeeID
group by o.EmployeeID) B

on A.EmployeeID = B.EmployeeID
group by RegionDescription
