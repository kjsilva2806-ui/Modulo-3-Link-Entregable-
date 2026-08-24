---- Modulo 3 entregable -----

CREATE DATABASE VentasTecnología;
USE VentasTecnología 

----- Creando las tablas de las categorías 

CREATE TABLE Categorías (
CategoríaID INT IDENTITY (1,1) PRIMARY KEY,
NombreCategoría VARCHAR (50) NOT NULL
); 

----- Creando la tabla de Productos ----

CREATE TABLE Productos (
ProductoID INT IDENTITY(1,1) PRIMARY KEY,
NombreProducto VARCHAR(100) NOT NULL,
Precio DECIMAL (10,2) NOT NULL,
CategoríaID INT NOT NULL,
CONSTRAINT FK_Producto_Categoría FOREIGN KEY (CategoríaID)
REFERENCES Categorías(CategoríaID)
);

----- Creamos tabla de Cllientes -----

CREATE TABLE Clientes (
ClienteID INT IDENTITY(1,1) PRIMARY KEY, 
NombreCliente VARCHAR(100) NOT NULL,
Email VARCHAR(50) NULL, 
Ciudad VARCHAR(50) NULL
);

------ Creamos tabla de Ventas -----

CREATE TABLE Ventas (
VentaID INT IDENTITY(1,1) PRIMARY KEY,
Fecha DATE NOT NULL,
ClienteID INT NOT NULL,
ProductoID INT NOT NULL, 
CANTIDAD INT NOT NULL,
CONSTRAINT FK_Ventas_Clientes FOREIGN KEY(ClienteID)
REFERENCES Clientes(ClienteID),
CONSTRAINT FK_Ventas_Productos FOREIGN KEY (ProductoID)
REFERENCES Productos(ProductoID)
);

SELECT *FROM Ventas

------- Insertamos los primeros datos ------
INSERT INTO Categorías (NombreCategoría) VALUES
('Electronica'),
('Computación'),
('Accesorios');

SELECT *FROM Categorías 

--------- Insertamos productos ------

INSERT INTO Productos(NombreProducto,Precio,CategoríaID) VALUES
('Smart TV 50"',899.99,1),
('Auriculares Bluetooth',45.50,1),
('Notebook 15"',1250.00,2),
('Mouse Inalámbrico',19.99,3),
('Teclado Mecánico',79.90,3);

SELECT *FROM Productos; 

----- Insertamos Clientes a la tabla-----

INSERT INTO Clientes (NombreCliente, Email, Ciudad) VALUES
('Ana Pérez',       'ana.perez@mail.com',       'Montevideo'),
('Carlos Gómez',    'carlos.gomez@mail.com',    'Salto'),
('Lucía Fernández', 'lucia.fernandez@mail.com', 'Paysandú');

SELECT * FROM Clientes;

-------- Insertamos Ventas ------

INSERT INTO Ventas (Fecha, ClienteID, ProductoID, Cantidad) VALUES
('2026-01-05', 1, 1, 1),
('2026-01-07', 2, 3, 1),
('2026-01-10', 3, 4, 2),
('2026-01-15', 1, 5, 1),
('2026-01-20', 2, 2, 3),
('2026-02-01', 3, 1, 1),
('2026-02-05', 1, 4, 1),
('2026-02-10', 2, 5, 2),
('2026-02-14', 3, 3, 1),
('2026-02-18', 1, 2, 1);

SELECT * FROM Ventas;