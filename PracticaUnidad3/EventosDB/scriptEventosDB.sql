use master;
go
create database EventosDB ON(
	NAME = 'EventosDB',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EventosDB.mdf',
	SIZE = 10MB,
	MAXSIZE = 500MB,
	FILEGROWTH = 100MB
)
LOG ON(
	NAME = 'EventosDB_log',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EventosDB_log.ldf',
	SIZE = 10MB,
	MAXSIZE = 500MB,
	FILEGROWTH = 100MB
);
go
use EventosDB;
go
create table Eventos(
	Id int PRIMARY KEY not null,
	NombreEvento varchar (250),
	FechaInicio datetime,
	FechaFin datetime,
	Lugar varchar (100)
);
go
create table Asistentes(
	Id int PRIMARY KEY not null,
	Nombre varchar (100),
	Email varchar (100),
	Telefono varchar (25)
);
go
create table [Eventos.Asistentes](
	IdEvento int not null,
	IdAsistente int not null,
	CONSTRAINT FK_EventosAsistentes_IdEvento FOREIGN KEY (IdEvento) REFERENCES Eventos(Id),
	CONSTRAINT FK_EventosAsistentes_IdAsistente FOREIGN KEY (IdAsistente) REFERENCES Asistentes(Id)
);