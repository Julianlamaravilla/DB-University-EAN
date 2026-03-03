CREATE TABLE cliente (
	id_cliente 			INT 		PRIMARY KEY,
	primer_nombre		VARCHAR(20) NOT NULL,
	segundo_nombre		VARCHAR(20),
	primer_apellido		VARCHAR(20) NOT NULL,
	segundo_apellido	VARCHAR(20),
	email				VARCHAR(80)	NOT NULL UNIQUE
	
);

CREATE TABLE producto (
	id_producto		INT			PRIMARY KEY,
	nombre_producto	VARCHAR(40) NOT NULL,
	precio 			DECIMAL(10,2)		NOT NULL,
	stock 			INT 		NOT NULL,
	
	CONSTRAINT CHK_producto CHECK(precio >= 0 AND stock >=0)
	
);


CREATE TABLE pedido (
	id_pedido 		INT 		PRIMARY KEY,
	fecha 			DATETIME	NOT NULL,
	id_cliente 		INT 		NOT NULL,
	
	FOREIGN KEY(id_cliente) REFERENCES cliente (id_cliente) ON DELETE CASCADE
	
);

CREATE TABLE detalle_pedido (
	id_producto 		INT 	NOT NULL,
	id_pedido 			INT 	NOT NULL,
	cantidad 			INT 	NOT NULL,
	precio_unitario 	DECIMAL(10,2) 	NOT NULL,
	
	CONSTRAINT CHK_detalle_pedido CHECK (cantidad > 0 AND precio_unitario>=0),
	CONSTRAINT NM_detalle_pedido PRIMARY KEY (id_pedido,id_producto),
	FOREIGN KEY(id_producto) REFERENCES producto(id_producto) ON DELETE RESTRICT,
	FOREIGN KEY(id_pedido) REFERENCES pedido(id_pedido) ON DELETE CASCADE

);