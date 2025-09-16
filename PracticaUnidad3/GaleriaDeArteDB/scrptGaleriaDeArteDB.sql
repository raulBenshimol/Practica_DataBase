use master;
go
create database GaleriaDeArteDB ON(
	NAME = 'GaleriaDeArteDB',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GaleriaDeArteDB.mdf',
	SIZE = 10MB,
	MAXSIZE = 500MB,
	FILEGROWTH = 100MB
)
LOG ON(
	NAME = 'GaleriaDeArteDB_log',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GaleriaDeArteDB_log.ldf',
	SIZE =10MB,
	MAXSIZE = 500MB,
	FILEGROWTH = 100MB
);
go
use GaleriaDeArteDB;
go
create table Artistas(
	Id int PRIMARY KEY not null,
	Nombre varchar (50),
	Pais varchar (50)
);
go
create table Obras(
	Id int PRIMARY KEY not null,
	Titulo varchar (50),
	Estilo varchar (50),
	IdArtista int not null,
	CONSTRAINT FK_Obras_IdArtista FOREIGN KEY (IdArtista) REFERENCES Artistas (Id)
);
go
create table Exposiciones(
	Id int PRIMARY KEY not null,
	Nombre varchar (50),
	FechaInicio date,
	FechaFin date
);
go
create table ObrasExposiciones(
	IdObra int not null,
	IdExposicion int not null,
	CONSTRAINT FK_ObrasExposicion_IdObra FOREIGN KEY (IdObra) REFERENCES Obras(Id),
	CONSTRAINT FK_ObrasExposicion_IdExposicion FOREIGN KEY (IdExposicion) REFERENCES Exposiciones(Id)

);
