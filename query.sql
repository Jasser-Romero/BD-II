create database BDRepositorio
go
use BDRepositorio
go
create table Recaudacion(
IdRecaudacion int primary key identity(1,1),
Fecha date,
BD varchar(100),
Año int,
Mes int,
Monto float,
Descuento float,
MontoFinal float,
CantidadOrdenes int
)
go
create table Detalle_Recaudacion(
IdDetalleRecaudacion int primary key identity(1,1),
IdRecaudacion int foreign key references Recaudacion(IdRecaudacion),
IdEmpleado int,
Monto float,
Descuento float,
MontoFinal float,
CantidadOrdenes int
)
