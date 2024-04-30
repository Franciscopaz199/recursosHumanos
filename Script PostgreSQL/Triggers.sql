-- SCRIPT DE REFERENCIA DE LA BASE DE DATOS PARA CREAR Audilog Y TRIGGERS EN POSTGRESQL
-- CREATE SCHEMA empleado;
-- CREATE SCHEMA usuario;
-- CREATE SCHEMA proyecto;
-- CREATE SCHEMA permiso;
-- CREATE SCHEMA proceso;


-- -- Catalogo de empleado

-- CREATE TABLE empleado.beneficio
-- (
--     id_beneficio SERIAL PRIMARY KEY,
--     descripcion_beneficio VARCHAR(100) UNIQUE NOT NULL
-- );

-- CREATE TABLE empleado.tipo_contrato
-- (
--     id_tipo_contrato SERIAL PRIMARY KEY,
--     descripcion_tipo_contrato VARCHAR(100) UNIQUE NOT NULL
-- );

-- CREATE TABLE empleado.puesto
-- (
--     id_puesto SERIAL PRIMARY KEY,
--     descripcion_puesto VARCHAR(100) UNIQUE NOT NULL
-- );

-- CREATE TABLE empleado.grado_academico
-- (
--     id_grado_academico SERIAL PRIMARY KEY,
--     descripcion_grado_academico VARCHAR(30) UNIQUE NOT NULL,
--     especialidad VARCHAR(35) UNIQUE NOT NULL
-- );

-- CREATE TABLE empleado.institucion
-- (
--     id_institucion SERIAL PRIMARY KEY,
--     nombre_institucion VARCHAR(100) UNIQUE NOT NULL
-- );

-- CREATE TABLE empleado.nacionalidad
-- (
--     id_nacionalidad SERIAL PRIMARY KEY,
--     nombre_nacionalidad VARCHAR(25) UNIQUE NOT NULL,
--     pais VARCHAR(100) UNIQUE NOT NULL
-- );

-- CREATE TABLE empleado.genero
-- (
--     id_genero SERIAL PRIMARY KEY,
--     nombre_genero VARCHAR(10) UNIQUE NOT NULL
-- );


-- CREATE TABLE empleado.estado_civil
-- (
--     id_estado_civil SERIAL PRIMARY KEY,
--     descripcion_estado_civil VARCHAR(20) UNIQUE NOT NULL
-- );
  
-- -- Catalogo de usuario

-- CREATE TABLE usuario.usuario
-- (
--     id_usuario SERIAL PRIMARY KEY,
--     nombre_usuario VARCHAR(15) UNIQUE NOT NULL,
--     email VARCHAR(50) UNIQUE NOT NULL,
--     password VARCHAR(30) NOT NULL
-- );


-- CREATE TABLE usuario.rol
-- (
--     id_rol SERIAL PRIMARY KEY,
--     nombre_rol VARCHAR(30) UNIQUE NOT NULL
-- );


-- CREATE TABLE usuario.permiso_usuario
-- (
--     id_permiso_usuario SERIAL PRIMARY KEY,
--     nombre_permiso VARCHAR(70) UNIQUE NOT NULL
-- );

-- -- Asociaciones

-- CREATE TABLE usuario.rol_permiso_usuario
-- (
--     id_rol INT NOT NULL,
--     id_permiso_usuario INT NOT NULL,
--     CONSTRAINT fk_rol_permiso_rol FOREIGN KEY (id_rol) 
--         REFERENCES usuario.rol (id_rol),
--     CONSTRAINT fk_rol_permiso_permiso FOREIGN KEY (id_permiso_usuario)
--         REFERENCES usuario.permiso_usuario (id_permiso_usuario),
--     CONSTRAINT pk_rol_permiso PRIMARY KEY (id_rol, id_permiso_usuario)
-- );

-- CREATE TABLE usuario.usuario_rol
-- (
--     id_usuario INT NOT NULL,
--     id_rol INT NOT NULL,
--     CONSTRAINT fk_usuario_rol_usuario FOREIGN KEY (id_usuario)
--         REFERENCES usuario.usuario (id_usuario),
--     CONSTRAINT fk_usuario_rol_rol FOREIGN KEY (id_rol)
--         REFERENCES usuario.rol (id_rol),
--     CONSTRAINT pk_usuario_rol PRIMARY KEY (id_usuario, id_rol)
-- );

-- -- empleado

-- CREATE TABLE empleado.empleado
-- (
-- 	codigo_empleado INT PRIMARY KEY,
-- 	id_nacionalidad INT NOT NULL,
-- 	id_genero INT NOT NULL,
-- 	id_estado_civil INT NOT NULL,
-- 	id_usuario INT NOT NULL,
-- 	dni VARCHAR(15) NOT NULL UNIQUE,
-- 	nombres VARCHAR(60) NOT NULL,
-- 	apellidos VARCHAR(60) NOT NULL,
-- 	fecha_nacimiento DATE,
-- 	correo VARCHAR(50) NOT NULL UNIQUE,
-- 	estado_empleado BOOLEAN NOT NULL DEFAULT TRUE,
	
-- 	CONSTRAINT Fk_Empleado_Nacionalidad FOREIGN KEY (id_nacionalidad) 
-- 		REFERENCES empleado.nacionalidad(id_nacionalidad),
-- 	CONSTRAINT Fk_Empleado_genero FOREIGN KEY (id_genero) 
-- 		REFERENCES empleado.genero(id_genero),
-- 	CONSTRAINT Fk_Empleado_EstadoCivil FOREIGN KEY (id_estado_civil) 
-- 		REFERENCES empleado.estado_civil(id_estado_civil),
-- 	CONSTRAINT Fk_Empleado_Usuario FOREIGN KEY (id_usuario) 
-- 		REFERENCES usuario.usuario(id_usuario)
-- );

-- CREATE TABLE empleado.operador_telefonico
-- (
--     id_operador_telefonico SERIAL PRIMARY KEY,
--     nombre_operador VARCHAR(30) NOT NULL UNIQUE
-- );

-- CREATE TABLE empleado.telefono
-- (
--     id_telefono SERIAL PRIMARY KEY,
--     codigo_empleado INT NOT NULL,
--     telefono VARCHAR(9) NOT NULL UNIQUE,
--     id_operador_telefonico INT NOT NULL,
--     CONSTRAINT Fk_Telefono_Empleado FOREIGN KEY (codigo_empleado) 
--         REFERENCES empleado.empleado(codigo_empleado),
--     CONSTRAINT Fk_Telefono_OperadorTelefonico FOREIGN KEY (id_operador_telefonico)
--         REFERENCES empleado.operador_telefonico(id_operador_telefonico)
-- );

-- CREATE TABLE empleado.empleado_grado_academico
-- (
-- 	codigo_empleado INT NOT NULL,
-- 	id_grado_academico INT NOT NULL,
-- 	id_institucion INT NOT NULL,
-- 	anio_obtencion DATE NOT NULL,
	
-- 	PRIMARY KEY (codigo_empleado, id_grado_academico, id_institucion),
-- 	CONSTRAINT Fk_PersonaGradoAcademico_Empleado FOREIGN KEY (codigo_empleado) 
-- 		REFERENCES empleado.empleado(codigo_empleado),
-- 	CONSTRAINT Fk_PersonaGradoAcademico_GradoAcademico FOREIGN KEY (id_grado_academico) 
-- 		REFERENCES empleado.grado_academico(id_grado_academico),
-- 	CONSTRAINT Fk_PersonaGradoAcademico_Institucion FOREIGN KEY (id_institucion) 
-- 		REFERENCES empleado.institucion(id_institucion)
-- );

-- CREATE TABLE empleado.departamento
-- (
-- 	id_departamento SERIAL PRIMARY KEY,
-- 	nombre_departamento VARCHAR(30) NOT NULL UNIQUE,
-- 	codigo_empleado_jefe INT NOT NULL,
	
-- 	CONSTRAINT Fk_Departamento_Empleado FOREIGN KEY (codigo_empleado_jefe) 
-- 		REFERENCES empleado.empleado(codigo_empleado)
-- ); 

-- -- creacion de la tabla contrato laboral

-- CREATE TABLE empleado.contrato_laboral
-- (
-- 	id_contrato_laboral SERIAL PRIMARY KEY,
-- 	codigo_empleado INT NOT NULL,
-- 	id_tipo_contrato INT NOT NULL,
-- 	id_puesto INT NOT NULL,
-- 	id_departamento INT NOT NULL,
-- 	numero_contrato VARCHAR(9) NOT NULL UNIQUE,
-- 	fecha_inicio DATE NOT NULL,
-- 	fecha_finalizacion DATE,
-- 	salario DECIMAL(9,2) NOT NULL,
-- 	hora_entrada TIME NOT NULL,
-- 	hora_salida TIME NOT NULL,
-- 	estado_contrato BOOLEAN NOT NULL,
	
-- 	CONSTRAINT Fk_ContratoLaboral_Empleado FOREIGN KEY (codigo_empleado) 
-- 		REFERENCES empleado.empleado(codigo_empleado),
-- 	CONSTRAINT Fk_ContratoLaboral_TipoContrato FOREIGN KEY (id_tipo_contrato) 
-- 		REFERENCES empleado.tipo_contrato(id_tipo_contrato),
-- 	CONSTRAINT Fk_ContratoLaboral_Puesto FOREIGN KEY (id_puesto) 
-- 		REFERENCES empleado.puesto(id_puesto),
-- 	CONSTRAINT Fk_ContratoLaboral_Departamento FOREIGN KEY (id_departamento) 
-- 		REFERENCES empleado.departamento(id_departamento),
-- 	CONSTRAINT Fk_ContratoLaboral_Beneficio FOREIGN KEY (id_beneficio) 
-- 		REFERENCES empleado.beneficio(id_beneficio)
-- );

-- CREATE TABLE empleado.contrato_laboral_beneficio
-- (
-- 	id_contrato_laboral INT,
-- 	id_beneficio INT,
	
-- 	PRIMARY KEY (id_contrato_laboral, id_beneficio),
-- 	CONSTRAINT Fk_ContratoBeneficio_ContratoLaboral FOREIGN KEY (id_contrato_laboral) 
-- 		REFERENCES empleado.contrato_laboral(id_contrato_laboral),
--     CONSTRAINT Fk_ContratoBeneficio_Beneficio FOREIGN KEY (id_beneficio)
--         REFERENCES empleado.beneficio(id_beneficio)
-- );

-- -- creacion del periodo academico
-- CREATE TABLE proyecto.numero_periodo
-- (
-- 	id_numero_periodo SERIAL PRIMARY KEY,
-- 	numero_periodo VARCHAR(15) NOT NULL UNIQUE
-- );

-- CREATE TABLE proyecto.periodo_academico(
-- 	id_periodo_academico SERIAL PRIMARY KEY,
-- 	id_numero_periodo INT NOT NULL,
-- 	anio INT NOT NULL,
	
-- 	CONSTRAINT Fk_PeriodoAcademico_NumeroPeriodo FOREIGN KEY (id_numero_periodo) 
-- 		REFERENCES proyecto.numero_periodo(id_numero_periodo)
-- );

-- -- cambio de horario
-- CREATE TABLE empleado.cambio_horario
-- (
-- 	id_cambio_horario SERIAL PRIMARY KEY,
-- 	id_contrato_laboral INT NOT NULL,
-- 	id_periodo_academico INT NOT NULL,
-- 	nueva_hora_entrada TIME NOT NULL,
-- 	nueva_hora_salida TIME NOT NULL,
-- 	nota VARCHAR(350),
-- 	fecha_cambio DATE,
	
-- 	CONSTRAINT Fk_CambioHorario_ContratoLaboral FOREIGN KEY (id_contrato_laboral) 
-- 		REFERENCES empleado.contrato_laboral(id_contrato_laboral),
-- 	CONSTRAINT Fk_CambioHorario_PeriodoAcademico FOREIGN KEY (id_periodo_academico) 
-- 		REFERENCES proyecto.periodo_academico(id_periodo_academico)
-- );

-- -- creacion del modulo proyecto
-- CREATE TABLE proyecto.dimension
-- (
-- 	id_dimension SERIAL PRIMARY KEY,
-- 	nombre_dimension VARCHAR(30) NOT NULL UNIQUE
-- );

-- CREATE TABLE proyecto.tipo_proyecto
-- (
-- 	id_tipo_proyecto SERIAL PRIMARY KEY,
-- 	nombre_tipo_proyecto VARCHAR (25) NOT NULL UNIQUE
-- );

-- CREATE TABLE proyecto.estado(
-- 	id_estado SERIAL PRIMARY KEY,
-- 	nombre_estado VARCHAR(30) NOT NULL UNIQUE
-- );

-- CREATE TABLE proyecto.proyecto
-- (
-- 	id_proyecto SERIAL PRIMARY KEY,
-- 	id_tipo_proyecto INT NOT NULL,
-- 	id_periodo_academico INT NOT NULL,
-- 	id_departamento INT NOT NULL,
-- 	id_dimension INT NOT NULL,
-- 	id_estado INT NOT NULL,
-- 	nombre_proyecto VARCHAR(60) NOT NULL,
-- 	fecha_inicio DATE,
-- 	fecha_fin DATE,
	
-- 	CONSTRAINT Fk_Proyecto_TipoProyecto FOREIGN KEY (id_tipo_proyecto) 
-- 		REFERENCES proyecto.tipo_proyecto(id_tipo_proyecto),
-- 	CONSTRAINT Fk_Proyecto_PeriodoAcademico FOREIGN KEY (id_periodo_academico) 
-- 		REFERENCES proyecto.periodo_academico(id_periodo_academico),
-- 	CONSTRAINT Fk_Proyecto_Departamento FOREIGN KEY (id_departamento) 
-- 		REFERENCES empleado.departamento(id_departamento),
-- 	CONSTRAINT Fk_Proyecto_Dimension FOREIGN KEY (id_dimension) 
-- 		REFERENCES proyecto.dimension(id_dimension),
-- 	CONSTRAINT Fk_Proyecto_Estado FOREIGN KEY (id_estado) 
-- 		REFERENCES proyecto.estado(id_estado)
-- );

-- CREATE TABLE proyecto.actividad(
-- 	id_actividad SERIAL PRIMARY KEY,
-- 	id_proyecto INT NOT NULL,
-- 	nombre_actividad VARCHAR(70) NOT NULL,
-- 	fecha_actividad DATE,
	
-- 	CONSTRAINT Fk_Actividad_Proyecto FOREIGN KEY (id_proyecto) 
-- 		REFERENCES proyecto.proyecto(id_proyecto)
-- );

-- CREATE TABLE proyecto.rol_proyecto
-- (
-- 	id_rol_proyecto SERIAL PRIMARY KEY,
-- 	nombre_rol VARCHAR(30) NOT NULL UNIQUE
-- );

-- CREATE TABLE proyecto.empleado_proyecto
-- (
-- 	id_empleado_proyecto SERIAL UNIQUE,
-- 	id_rol_proyecto INT NOT NULL,
-- 	id_proyecto INT NOT NULL,
-- 	codigo_empleado INT NOT NULL,

-- 	CONSTRAINT PK_EmpleadoProyecto PRIMARY KEY (id_empleado_proyecto),
-- 	CONSTRAINT UK_EmpleadoProyecto UNIQUE (id_rol_proyecto, id_proyecto, codigo_empleado),
-- 	CONSTRAINT Fk_EmpleadoProyecto_RolProyecto FOREIGN KEY (id_rol_proyecto) 
-- 		REFERENCES proyecto.rol_proyecto(id_rol_proyecto),
-- 	CONSTRAINT Fk_EmpleadoProyecto_Proyecto FOREIGN KEY (id_proyecto) 
-- 		REFERENCES proyecto.proyecto(id_proyecto),
-- 	CONSTRAINT Fk_EmpleadoProyecto_Empleado FOREIGN KEY (codigo_empleado) 
-- 		REFERENCES empleado.empleado(codigo_empleado)
-- );

-- CREATE TABLE proyecto.actividad_empleado_proyecto
-- (
-- 	id_actividad_empleado_proyecto SERIAL UNIQUE,
-- 	id_actividad INT NOT NULL,
-- 	id_empleado_proyecto INT NOT NULL,
-- 	id_estado INT NOT NULL,
-- 	horas_trabajadas INT NOT NULL,
-- 	dias_compensatorios INT  NOT NULL,
-- 	medio_verificacion VARCHAR(100),
	
-- 	CONSTRAINT PK_ActividadEmpleadoProyecto PRIMARY KEY (id_actividad_empleado_proyecto),
-- 	CONSTRAINT UK_ActividadEmpleadoProyecto UNIQUE (id_actividad, id_empleado_proyecto),
-- 	CONSTRAINT Fk_ActividadEmpleadoProyecto_Actividad FOREIGN KEY (id_actividad) 
-- 		REFERENCES proyecto.actividad(id_actividad),
-- 	CONSTRAINT Fk_ActividadEmpleadoProyecto_EmpleadoProyecto FOREIGN KEY (id_empleado_proyecto) 
-- 		REFERENCES proyecto.empleado_proyecto(id_empleado_proyecto),
-- 	CONSTRAINT Fk_ActividadEmpleadoProyecto_Estado FOREIGN KEY (id_estado) 
-- 		REFERENCES proyecto.estado(id_estado)
-- );

-- -- creacion del modulo proceso
-- CREATE TABLE proceso.nombre_prueba
-- (
-- 	id_nombre_prueba SERIAL PRIMARY KEY,
-- 	nombre_prueba VARCHAR (100) NOT NULL UNIQUE
-- );

-- CREATE TABLE proceso.rol_proceso
-- (
-- 	id_rol_proceso SERIAL PRIMARY KEY,
-- 	descripcion_rol VARCHAR(30) NOT NULL UNIQUE
-- );

-- CREATE TABLE proceso.descripcion
-- (
-- 	id_descripcion SERIAL PRIMARY KEY,
-- 	nombre_proceso VARCHAR(100) NOT NULL UNIQUE
-- );

-- CREATE TABLE proceso.estado_proceso
-- (
-- 	id_estado_proceso SERIAL PRIMARY KEY,
-- 	nombre_estado_proceso VARCHAR(100) NOT NULL UNIQUE
-- );

-- CREATE TABLE proceso.proceso
-- (
-- 	id_proceso SERIAL PRIMARY KEY,
-- 	id_descripcion INT NOT NULL,
-- 	id_estado_proceso INT NOT NULL,
-- 	fecha DATE,
-- 	cantidad_compensatoria INT NOT NULL,
	
-- 	CONSTRAINT Fk_Proceso_Descripcion FOREIGN KEY (id_descripcion) 
-- 		REFERENCES proceso.descripcion(id_descripcion),
-- 	CONSTRAINT Fk_Proceso_EstadoProceso FOREIGN KEY (id_estado_proceso) 
-- 		REFERENCES proceso.estado_proceso(id_estado_proceso)
-- );

-- CREATE TABLE proceso.empleado_proceso
-- (
-- 	id_empleado_proceso SERIAL UNIQUE,
-- 	codigo_empleado INT NOT NULL,
-- 	id_rol_proceso INT NOT NULL,
-- 	id_proceso INT NOT NULL,
	
-- 	CONSTRAINT PK_EmpleadoProceso PRIMARY KEY (id_empleado_proceso),
-- 	CONSTRAINT UK_EmpleadoProceso UNIQUE (codigo_empleado, id_proceso),
-- 	CONSTRAINT Fk_EmpleadoProceso_Empleado FOREIGN KEY (codigo_empleado) 
-- 		REFERENCES empleado.empleado(codigo_empleado),
-- 	CONSTRAINT Fk_EmpleadoProceso_RolProceso FOREIGN KEY (id_rol_proceso) 
-- 		REFERENCES proceso.rol_proceso(id_rol_proceso),
-- 	CONSTRAINT Fk_EmpleadoProceso_Proceso FOREIGN KEY (id_proceso) 
-- 		REFERENCES proceso.proceso(id_proceso)
-- );

-- CREATE TABLE proceso.asistencia
-- (
-- 	id_empleado_proceso INT NOT NULL,
-- 	id_nombre_prueba INT NOT NULL, 
-- 	estado BOOLEAN NOT NULL DEFAULT TRUE,
	
-- 	PRIMARY KEY (id_empleado_proceso, id_nombre_prueba),
-- 	CONSTRAINT Fk_Asistencia_NombrePrueba FOREIGN KEY (id_nombre_prueba) 
-- 		REFERENCES proceso.nombre_prueba(id_nombre_prueba),
-- 	CONSTRAINT Fk_Asistencia_EmpleadoProceso FOREIGN KEY (id_empleado_proceso) 
-- 		REFERENCES proceso.empleado_proceso(id_empleado_proceso)
-- );

-- -- creacion del modulo permiso
-- CREATE TABLE permiso.tipo_permiso
-- (
-- 	id_tipo_permiso SERIAL PRIMARY KEY,
-- 	nombre_tipo_permiso VARCHAR(30) NOT NULL UNIQUE
-- );

-- CREATE TABLE permiso.permiso
-- (
-- 	id_permiso SERIAL PRIMARY KEY,
-- 	codigo_empleado INT NOT NULL,
-- 	id_tipo_permiso INT NOT NULL,
-- 	hora_recibido TIME NOT NULL,
-- 	fecha_ingreso DATE NOT NULL, 
-- 	fecha_inicio DATE NOT NULL,
-- 	fecha_final DATE NOT NULL,
-- 	descripcion VARCHAR(200),
-- 	dias INT,
-- 	horas INT,
-- 	minutos INT,
-- 	observacion VARCHAR(200),
-- 	respaldo BOOLEAN NOT NULL DEFAULT FALSE,
-- 	recibido_por INT NOT NULL,
	
-- 	CONSTRAINT Fk_Permiso_Empleado FOREIGN KEY (codigo_empleado) 
-- 		REFERENCES empleado.empleado(codigo_empleado),
-- 	CONSTRAINT Fk_Permiso_TipoPermiso FOREIGN KEY (id_tipo_permiso) 
-- 		REFERENCES permiso.tipo_permiso(id_tipo_permiso),
-- 	CONSTRAINT Fk_Permiso_Empleados FOREIGN KEY (recibido_por) 
-- 		REFERENCES empleado.empleado(codigo_empleado)
-- );

-- CREATE TABLE permiso.permiso_compesatorio_proceso
-- (
-- 	id_permiso INT NOT NULL,
-- 	id_proceso INT NOT NULL,
	
-- 	PRIMARY KEY(id_permiso, id_proceso),
-- 	CONSTRAINT Fk_PermisoCompesatorioProceso_PermisoFinal FOREIGN KEY (id_permiso) 
-- 		REFERENCES permiso.permiso(id_permiso),
-- 	CONSTRAINT Fk_PermisoCompesatorioProceso_Proceso FOREIGN KEY (id_proceso) 
-- 		REFERENCES proceso.proceso(id_proceso)
-- );

-- CREATE TABLE permiso.permiso_compesatorio_proyecto
-- (
-- 	id_permiso INT NOT NULL,
-- 	id_actividad_empleado_proyecto INT NOT NULL,
	
-- 	PRIMARY KEY(id_permiso, id_actividad_empleado_proyecto),
-- 	CONSTRAINT Fk_PermisoCompesatorioProyecto_PermisoFinal FOREIGN KEY (id_permiso) 
-- 		REFERENCES permiso.permiso(id_permiso),
-- 	CONSTRAINT Fk_PermisoCompesatorioProyecto_ActividadEmpleadoProyecto FOREIGN KEY (id_actividad_empleado_proyecto) 
-- 		REFERENCES proyecto.actividad_empleado_proyecto(id_actividad_empleado_proyecto)

-- );

-- tabla para normalizar los tipos de cambios
CREATE TABLE tipo_cambio (
    id_tipo_cambio SERIAL PRIMARY KEY,
    nombre_tipo_cambio VARCHAR(10) UNIQUE
);
-- Insertar los tipos de cambio por defecto
INSERT INTO tipo_cambio (nombre_tipo_cambio) VALUES ('INSERT'), ('UPDATE'), ('DELETE');

------------------------------------------------------------------------------------------------------------------
-- auditoria a la tabla empleado.empleado_grado_academico
CREATE TABLE auditoria_empleado_grado_academico (
    id_registro SERIAL PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    CONSTRAINT fk_auditoria_empleado_grado_academico_tipo_cambio FOREIGN KEY (id_tipo_cambio) 
    REFERENCES tipo_cambio (id_tipo_cambio)
);

-- TRIGGER PARA AUDITORIA DE LA TABLA empleado.empleado_grado_academico
CREATE OR REPLACE FUNCTION auditoria_empleado_grado_academico()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO auditoria_empleado_grado_academico (id_tipo_cambio, valores_nuevos)
        VALUES (1, row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO auditoria_empleado_grado_academico (id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (2, row_to_json(OLD), row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO auditoria_empleado_grado_academico (id_tipo_cambio, valores_anteriores)
        VALUES (3, row_to_json(OLD));
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_auditoria_empleado_grado_academico
AFTER INSERT OR UPDATE OR DELETE ON empleado.empleado_grado_academico
FOR EACH ROW
EXECUTE FUNCTION auditoria_empleado_grado_academico();

------------------------------------------------------------------------------------------------------------------
-- auditoria a la tabla empleado.departamento
CREATE TABLE auditoria_departamento (
    id_registro SERIAL PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    CONSTRAINT fk_auditoria_departamento_tipo_cambio FOREIGN KEY (id_tipo_cambio) 
    REFERENCES tipo_cambio (id_tipo_cambio)
);

-- TRIGGER PARA AUDITORIA DE LA TABLA empleado.departamento
CREATE OR REPLACE FUNCTION auditoria_departamento()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO auditoria_departamento (id_tipo_cambio, valores_nuevos)
        VALUES (1, row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO auditoria_departamento (id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (2, row_to_json(OLD), row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO auditoria_departamento (id_tipo_cambio, valores_anteriores)
        VALUES (3, row_to_json(OLD));
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_auditoria_departamento
AFTER INSERT OR UPDATE OR DELETE ON empleado.departamento
FOR EACH ROW
EXECUTE FUNCTION auditoria_departamento();

------------------------------------------------------------------------------------------------------------------
-- auditoria a la tabla empleado.cambio_horario
CREATE TABLE auditoria_cambio_horario (
    id_registro SERIAL PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    CONSTRAINT fk_auditoria_cambio_horario_tipo_cambio FOREIGN KEY (id_tipo_cambio) 
    REFERENCES tipo_cambio (id_tipo_cambio)
);

-- TRIGGER PARA AUDITORIA DE LA TABLA empleado.cambio_horario
CREATE OR REPLACE FUNCTION auditoria_cambio_horario()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO auditoria_cambio_horario (id_tipo_cambio, valores_nuevos)
        VALUES (1, row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO auditoria_cambio_horario (id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (2, row_to_json(OLD), row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO auditoria_cambio_horario (id_tipo_cambio, valores_anteriores)
        VALUES (3, row_to_json(OLD));
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_auditoria_cambio_horario
AFTER INSERT OR UPDATE OR DELETE ON empleado.cambio_horario
FOR EACH ROW
EXECUTE FUNCTION auditoria_cambio_horario();

------------------------------------------------------------------------------------------------------------------