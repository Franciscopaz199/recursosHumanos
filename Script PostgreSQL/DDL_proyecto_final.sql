
CREATE SCHEMA empleado;
CREATE SCHEMA usuario;
CREATE SCHEMA proyecto;
CREATE SCHEMA permiso;
CREATE SCHEMA proceso;


-- Catalogo de empleado

CREATE TABLE empleado.beneficio
(
    id_beneficio SERIAL PRIMARY KEY,
    descripcion_beneficio VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE empleado.tipo_contrato
(
    id_tipo_contrato SERIAL PRIMARY KEY,
    descripcion_tipo_contrato VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE empleado.puesto
(
    id_puesto SERIAL PRIMARY KEY,
    descripcion_puesto VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE empleado.grado_academico
(
    id_grado_academico SERIAL PRIMARY KEY,
    descripcion_grado_academico VARCHAR(30) UNIQUE NOT NULL,
    especialidad VARCHAR(35) UNIQUE NOT NULL
);

CREATE TABLE empleado.instiucion
(
    id_institucion SERIAL PRIMARY KEY,
    nombre_institucion VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE empleado.nacionalidad
(
    id_nacionalidad SERIAL PRIMARY KEY,
    nombre_nacionalidad VARCHAR(25) UNIQUE NOT NULL,
    pais VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE empleado.genero
(
    id_genero SERIAL PRIMARY KEY,
    nombre_genero VARCHAR(8) UNIQUE NOT NULL
);


CREATE TABLE empleado.estado_civil
(
    id_estado_civil SERIAL PRIMARY KEY,
    descripcion_estado_civil VARCHAR(10) UNIQUE NOT NULL
);
  
-- Catalogo de usuario

CREATE TABLE usuario.usuario
(
    id_usuario SERIAL PRIMARY KEY,
    nombre_usuario VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(30) NOT NULL
);


CREATE TABLE usuario.rol
(
    id_rol SERIAL PRIMARY KEY,
    nombre_rol VARCHAR(30) UNIQUE NOT NULL
);


CREATE TABLE usuario.permiso
(
    id_permiso SERIAL PRIMARY KEY,
    nombre_permiso VARCHAR(70) UNIQUE NOT NULL
);

-- Asociaciones

CREATE TABLE usuario.rol_permiso
(
    id_rol INT NOT NULL,
    id_permiso INT NOT NULL,
    CONSTRAINT fk_rol_permiso_rol FOREIGN KEY (id_rol) 
        REFERENCES usuario.rol (id_rol),
    CONSTRAINT fk_rol_permiso_permiso FOREIGN KEY (id_permiso)
        REFERENCES usuario.permiso (id_permiso),
    CONSTRAINT pk_rol_permiso PRIMARY KEY (id_rol, id_permiso)
);

CREATE TABLE usuario.usuario_rol
(
    id_usuario INT NOT NULL,
    id_rol INT NOT NULL,
    CONSTRAINT fk_usuario_rol_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuario.usuario (id_usuario),
    CONSTRAINT fk_usuario_rol_rol FOREIGN KEY (id_rol)
        REFERENCES usuario.rol (id_rol),
    CONSTRAINT pk_usuario_rol PRIMARY KEY (id_usuario, id_rol)
);

