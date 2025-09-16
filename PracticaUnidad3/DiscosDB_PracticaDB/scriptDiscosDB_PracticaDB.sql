use master;
go
create database DiscosDB_PracticaDB ON(
	NAME = 'DiscosDB_PracticaDB',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DiscosDB_PracticaDB.mdf',
	SIZE = 10MB,
	MAXSIZE = 500MB,
	FILEGROWTH = 100MB
)
LOG ON(
	NAME = 'DiscosDB_PracticaDB_log',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DiscosDB_PracticaDB_log.ldf',
	SIZE = 10MB,
	MAXSIZE = 500MB,
	FILEGROWTH = 100MB
);
go
use DiscosDB_PracticaDB;
go
create table TiposEdicion(
	Id int PRIMARY KEY not null,
	Descripcion varchar (250)
);
go
create table Estilos(
	Id int PRIMARY KEY not null,
	Descripcion varchar (250)
);
go
create table Discos(
	Id int PRIMARY KEY not null,
	Titulo varchar (50),
	FechaLanzamiento date,
	CantidadCanciones int,
	IdEstilo int not null,
	IdTipoEdicion int not null,
	CONSTRAINT FK_Discos_IdEstilo FOREIGN KEY (IdEstilo) REFERENCES Estilos(Id),
	CONSTRAINT FK_Discos_IdTipoEdicion FOREIGN KEY (IdTipoEdicion) REFERENCES TiposEdicion(Id)
);