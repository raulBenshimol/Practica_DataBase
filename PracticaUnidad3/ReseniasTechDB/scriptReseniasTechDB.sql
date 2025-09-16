use master;
go
create database ReseniasTechDB ON(
	NAME = 'ReseniasTechDB',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ReseniasTechDB.mdf',
	SIZE = 10MB,
	MAXSIZE = 500MB,
	FILEGROWTH = 100MB
)
LOG ON(
	NAME = 'ReseniasTechDB_log',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ReseniasTechDB_log.ldf',
	SIZE = 10MB,
	MAXSIZE = 500MB,
	FILEGROWTH = 100MB
);
go
use ReseniasTechDB;
go
create table Usuarios(
	Id int PRIMARY KEY not null,
	Nombre varchar (250),
	Email varchar (250),
	Pais varchar (50)
);
go
create table Articulos(
	Id int PRIMARY KEY not null,
	Nombre varchar (50),
	Descripcion varchar (500),
	Categoria varchar (50),
	Precio decimal (10,2)
);
go
create table Resenias(
	Id int PRIMARY KEY not null,
	IdArticulo int not null,
	IdUsuario int not null,
	Puntuacion decimal (2,1),
	Comentario varchar (500),
	Fecha date,
	CONSTRAINT FK_Resenias_IdArticulo FOREIGN KEY (IdArticulo) REFERENCES Articulos (Id),
	CONSTRAINT FK_Resenias_IdUsuario FOREIGN KEY (IdUsuario) REFERENCES Usuarios (Id)
);

