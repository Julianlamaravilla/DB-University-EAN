USE SAB_extendido;


CREATE TABLE pais (
	id_pais 	INT 		PRIMARY KEY,
	nombre_pais VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE libro (
	id_libro 		INT 		PRIMARY KEY,
	titulo 			VARCHAR(60) NOT NULL,
	isbn 			VARCHAR(20) NOT NULL UNIQUE
);


CREATE TABLE autor (
	id_autor 			INT 		PRIMARY KEY,
	primer_nombre 		VARCHAR(20) NOT NULL,
	segundo_nombre 		VARCHAR(20),
	primer_apellido 	VARCHAR(20) NOT NULL,
	segundo_apellido 	VARCHAR(20) NOT NULL,
	id_pais 			INT 		NOT NULL,
	
	FOREIGN KEY (id_pais)
	REFERENCES pais(id_pais)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT
);


CREATE TABLE libro_autor (
	id_autor INT NOT NULL,
	id_libro INT NOT NULL,
	
	PRIMARY KEY (id_autor,id_libro),
	FOREIGN KEY (id_autor)
	REFERENCES autor(id_autor)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY (id_libro)
	REFERENCES libro(id_libro)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);


CREATE TABLE usuario (
	id_usuario 			INT 		PRIMARY KEY,
	primer_nombre 		VARCHAR(20) NOT NULL,
	segundo_nombre 		VARCHAR(20),
	primer_apellido 	VARCHAR(20) NOT NULL,
	segundo_apellido 	VARCHAR(20),
	email 				VARCHAR(80) NOT NULL UNIQUE
);


CREATE TABLE prestamo (
	id_usuario 			INT 		NOT NULL,
	id_libro 			INT 		NOT NULL,
	fecha_prestamo 		DATETIME 	NOT NULL,
	fecha_devolucion 	DATETIME,
	
	PRIMARY  KEY (id_usuario,id_libro,fecha_prestamo),
	FOREIGN KEY (id_usuario)
	REFERENCES usuario(id_usuario)
	ON DELETE RESTRICT,
	FOREIGN KEY (id_libro)
	REFERENCES libro(id_libro)
	ON DELETE RESTRICT
	
);