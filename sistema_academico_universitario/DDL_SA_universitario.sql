CREATE TABLE estudiante (
	id_estudiante 		INT PRIMARY KEY,
	primer_nombre 		VARCHAR(30) NOT NULL,
	segundo_nombre 		VARCHAR(30),
	primer_apellido 	VARCHAR(30) NOT NULL,
	segundo_apellido 	VARCHAR(30),
	email 				VARCHAR(70) UNIQUE NOT NULL,
	fecha_ingreso 		DATETIME	NOT NULL,
	estado 				ENUM("ACTIVO","INACTIVO","GRADUADO") NOT NULL
);

CREATE TABLE profesor (
	id_profesor 		INT PRIMARY KEY,
	primer_nombre 		VARCHAR(30) NOT NULL,
	segundo_nombre 		VARCHAR(30),
	primer_apellido 	VARCHAR(30) NOT NULL,
	segundo_apellido 	VARCHAR(30),
	email 				VARCHAR(70) UNIQUE NOT NULL,
	salario 			DECIMAL(10,2) NOT NULL,
	
	CONSTRAINT CHK_salario CHECK(salario > 0)
	
);


CREATE TABLE curso (
	id_curso 	INT 		PRIMARY KEY,
	nombre 		VARCHAR(30) NOT NULL,
	creditos 	INT 		NOT NULL,
	id_profesor INT 		NOT NULL,
	
	CONSTRAINT CHK_curso CHECK (creditos BETWEEN 1 AND 6),
	FOREIGN KEY (id_profesor) 
	REFERENCES profesor(id_profesor) 
	ON DELETE RESTRICT
);



CREATE TABLE matricula (
	id_estudiante 		INT 			NOT NULL,
	id_curso 			INT 			NOT NULL,
	fecha_matricula 	DATETIME 		NOT NULL,
	nota_final	 		DECIMAL(3,2),
	
	CONSTRAINT PK_matricula PRIMARY KEY (id_estudiante,id_curso),
	FOREIGN KEY (id_estudiante) 
	REFERENCES estudiante(id_estudiante) 
	ON DELETE CASCADE,
	FOREIGN KEY (id_curso) 
	REFERENCES curso(id_curso) 
	ON DELETE CASCADE,
	CONSTRAINT CHK_matricula CHECK(nota_final BETWEEN 0 AND 5)

);