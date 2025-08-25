use master;
go
create database CatalogoWebDB_p1 ON(
	NAME = 'CatalogoWebDB_p1',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CatalogoWebDB_p1.mdf',
	SIZE = 10MB,
	MAXSIZE = 500MB,
	FILEGROWTH = 100MB
)
LOG ON(
	NAME = 'CatalogoWebDB_p1_log',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CatalogoWebDB_p1_log.ldf',
	SIZE = 10MB,
	MAXSIZE = 500MB,
	FILEGROWTH = 100MB
);
go
use CatalogoWebDB_p1;
go
create table Marcas(
	Id int PRIMARY KEY not null,
	Descripcion varchar(250)
);
go
create table Categorias(
	Id int PRIMARY KEY not null,
	Descripcion varchar(250)
);
go
create table Articulos(
	Id int PRIMARY KEY not null,
	Codigo char(8),
	Nombre varchar(50),
	Descripcion varchar(250),
	IdMarca int not null,
	IdCategoria int not null,
	ImagenUrl varchar(250),
	Precio decimal(10,2)
	CONSTRAINT FK_Articulos_IdMarca FOREIGN KEY (IdMarca) REFERENCES Marcas(Id),
	CONSTRAINT FK_Articulos_IdCategoria FOREIGN KEY (IdCategoria) REFERENCES Categorias(Id)
);
go
create table Users(
	Id int PRIMARY KEY not null,
	Email varchar(100), 
	Pass bit,
	Nombre varchar(50),
	Apellido varchar(50),
	UrlImagenPerfil varchar(250),
	Adminis bit,
);
go
create table Favoritos(
	Id int not null,
	IdUser int not null,
	IdArticulo int not null,
	CONSTRAINT FK_Favoritos_IdUser FOREIGN KEY (IdUser) REFERENCES Users(Id),
	CONSTRAINT FK_Favoritos_IdArticulo FOREIGN KEY (IdArticulo) REFERENCES Articulos(Id)
);
