create database fixosa;
use fixosa;

CREATE TABLE direccion (
    idDireccion INT(11) PRIMARY KEY,
    Direccion VARCHAR(45),
    Ciudad VARCHAR(45),
    Pais VARCHAR(45)
);

CREATE TABLE cliente (
    idCliente INT(11) PRIMARY KEY,
    Nombre VARCHAR(45),
    Apellido VARCHAR(45),
    Edad INT(11),
    Direccion_idDireccion INT(11),
    FOREIGN KEY (Direccion_idDireccion) REFERENCES direccion(idDireccion)
);

CREATE TABLE categoria (
    idCategoria INT(11) PRIMARY KEY,
    Nombre VARCHAR(45)
);

CREATE TABLE peliculas (
    idPeliculas INT(11) PRIMARY KEY,
    Nombre VARCHAR(45),
    Descripcion TEXT,
    Año INT(11),
    Categoria_idCategoria INT(11),
    FOREIGN KEY (Categoria_idCategoria) REFERENCES categoria(idCategoria)
);

CREATE TABLE inventario (
    idInventario INT(11) PRIMARY KEY,
    peliculas_idPeliculas INT(11),
    Disponible TINYINT(1),
    FOREIGN KEY (peliculas_idPeliculas) REFERENCES peliculas(idPeliculas)
);

CREATE TABLE renta (
    idRenta INT(11) PRIMARY KEY,
    Fecha_Renta DATE,
    Fecha_Entrega DATE,
    Inventario_idInventario INT(11),
    Cliente_idCliente INT(11),
    FOREIGN KEY (Inventario_idInventario) REFERENCES inventario(idInventario),
    FOREIGN KEY (Cliente_idCliente) REFERENCES cliente(idCliente)
);


INSERT INTO direccion (idDireccion, Direccion, Ciudad, Pais) VALUES 
(1, 'Calle 123', 'Ciudad1', 'Pais1'),
(2, 'Avenida 456', 'Ciudad2', 'Pais2'),
(3, 'Boulevard 789', 'Ciudad3', 'Pais3'),
(4, 'Ruta 101', 'Ciudad4', 'Pais4'),
(5, 'Paseo 202', 'Ciudad5', 'Pais5');

INSERT INTO cliente (idCliente, Nombre, Apellido, Edad, Direccion_idDireccion) VALUES 
(1, 'Juliana', 'Perez', 25, 1),
(2, 'Carlos', 'Ramirez', 30, 2),
(3, 'Julian', 'Torres', 28, 3),
(4, 'Maria', 'Lopez', 35, 4),
(5, 'Andres', 'Gomez', 22, 5);

INSERT INTO categoria (idCategoria, Nombre) VALUES 
(1, 'Acción'),
(2, 'Comedia'),
(3, 'Drama'),
(4, 'Terror'),
(5, 'Animación');

INSERT INTO peliculas (idPeliculas, Nombre, Descripcion, Año, Categoria_idcategoria) VALUES 
(1, 'POKEMON1', 'Película de pokémon', 2000, 5),
(2, 'Matrix', 'Película de acción', 1999, 1),
(3, 'Toy Story', 'Película animada', 1995, 5),
(4, 'IT', 'Película de terror', 2017, 4),
(5, 'Forrest Gump', 'Película dramática', 1994, 3);

INSERT INTO inventario (idInventario, Peliculas_idPeliculas, disponible) VALUES 
(1, 1, 1),
(2, 2, 1),
(3, 3, 0),
(4, 4, 1),
(5, 5, 0);

SELECT * FROM cliente WHERE Nombre = 'Juliana';

DELETE FROM peliculas WHERE idPeliculas = 1;


DELETE FROM inventario WHERE peliculas_idPeliculas = 1;
DELETE FROM peliculas WHERE idPeliculas = 1;

SELECT * FROM categoria ORDER BY Nombre ASC;

SELECT * FROM peliculas ORDER BY Año DESC;

SELECT peliculas.Nombre, inventario.Disponible
FROM peliculas
INNER JOIN inventario ON peliculas.idPeliculas = inventario.peliculas_idPeliculas;
