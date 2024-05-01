
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
    descripcion_grado_academico VARCHAR(30) NOT NULL,
    especialidad VARCHAR(35) NOT NULL
);

CREATE TABLE empleado.institucion
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
    nombre_genero VARCHAR(10) UNIQUE NOT NULL
);


CREATE TABLE empleado.estado_civil
(
    id_estado_civil SERIAL PRIMARY KEY,
    descripcion_estado_civil VARCHAR(20) UNIQUE NOT NULL
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


CREATE TABLE usuario.permiso_usuario
(
    id_permiso_usuario SERIAL PRIMARY KEY,
    nombre_permiso VARCHAR(70) UNIQUE NOT NULL
);

-- Asociaciones

CREATE TABLE usuario.rol_permiso_usuario
(
    id_rol INT NOT NULL,
    id_permiso_usuario INT NOT NULL,
    CONSTRAINT fk_rol_permiso_rol FOREIGN KEY (id_rol) 
        REFERENCES usuario.rol (id_rol),
    CONSTRAINT fk_rol_permiso_permiso FOREIGN KEY (id_permiso_usuario)
        REFERENCES usuario.permiso_usuario (id_permiso_usuario),
    CONSTRAINT pk_rol_permiso PRIMARY KEY (id_rol, id_permiso_usuario)
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

-- empleado

CREATE TABLE empleado.empleado
(
	codigo_empleado INT PRIMARY KEY,
	id_nacionalidad INT NOT NULL,
	id_genero INT NOT NULL,
	id_estado_civil INT NOT NULL,
	id_usuario INT NOT NULL,
	dni VARCHAR(15) NOT NULL UNIQUE,
	nombres VARCHAR(60) NOT NULL,
	apellidos VARCHAR(60) NOT NULL,
	fecha_nacimiento DATE,
	correo VARCHAR(50) NOT NULL UNIQUE,
	estado_empleado BOOLEAN NOT NULL DEFAULT TRUE,
	
	CONSTRAINT Fk_Empleado_Nacionalidad FOREIGN KEY (id_nacionalidad) 
		REFERENCES empleado.nacionalidad(id_nacionalidad),
	CONSTRAINT Fk_Empleado_genero FOREIGN KEY (id_genero) 
		REFERENCES empleado.genero(id_genero),
	CONSTRAINT Fk_Empleado_EstadoCivil FOREIGN KEY (id_estado_civil) 
		REFERENCES empleado.estado_civil(id_estado_civil),
	CONSTRAINT Fk_Empleado_Usuario FOREIGN KEY (id_usuario) 
		REFERENCES usuario.usuario(id_usuario)
);

CREATE TABLE empleado.operador_telefonico
(
    id_operador_telefonico SERIAL PRIMARY KEY,
    nombre_operador VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE empleado.telefono
(
    id_telefono SERIAL PRIMARY KEY,
    codigo_empleado INT NOT NULL,
    telefono VARCHAR(9) NOT NULL UNIQUE,
    id_operador_telefonico INT NOT NULL,
    CONSTRAINT Fk_Telefono_Empleado FOREIGN KEY (codigo_empleado) 
        REFERENCES empleado.empleado(codigo_empleado),
    CONSTRAINT Fk_Telefono_OperadorTelefonico FOREIGN KEY (id_operador_telefonico)
        REFERENCES empleado.operador_telefonico(id_operador_telefonico)
);

CREATE TABLE empleado.empleado_grado_academico
(
	codigo_empleado INT NOT NULL,
	id_grado_academico INT NOT NULL,
	id_institucion INT NOT NULL,
	anio_obtencion DATE NOT NULL,
	
	PRIMARY KEY (codigo_empleado, id_grado_academico, id_institucion),
	CONSTRAINT Fk_PersonaGradoAcademico_Empleado FOREIGN KEY (codigo_empleado) 
		REFERENCES empleado.empleado(codigo_empleado),
	CONSTRAINT Fk_PersonaGradoAcademico_GradoAcademico FOREIGN KEY (id_grado_academico) 
		REFERENCES empleado.grado_academico(id_grado_academico),
	CONSTRAINT Fk_PersonaGradoAcademico_Institucion FOREIGN KEY (id_institucion) 
		REFERENCES empleado.institucion(id_institucion)
);

CREATE TABLE empleado.departamento
(
	id_departamento SERIAL PRIMARY KEY,
	nombre_departamento VARCHAR(30) NOT NULL UNIQUE,
	codigo_empleado_jefe INT NOT NULL,
	
	CONSTRAINT Fk_Departamento_Empleado FOREIGN KEY (codigo_empleado_jefe) 
		REFERENCES empleado.empleado(codigo_empleado)
); 

-- creacion de la tabla contrato laboral

CREATE TABLE empleado.contrato_laboral
(
	id_contrato_laboral SERIAL PRIMARY KEY,
	codigo_empleado INT NOT NULL,
	id_tipo_contrato INT NOT NULL,
	id_puesto INT NOT NULL,
	id_departamento INT NOT NULL,
	numero_contrato VARCHAR(9) NOT NULL UNIQUE,
	fecha_inicio DATE NOT NULL,
	fecha_finalizacion DATE,
	salario DECIMAL(9,2) NOT NULL,
	hora_entrada TIME NOT NULL,
	hora_salida TIME NOT NULL,
	estado_contrato BOOLEAN NOT NULL,
	
	CONSTRAINT Fk_ContratoLaboral_Empleado FOREIGN KEY (codigo_empleado) 
		REFERENCES empleado.empleado(codigo_empleado),
	CONSTRAINT Fk_ContratoLaboral_TipoContrato FOREIGN KEY (id_tipo_contrato) 
		REFERENCES empleado.tipo_contrato(id_tipo_contrato),
	CONSTRAINT Fk_ContratoLaboral_Puesto FOREIGN KEY (id_puesto) 
		REFERENCES empleado.puesto(id_puesto),
	CONSTRAINT Fk_ContratoLaboral_Departamento FOREIGN KEY (id_departamento) 
		REFERENCES empleado.departamento(id_departamento)
);

CREATE TABLE empleado.contrato_laboral_beneficio
(
	id_contrato_laboral INT,
	id_beneficio INT,
	
	PRIMARY KEY (id_contrato_laboral, id_beneficio),
	CONSTRAINT Fk_ContratoBeneficio_ContratoLaboral FOREIGN KEY (id_contrato_laboral) 
		REFERENCES empleado.contrato_laboral(id_contrato_laboral),
    CONSTRAINT Fk_ContratoBeneficio_Beneficio FOREIGN KEY (id_beneficio)
        REFERENCES empleado.beneficio(id_beneficio)
);

-- creacion del periodo academico
CREATE TABLE proyecto.numero_periodo
(
	id_numero_periodo SERIAL PRIMARY KEY,
	numero_periodo VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE proyecto.periodo_academico(
	id_periodo_academico SERIAL PRIMARY KEY,
	id_numero_periodo INT NOT NULL,
	anio INT NOT NULL,
	
	CONSTRAINT Fk_PeriodoAcademico_NumeroPeriodo FOREIGN KEY (id_numero_periodo) 
		REFERENCES proyecto.numero_periodo(id_numero_periodo)
);

-- cambio de horario
CREATE TABLE empleado.cambio_horario
(
	id_cambio_horario SERIAL PRIMARY KEY,
	id_contrato_laboral INT NOT NULL,
	id_periodo_academico INT NOT NULL,
	nueva_hora_entrada TIME NOT NULL,
	nueva_hora_salida TIME NOT NULL,
	nota VARCHAR(350),
	fecha_cambio DATE,
	
	CONSTRAINT Fk_CambioHorario_ContratoLaboral FOREIGN KEY (id_contrato_laboral) 
		REFERENCES empleado.contrato_laboral(id_contrato_laboral),
	CONSTRAINT Fk_CambioHorario_PeriodoAcademico FOREIGN KEY (id_periodo_academico) 
		REFERENCES proyecto.periodo_academico(id_periodo_academico)
);

-- creacion del modulo proyecto
CREATE TABLE proyecto.dimension
(
	id_dimension SERIAL PRIMARY KEY,
	nombre_dimension VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE proyecto.tipo_proyecto
(
	id_tipo_proyecto SERIAL PRIMARY KEY,
	nombre_tipo_proyecto VARCHAR (25) NOT NULL UNIQUE
);

CREATE TABLE proyecto.estado(
	id_estado SERIAL PRIMARY KEY,
	nombre_estado VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE proyecto.proyecto
(
	id_proyecto SERIAL PRIMARY KEY,
	id_tipo_proyecto INT NOT NULL,
	id_periodo_academico INT NOT NULL,
	id_departamento INT NOT NULL,
	id_dimension INT NOT NULL,
	id_estado INT NOT NULL,
	nombre_proyecto VARCHAR(60) NOT NULL,
	fecha_inicio DATE,
	fecha_fin DATE,
	
	CONSTRAINT Fk_Proyecto_TipoProyecto FOREIGN KEY (id_tipo_proyecto) 
		REFERENCES proyecto.tipo_proyecto(id_tipo_proyecto),
	CONSTRAINT Fk_Proyecto_PeriodoAcademico FOREIGN KEY (id_periodo_academico) 
		REFERENCES proyecto.periodo_academico(id_periodo_academico),
	CONSTRAINT Fk_Proyecto_Departamento FOREIGN KEY (id_departamento) 
		REFERENCES empleado.departamento(id_departamento),
	CONSTRAINT Fk_Proyecto_Dimension FOREIGN KEY (id_dimension) 
		REFERENCES proyecto.dimension(id_dimension),
	CONSTRAINT Fk_Proyecto_Estado FOREIGN KEY (id_estado) 
		REFERENCES proyecto.estado(id_estado)
);

CREATE TABLE proyecto.actividad(
	id_actividad SERIAL PRIMARY KEY,
	id_proyecto INT NOT NULL,
	nombre_actividad VARCHAR(70) NOT NULL,
	fecha_actividad DATE,
	
	CONSTRAINT Fk_Actividad_Proyecto FOREIGN KEY (id_proyecto) 
		REFERENCES proyecto.proyecto(id_proyecto)
);

CREATE TABLE proyecto.rol_proyecto
(
	id_rol_proyecto SERIAL PRIMARY KEY,
	nombre_rol VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE proyecto.empleado_proyecto
(
	id_empleado_proyecto SERIAL UNIQUE,
	id_rol_proyecto INT NOT NULL,
	id_proyecto INT NOT NULL,
	codigo_empleado INT NOT NULL,

	CONSTRAINT PK_EmpleadoProyecto PRIMARY KEY (id_empleado_proyecto),
	CONSTRAINT UK_EmpleadoProyecto UNIQUE (id_rol_proyecto, id_proyecto, codigo_empleado),
	CONSTRAINT Fk_EmpleadoProyecto_RolProyecto FOREIGN KEY (id_rol_proyecto) 
		REFERENCES proyecto.rol_proyecto(id_rol_proyecto),
	CONSTRAINT Fk_EmpleadoProyecto_Proyecto FOREIGN KEY (id_proyecto) 
		REFERENCES proyecto.proyecto(id_proyecto),
	CONSTRAINT Fk_EmpleadoProyecto_Empleado FOREIGN KEY (codigo_empleado) 
		REFERENCES empleado.empleado(codigo_empleado)
);

CREATE TABLE proyecto.actividad_empleado_proyecto
(
	id_actividad_empleado_proyecto SERIAL UNIQUE,
	id_actividad INT NOT NULL,
	id_empleado_proyecto INT NOT NULL,
	id_estado INT NOT NULL,
	horas_trabajadas INT NOT NULL,
	dias_compensatorios INT  NOT NULL,
	medio_verificacion VARCHAR(100),
	
	CONSTRAINT PK_ActividadEmpleadoProyecto PRIMARY KEY (id_actividad_empleado_proyecto),
	CONSTRAINT UK_ActividadEmpleadoProyecto UNIQUE (id_actividad, id_empleado_proyecto),
	CONSTRAINT Fk_ActividadEmpleadoProyecto_Actividad FOREIGN KEY (id_actividad) 
		REFERENCES proyecto.actividad(id_actividad),
	CONSTRAINT Fk_ActividadEmpleadoProyecto_EmpleadoProyecto FOREIGN KEY (id_empleado_proyecto) 
		REFERENCES proyecto.empleado_proyecto(id_empleado_proyecto),
	CONSTRAINT Fk_ActividadEmpleadoProyecto_Estado FOREIGN KEY (id_estado) 
		REFERENCES proyecto.estado(id_estado)
);

-- creacion del modulo proceso
CREATE TABLE proceso.nombre_prueba
(
	id_nombre_prueba SERIAL PRIMARY KEY,
	nombre_prueba VARCHAR (100) NOT NULL UNIQUE
);

CREATE TABLE proceso.rol_proceso
(
	id_rol_proceso SERIAL PRIMARY KEY,
	descripcion_rol VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE proceso.descripcion
(
	id_descripcion SERIAL PRIMARY KEY,
	nombre_proceso VARCHAR(100) NOT NULL
);

CREATE TABLE proceso.estado_proceso
(
	id_estado_proceso SERIAL PRIMARY KEY,
	nombre_estado_proceso VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE proceso.proceso
(
	id_proceso SERIAL PRIMARY KEY,
	id_descripcion INT NOT NULL,
	id_estado_proceso INT NOT NULL,
	fecha DATE,
	cantidad_compensatoria INT NOT NULL,
	
	CONSTRAINT Fk_Proceso_Descripcion FOREIGN KEY (id_descripcion) 
		REFERENCES proceso.descripcion(id_descripcion),
	CONSTRAINT Fk_Proceso_EstadoProceso FOREIGN KEY (id_estado_proceso) 
		REFERENCES proceso.estado_proceso(id_estado_proceso)
);

CREATE TABLE proceso.empleado_proceso
(
	id_empleado_proceso SERIAL UNIQUE,
	codigo_empleado INT NOT NULL,
	id_rol_proceso INT NOT NULL,
	id_proceso INT NOT NULL,
	
	CONSTRAINT PK_EmpleadoProceso PRIMARY KEY (id_empleado_proceso),
	CONSTRAINT UK_EmpleadoProceso UNIQUE (codigo_empleado, id_proceso),
	CONSTRAINT Fk_EmpleadoProceso_Empleado FOREIGN KEY (codigo_empleado) 
		REFERENCES empleado.empleado(codigo_empleado),
	CONSTRAINT Fk_EmpleadoProceso_RolProceso FOREIGN KEY (id_rol_proceso) 
		REFERENCES proceso.rol_proceso(id_rol_proceso),
	CONSTRAINT Fk_EmpleadoProceso_Proceso FOREIGN KEY (id_proceso) 
		REFERENCES proceso.proceso(id_proceso)
);

CREATE TABLE proceso.asistencia
(
	id_empleado_proceso INT NOT NULL,
	id_nombre_prueba INT NOT NULL, 
	estado BOOLEAN NOT NULL DEFAULT TRUE,
	
	PRIMARY KEY (id_empleado_proceso, id_nombre_prueba),
	CONSTRAINT Fk_Asistencia_NombrePrueba FOREIGN KEY (id_nombre_prueba) 
		REFERENCES proceso.nombre_prueba(id_nombre_prueba),
	CONSTRAINT Fk_Asistencia_EmpleadoProceso FOREIGN KEY (id_empleado_proceso) 
		REFERENCES proceso.empleado_proceso(id_empleado_proceso)
);

-- creacion del modulo permiso
CREATE TABLE permiso.tipo_permiso
(
	id_tipo_permiso SERIAL PRIMARY KEY,
	nombre_tipo_permiso VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE permiso.permiso
(
	id_permiso SERIAL PRIMARY KEY,
	codigo_empleado INT NOT NULL,
	id_tipo_permiso INT NOT NULL,
	hora_recibido TIME NOT NULL,
	fecha_ingreso DATE NOT NULL, 
	fecha_inicio DATE NOT NULL,
	fecha_final DATE NOT NULL,
	descripcion VARCHAR(200),
	dias INT,
	horas INT,
	minutos INT,
	observacion VARCHAR(200),
	respaldo BOOLEAN NOT NULL DEFAULT FALSE,
	recibido_por INT NOT NULL,
	
	CONSTRAINT Fk_Permiso_Empleado FOREIGN KEY (codigo_empleado) 
		REFERENCES empleado.empleado(codigo_empleado),
	CONSTRAINT Fk_Permiso_TipoPermiso FOREIGN KEY (id_tipo_permiso) 
		REFERENCES permiso.tipo_permiso(id_tipo_permiso),
	CONSTRAINT Fk_Permiso_Empleados FOREIGN KEY (recibido_por) 
		REFERENCES empleado.empleado(codigo_empleado)
);

CREATE TABLE permiso.permiso_compensatorio_proceso
(
	id_permiso INT NOT NULL,
	id_proceso INT NOT NULL,
	
	PRIMARY KEY(id_permiso, id_proceso),
	CONSTRAINT Fk_PermisoCompensatorioProceso_PermisoFinal FOREIGN KEY (id_permiso) 
		REFERENCES permiso.permiso(id_permiso),
	CONSTRAINT Fk_PermisoCompensatorioProceso_Proceso FOREIGN KEY (id_proceso) 
		REFERENCES proceso.proceso(id_proceso)
);

CREATE TABLE permiso.permiso_compensatorio_proyecto
(
	id_permiso INT NOT NULL,
	id_actividad_empleado_proyecto INT NOT NULL,
	
	PRIMARY KEY(id_permiso, id_actividad_empleado_proyecto),
	CONSTRAINT Fk_PermisoCompensatorioProyecto_PermisoFinal FOREIGN KEY (id_permiso) 
		REFERENCES permiso.permiso(id_permiso),
	CONSTRAINT Fk_PermisoCompensatorioProyecto_ActividadEmpleadoProyecto FOREIGN KEY (id_actividad_empleado_proyecto) 
		REFERENCES proyecto.actividad_empleado_proyecto(id_actividad_empleado_proyecto)

);



--DROP FUNCTION IF EXISTS consultar_empleados_mayores_35();
-- 1. SP mostrar a los empleados mayores a 35 años
CREATE OR REPLACE FUNCTION consultar_empleados_mayores_35()
RETURNS TABLE (
	codigo_empleado INT,
	estado_empleado BOOLEAN,
	nombre_nacionalidad VARCHAR(25),
	nombre_genero VARCHAR(10),
	descripcion_estado_civil VARCHAR(20),
	dni VARCHAR(15),
	nombres VARCHAR(60),
	apellidos VARCHAR(60),
	fecha_nacimiento DATE,
	correo VARCHAR(50),
	edad NUMERIC
) AS $$
BEGIN
	RETURN QUERY 
	SELECT 
		e.codigo_empleado,
		e.estado_empleado,
		n.nombre_nacionalidad,
		g.nombre_genero,
		ec.descripcion_estado_civil,
		e.dni,
		e.nombres,
		e.apellidos,
		e.fecha_nacimiento,
		e.correo,
		EXTRACT(YEAR FROM age(e.fecha_nacimiento)) AS edad
	FROM empleado.empleado e
	INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
	INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
	INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
	WHERE EXTRACT(YEAR FROM age(e.fecha_nacimiento)) > 35;
END; 
$$ LANGUAGE plpgsql;

SELECT * 
FROM consultar_empleados_mayores_35();

-- 2. SP mostrar los empleados de género femenino
CREATE OR REPLACE FUNCTION consultar_empleados_genero_femenino()
RETURNS TABLE (
    codigo_empleado INT,
    estado_empleado BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        e.estado_empleado,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    WHERE g.nombre_genero = 'Femenino';

END; 
$$ LANGUAGE plpgsql;

SELECT *
FROM consultar_empleados_genero_femenino();

-- 3. SP mostrar los empleados de género masculino
CREATE OR REPLACE FUNCTION consultar_empleados_genero_masculino()
RETURNS TABLE (
    codigo_empleado INT,
    estado_empleado BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        e.estado_empleado,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    WHERE g.nombre_genero = 'Masculino';

END; 
$$ LANGUAGE plpgsql;

SELECT * 
FROM consultar_empleados_genero_masculino();

-- 4. SP mostrar los empleados mayores a 35 años y de género masculino
CREATE OR REPLACE FUNCTION consultar_empleados_mayores_35_masculino()
RETURNS TABLE (
    codigo_empleado INT,
    estado_empleado BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        e.estado_empleado,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    WHERE EXTRACT(YEAR FROM age(e.fecha_nacimiento)) > 35 AND g.nombre_genero = 'Masculino';

END; 
$$ LANGUAGE plpgsql;

SELECT * 
FROM consultar_empleados_mayores_35_masculino();

-- 5. SP mostrar los empleados mayores a 35 años y de género femenino
CREATE OR REPLACE FUNCTION consultar_empleados_mayores_35_femenino()
RETURNS TABLE (
    codigo_empleado INT,
    estado_empleado BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        e.estado_empleado,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    WHERE EXTRACT(YEAR FROM age(e.fecha_nacimiento)) > 35 AND g.nombre_genero = 'Femenino';

END; 
$$ LANGUAGE plpgsql;

SELECT *
FROM consultar_empleados_mayores_35_femenino();

-- 6. SP mostrar los empleados egresados de la UNAH
CREATE OR REPLACE FUNCTION consultar_empleados_egresados_unah()
RETURNS TABLE (
    codigo_empleado INT,
    estado_empleado BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50),
    descripcion_grado_academico VARCHAR(30),
    especialidad VARCHAR(35),
    nombre_institucion VARCHAR(100),
    anio_obtencion DATE
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        e.estado_empleado,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo,
        ga.descripcion_grado_academico,
        ga.especialidad,
        i.nombre_institucion,
        ega.anio_obtencion
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    INNER JOIN empleado.empleado_grado_academico ega ON e.codigo_empleado = ega.codigo_empleado
    INNER JOIN empleado.grado_academico ga ON ega.id_grado_academico = ga.id_grado_academico
    INNER JOIN empleado.institucion i ON ega.id_institucion = i.id_institucion
    WHERE i.nombre_institucion = 'UNAH';

END; 
$$ LANGUAGE plpgsql;

SELECT * 
FROM consultar_empleados_egresados_unah();

-- 7. SP mostrar a los empleados con nacionalidad extranjera 
-- TODOS AQUELLO CUYA NACIONALIDAD NO SEA HONDUREÑA

CREATE OR REPLACE FUNCTION consultar_empleados_nacionalidad_extranjera()
RETURNS TABLE (
    codigo_empleado INT,
    estado_empleado BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        e.estado_empleado,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    WHERE n.nombre_nacionalidad != 'Hondureña';

END; 
$$ LANGUAGE plpgsql;

SELECT * 
FROM consultar_empleados_nacionalidad_extranjera();

-- 8. SP mostrar a los empleados con nacionalidad hondureña
CREATE OR REPLACE FUNCTION consultar_empleados_nacionalidad_hondurena()
RETURNS TABLE (
    codigo_empleado INT,
    estado_empleado BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        e.estado_empleado,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    WHERE n.nombre_nacionalidad = 'Hondureña';

END; 
$$ LANGUAGE plpgsql;


SELECT * 
FROM consultar_empleados_nacionalidad_hondurena();

-- 9. SP mostrar al empleado más antiguo
CREATE OR REPLACE FUNCTION consultar_empleado_mas_antiguo()
RETURNS TABLE (
    codigo_empleado INT,
    estado_empleado BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50),
    fecha_inicio DATE
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        e.estado_empleado,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo,
        cl.fecha_inicio
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    INNER JOIN empleado.contrato_laboral cl ON e.codigo_empleado = cl.codigo_empleado
    WHERE cl.fecha_inicio = (SELECT MIN(ecl.fecha_inicio) FROM empleado.contrato_laboral ecl);

END; 
$$ LANGUAGE plpgsql;


SELECT consultar_empleado_mas_antiguo();

-- 10. SP mostrar al empleado más reciente
CREATE OR REPLACE FUNCTION consultar_empleado_mas_reciente()
RETURNS TABLE (
    codigo_empleado INT,
    estado_empleado BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50),
    fecha_inicio DATE
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        e.estado_empleado,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo,
        cl.fecha_inicio
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    INNER JOIN empleado.contrato_laboral cl ON e.codigo_empleado = cl.codigo_empleado
    WHERE cl.fecha_inicio = (SELECT MAX(ecl.fecha_inicio) FROM empleado.contrato_laboral ecl);

END; 
$$ LANGUAGE plpgsql;

SELECT consultar_empleado_mas_reciente();

-- DROP FUNCTION IF EXISTS consultar_empleados_contrato_activo();
-- 11. SP mostrar a los empleados con contrato activo
CREATE OR REPLACE FUNCTION consultar_empleados_contrato_activo()
RETURNS TABLE (
    codigo_empleado INT,
    estado_contrato BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50),
    fecha_inicio DATE
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        cl.estado_contrato,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo,
        cl.fecha_inicio
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    INNER JOIN empleado.contrato_laboral cl ON e.codigo_empleado = cl.codigo_empleado
    WHERE cl.estado_contrato = TRUE;

END; 
$$ LANGUAGE plpgsql;

SELECT * from consultar_empleados_contrato_activo();


-- 12. Mostrar los empleados que pertenecen a un proyecto en especifico 

CREATE OR REPLACE FUNCTION consultar_empleados_proyecto_especifico(IN proyecto_id INT)
RETURNS TABLE (
    codigo_empleado INT,
    estado_empleado BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50),
    nombre_proyecto VARCHAR(60)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        e.estado_empleado,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo,
        p.nombre_proyecto
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    INNER JOIN proyecto.empleado_proyecto ep ON e.codigo_empleado = ep.codigo_empleado
    INNER JOIN proyecto.proyecto p ON ep.id_proyecto = p.id_proyecto
    WHERE p.id_proyecto = proyecto_id ;

END; 
$$ LANGUAGE plpgsql;

SELECT consultar_empleados_proyecto_especifico(3);

--DROP FUNCTION IF EXISTS consultar_actividades_proyecto_especifico(IN proyecto_id INT)
-- 13. Mostrar las actividades que pertenecen a un proyecto en especifico
CREATE OR REPLACE FUNCTION consultar_actividades_proyecto_especifico(IN proyecto_id INT)
RETURNS TABLE (
    id_actividad INT,
    nombre_actividad VARCHAR(70),
    fecha_actividad DATE,
    nombre_proyecto VARCHAR(60)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        a.id_actividad,
        a.nombre_actividad,
        a.fecha_actividad,
        p.nombre_proyecto
    FROM proyecto.actividad a
    INNER JOIN proyecto.proyecto p ON a.id_proyecto = p.id_proyecto
    WHERE p.id_proyecto = proyecto_id;

END; 
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_actividades_proyecto_especifico(2);


-- 14. Mostrar los empleados que trabajaron en un proceso de admisión en especifico 

CREATE OR REPLACE FUNCTION consultar_empleados_proceso_especifico(IN proceso_id INT)
RETURNS TABLE (
    codigo_empleado INT,
    estado_empleado BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50),
    nombre_proceso VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        e.estado_empleado,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo,
        pd.nombre_proceso
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    INNER JOIN proceso.empleado_proceso ep ON e.codigo_empleado = ep.codigo_empleado
    INNER JOIN proceso.proceso pr ON ep.id_proceso = pr.id_proceso
	INNER JOIN proceso.descripcion pd ON pr.id_descripcion = pd.id_descripcion
    WHERE pr.id_proceso = proceso_id;

END; 
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_empleados_proceso_especifico(3);



-- 15. Mostrar los empleados que pertenecen a un departamento en especifico
CREATE OR REPLACE FUNCTION consultar_empleados_departamento_especifico(IN departamento_id INT)
RETURNS TABLE (
    codigo_empleado INT,
    estado_empleado BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50),
    nombre_departamento VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        e.estado_empleado,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo,
        d.nombre_departamento
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    INNER JOIN empleado.contrato_laboral cl ON e.codigo_empleado = cl.codigo_empleado
    INNER JOIN empleado.departamento d ON cl.id_departamento = d.id_departamento
    WHERE d.id_departamento = departamento_id AND cl.estado_contrato = TRUE;

END; 
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_empleados_departamento_especifico(2);

-- 16. Mostrar los jefes de cada departamento
CREATE OR REPLACE FUNCTION consultar_jefes_departamento()
RETURNS TABLE (
    codigo_empleado INT,
    estado_empleado BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50),
    nombre_departamento VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        e.estado_empleado,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo,
        d.nombre_departamento
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    INNER JOIN empleado.contrato_laboral cl ON e.codigo_empleado = cl.codigo_empleado
    INNER JOIN empleado.departamento d ON e.codigo_empleado = d.codigo_empleado_jefe;

END; 
$$ LANGUAGE plpgsql;
SELECT * FROM consultar_jefes_departamento();


--DROP FUNCTION IF EXISTS consultar_proyectos_dimension(IN dimension_id INT)
-- 17. Mostrar los proyectos por una dimensión determinada 
CREATE OR REPLACE FUNCTION consultar_proyectos_dimension(IN dimension_id INT)
RETURNS TABLE (
    id_proyecto INT,
    nombre_proyecto VARCHAR(60),
    fecha_inicio DATE,
    fecha_final DATE,
    nombre_dimension VARCHAR(60)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        p.id_proyecto,
        p.nombre_proyecto,
        p.fecha_inicio,
        p.fecha_fin,
        d.nombre_dimension
    FROM proyecto.proyecto p
    INNER JOIN proyecto.dimension d ON p.id_dimension = d.id_dimension
    WHERE d.id_dimension = dimension_id;

END; 
$$ LANGUAGE plpgsql;

SELECT *
FROM consultar_proyectos_dimension(3);


-- 18. Mostrar la cantidad 
-- (INTEGER) de permisos compensatorios que se le han otorgado a un empleado por todos los proceso
DROP FUNCTION consultar_permisos_compensatorios_empleado_process(integer)
	
CREATE OR REPLACE FUNCTION consultar_permisos_compensatorios_empleado_process(empleado_codigo INT)
RETURNS INT AS $$
DECLARE
    cantidad_permisos_compensatorios INT;
BEGIN
    cantidad_permisos_compensatorios := 0;

   SELECT SUM(compensatorios_por_proceso) AS total_compensatorios
   INTO cantidad_permisos_compensatorios
   FROM (SELECT 
			COUNT(ep.id_empleado_proceso) * COALESCE(pp.cantidad_compensatoria, 0) AS compensatorios_por_proceso
         FROM proceso.empleado_proceso ep
         INNER JOIN proceso.asistencia pa ON pa.id_empleado_proceso = ep.id_empleado_proceso 
         INNER JOIN proceso.proceso pp ON ep.id_proceso = pp.id_proceso
         INNER JOIN proceso.descripcion pd ON pp.id_descripcion = pd.id_descripcion
   		 WHERE ep.codigo_empleado = empleado_codigo 
         AND pa.estado = true
    GROUP BY pp.id_proceso
    ) subquery;
	
    RETURN cantidad_permisos_compensatorios;
	
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM consultar_permisos_compensatorios_empleado_process(2);




-- DROP FUNCTION mostrar_asistencia_proceso() 
-- 19 Mostrar la cantidad de asistencias por cada proceso
CREATE OR REPLACE FUNCTION mostrar_asistencia_proceso()
RETURNS TABLE (
    nombre_proceso VARCHAR(100),
    fecha DATE,
    cantidad_asistentes BIGINT -- Cambiar de INT a BIGINT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        d.nombre_proceso,
        p.fecha,
        COUNT(ep.codigo_empleado) AS cantidad_asistentes
    FROM proceso.empleado_proceso ep
    JOIN empleado.empleado e ON ep.codigo_empleado = e.codigo_empleado
    JOIN proceso.proceso p ON ep.id_proceso = p.id_proceso
    JOIN proceso.descripcion d ON p.id_descripcion = d.id_descripcion
    GROUP BY d.nombre_proceso, p.fecha;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM mostrar_asistencia_proceso();


-- 20 MOSTRAR LOS PROYECTOS POR PERIODO ACADEMICO
CREATE OR REPLACE FUNCTION mostrar_proyectos_periodo_academico(IN periodo_academico_id INT)
RETURNS TABLE (
    nombre_proyecto VARCHAR(60),
    fecha_inicio DATE,
    fecha_fin DATE,
    nombre_periodo VARCHAR(15)
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.nombre_proyecto,
        p.fecha_inicio,
        p.fecha_fin,
        np.numero_periodo
    FROM proyecto.proyecto p
    JOIN proyecto.periodo_academico pa ON p.id_periodo_academico = pa.id_periodo_academico
    JOIN proyecto.numero_periodo np ON pa.id_numero_periodo = np.id_numero_periodo
    WHERE pa.id_periodo_academico = periodo_academico_id;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM mostrar_proyectos_periodo_academico(2);


-- funciones usando CASE

-- Obtener el estado de un proyecto en base a la fecha actual
-- Pendiente, En curso, Finalizado
CREATE OR REPLACE FUNCTION estado_proyecto(proyecto_id INT)
RETURNS TEXT AS $$
DECLARE
    inicio DATE;
    fin DATE;
BEGIN
    SELECT fecha_inicio, fecha_fin INTO inicio, fin
    FROM proyecto.proyecto
    WHERE id_proyecto = proyecto_id;

    RETURN CASE
        WHEN CURRENT_DATE < inicio THEN 'Pendiente'
        WHEN CURRENT_DATE BETWEEN inicio AND fin THEN 'En curso'
        WHEN CURRENT_DATE > fin THEN 'Finalizado'
    END;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM estado_proyecto(1);

-- Clasificar el periodo academico en base a la cantidad de proyectos
-- Bajo, Medio, Alto
CREATE OR REPLACE FUNCTION clasificar_periodo(periodo_id INT)
RETURNS TEXT AS $$
DECLARE
    num_proyectos INT;
BEGIN
    SELECT COUNT(*) INTO num_proyectos
    FROM proyecto.proyecto
    WHERE id_periodo_academico = periodo_id;

    RETURN CASE
        WHEN num_proyectos < 10 THEN 'Bajo'
        WHEN num_proyectos BETWEEN 10 AND 20 THEN 'Medio'
        WHEN num_proyectos > 20 THEN 'Alto'
    END;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM clasificar_periodo(1);


-- Obtener la prioridad de un proyecto en base al periodo academico
-- Primer semestre, Segundo semestre
CREATE OR REPLACE FUNCTION prioridad_proyecto(proyecto_id INT)
RETURNS TEXT AS $$
DECLARE
    periodo_id INT;
BEGIN
    SELECT id_periodo_academico INTO periodo_id
    FROM proyecto.proyecto
    WHERE id_proyecto = proyecto_id;

    RETURN (SELECT clasificar_periodo(periodo_id));
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM prioridad_proyecto(1);

-- Obtener el tipo de periodo academico
-- Primer semestre, Segundo semestre
CREATE OR REPLACE FUNCTION tipo_periodo(periodo_id INT)
RETURNS TEXT AS $$
DECLARE
    num_periodo VARCHAR(15);
BEGIN
    SELECT numero_periodo INTO num_periodo
    FROM proyecto.numero_periodo
    WHERE id_numero_periodo = periodo_id;

    RETURN CASE num_periodo
        WHEN '1PAC' THEN 'Primer periodo Academico'
        WHEN '2PAC' THEN 'Segundo periodo Academico'
        WHEN '3PAC' THEN 'Tercer periodo Academico'
    END;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM tipo_periodo(1);

-- Obtener el progreso de un proyecto
-- 0%, N%, 100%
CREATE OR REPLACE FUNCTION progreso_proyecto(proyecto_id INT)
RETURNS TEXT AS $$
DECLARE
    inicio DATE;
    fin DATE;
BEGIN
    SELECT fecha_inicio, fecha_fin INTO inicio, fin
    FROM proyecto.proyecto
    WHERE id_proyecto = proyecto_id;

    RETURN CASE
        WHEN CURRENT_DATE < inicio THEN '0%'
        WHEN CURRENT_DATE BETWEEN inicio AND fin THEN ((CURRENT_DATE - inicio) * 100 / (fin - inicio)) || '%'
        WHEN CURRENT_DATE > fin THEN '100%'
    END;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM progreso_proyecto(1);

CREATE OR REPLACE FUNCTION consultar_empleados_proceso_especifico(IN proceso_id INT)
RETURNS TABLE (
    codigo_empleado INT,
    estado_empleado BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50),
    nombre_proceso VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        e.estado_empleado,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo,
        pd.nombre_proceso
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    INNER JOIN proceso.empleado_proceso ep ON e.codigo_empleado = ep.codigo_empleado
    INNER JOIN proceso.proceso pr ON ep.id_proceso = pr.id_proceso
	INNER JOIN proceso.descripcion pd ON pr.id_descripcion = pd.id_descripcion
    WHERE pr.id_proceso = proceso_id;

END; 
$$ LANGUAGE plpgsql;

-- SP DE BUSQUEDA (FILTROS)
-- 1. Obtener todos los proyectos de un periodo academico
CREATE OR REPLACE FUNCTION proyectos_por_periodo(periodo_id INT)
RETURNS TABLE ( 
    id_proyecto INT, 
    nombre_proyecto VARCHAR(60), 
    fecha_inicio DATE, 
    fecha_final DATE, 
    nombre_dimension VARCHAR(60)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        pp.id_proyecto,
        pp.nombre_proyecto,
        pp.fecha_inicio,
        pp.fecha_fin,
        pd.nombre_dimension
    FROM proyecto.proyecto pp
    INNER JOIN proyecto.dimension pd ON pp.id_dimension = pd.id_dimension
    WHERE pp.id_periodo_academico = periodo_id;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM proyectos_por_periodo(1);


--2. Obtener todos los proyectos que iniciaron en un rango de fechas
CREATE OR REPLACE FUNCTION proyectos_por_fecha(inicio DATE, fin DATE)
RETURNS TABLE ( 
    id_proyecto INT, 
    nombre_proyecto VARCHAR(60), 
    fecha_inicio DATE, 
    fecha_final DATE, 
    nombre_dimension VARCHAR(60)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        pp.id_proyecto,
        pp.nombre_proyecto,
        pp.fecha_inicio,
        pp.fecha_fin,
        pd.nombre_dimension
    FROM proyecto.proyecto pp
    INNER JOIN proyecto.dimension pd ON pp.id_dimension = pd.id_dimension
    WHERE pp.fecha_inicio BETWEEN inicio AND fin;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM proyectos_por_fecha('2001-01-01', '2021-12-31');

--3. Obtener todos los proyectos que finalizaron en un rango de fechas
CREATE OR REPLACE FUNCTION proyectos_por_fecha_final(inicio DATE, fin DATE)
RETURNS TABLE ( 
    id_proyecto INT, 
    nombre_proyecto VARCHAR(60), 
    fecha_inicio DATE, 
    fecha_final DATE, 
    nombre_dimension VARCHAR(60)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        pp.id_proyecto,
        pp.nombre_proyecto,
        pp.fecha_inicio,
        pp.fecha_fin,
        pd.nombre_dimension
    FROM proyecto.proyecto pp
    INNER JOIN proyecto.dimension pd ON pp.id_dimension = pd.id_dimension
    WHERE pp.fecha_fin BETWEEN inicio AND fin;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM proyectos_por_fecha_final('2021-01-01', '2021-12-31');


--4. Obtener todos los proyectos que iniciaron y finalizaron en un rango de fechas
CREATE OR REPLACE FUNCTION proyectos_por_fecha_inicio_fin(inicio DATE, fin DATE)
RETURNS TABLE ( 
    id_proyecto INT, 
    nombre_proyecto VARCHAR(60), 
    fecha_inicio DATE, 
    fecha_final DATE, 
    nombre_dimension VARCHAR(60)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        pp.id_proyecto,
        pp.nombre_proyecto,
        pp.fecha_inicio,
        pp.fecha_fin,
        pd.nombre_dimension
    FROM proyecto.proyecto pp
    INNER JOIN proyecto.dimension pd ON pp.id_dimension = pd.id_dimension
    WHERE pp.fecha_inicio BETWEEN inicio AND fin
    AND pp.fecha_fin BETWEEN inicio AND fin;
END;
$$ LANGUAGE plpgsql;


SELECT *
FROM proyectos_por_fecha_inicio_fin('2001-01-01', '2021-12-31');


--5. Obtener todos los proyectos por un estado determinado
CREATE OR REPLACE FUNCTION proyectos_por_estado(estado_proyecto VARCHAR(20))
RETURNS TABLE ( 
    id_proyecto INT, 
    nombre_proyecto VARCHAR(60), 
    fecha_inicio DATE, 
    fecha_final DATE, 
    nombre_dimension VARCHAR(60)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        pp.id_proyecto,
        pp.nombre_proyecto,
        pp.fecha_inicio,
        pp.fecha_fin,
        pd.nombre_dimension
    FROM proyecto.proyecto pp
    INNER JOIN proyecto.dimension pd ON pp.id_dimension = pd.id_dimension
    INNER JOIN proyecto.estado pe ON pe.id_estado = pp.id_estado
	WHERE pe.nombre_estado = estado_proyecto;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM proyectos_por_estado('En proceso');

--6. Obtener todos los proyectos por coincidencia de nombre de proyecto
CREATE OR REPLACE FUNCTION proyectos_por_nombre(proyecto_nombre VARCHAR(60))
RETURNS TABLE ( 
    id_proyecto INT, 
    nombre_proyecto VARCHAR(60), 
    fecha_inicio DATE, 
    fecha_final DATE, 
    nombre_dimension VARCHAR(60)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        pp.id_proyecto,
        pp.nombre_proyecto,
        pp.fecha_inicio,
        pp.fecha_fin,
        pd.nombre_dimension
    FROM proyecto.proyecto pp
    INNER JOIN proyecto.dimension pd ON pp.id_dimension = pd.id_dimension
    WHERE pp.nombre_proyecto LIKE '%' || proyecto_nombre || '%';
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM proyectos_por_nombre('pro');



--7. Obtener todos los proyectos por periodo academico y estado
CREATE OR REPLACE FUNCTION proyectos_por_periodo_estado(periodo_id INT, proyecto_estado VARCHAR(20))
RETURNS TABLE ( 
    id_proyecto INT, 
    nombre_proyecto VARCHAR(60), 
    fecha_inicio DATE, 
    fecha_final DATE, 
    nombre_dimension VARCHAR(60)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        pp.id_proyecto,
        pp.nombre_proyecto,
        pp.fecha_inicio,
        pp.fecha_fin,
        pd.nombre_dimension
    FROM proyecto.proyecto pp
    INNER JOIN proyecto.dimension pd ON pp.id_dimension = pd.id_dimension
	INNER JOIN proyecto.estado pe ON pe.id_estado = pp.id_estado
    WHERE pp.id_periodo_academico = periodo_id
    AND pe.nombre_estado = proyecto_estado;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM proyectos_por_periodo_estado(2, 'Finalizado');

--8. Obtener todos los proyectos por periodo academico y nombre de proyecto
CREATE OR REPLACE FUNCTION proyectos_por_periodo_nombre(periodo_id INT, proyecto_nombre VARCHAR(60))
RETURNS TABLE ( 
    id_proyecto INT, 
    nombre_proyecto VARCHAR(60), 
    fecha_inicio DATE, 
    fecha_final DATE, 
    nombre_dimension VARCHAR(60)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        pp.id_proyecto,
        pp.nombre_proyecto,
        pp.fecha_inicio,
        pp.fecha_fin,
        pd.nombre_dimension
    FROM proyecto.proyecto pp
    INNER JOIN proyecto.dimension pd ON pp.id_dimension = pd.id_dimension
    WHERE pp.id_periodo_academico = periodo_id
    AND pp.nombre_proyecto LIKE '%' || proyecto_nombre || '%';
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM proyectos_por_periodo_nombre(1, 'Proyecto');


-- 9. Obtener todos los empleador por nombre
CREATE OR REPLACE FUNCTION empleados_por_nombre(empleado_nombre VARCHAR(60))
RETURNS TABLE (
    codigo_empleado INT,
    estado_empleado BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        e.estado_empleado,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    WHERE e.nombres LIKE '%' || empleado_nombre || '%';
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM empleados_por_nombre('J');

-- 10. Obtener todos los empleados por apellido
CREATE OR REPLACE FUNCTION empleados_por_apellido(empleado_apellido VARCHAR(60))
RETURNS TABLE (
    codigo_empleado INT,
    estado_empleado BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        e.estado_empleado,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    WHERE e.apellidos LIKE '%' || empleado_apellido || '%';
END;

$$ LANGUAGE plpgsql;

SELECT *
FROM empleados_por_apellido('M');

-- 11. Obtener todos los empleados por correo
CREATE OR REPLACE FUNCTION empleados_por_correo(empleado_correo VARCHAR(50))
RETURNS TABLE (
    codigo_empleado INT,
    estado_empleado BOOLEAN,
    nombre_nacionalidad VARCHAR(25),
    nombre_genero VARCHAR(10),
    descripcion_estado_civil VARCHAR(20),
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        e.codigo_empleado,
        e.estado_empleado,
        n.nombre_nacionalidad,
        g.nombre_genero,
        ec.descripcion_estado_civil,
        e.dni,
        e.nombres,
        e.apellidos,
        e.fecha_nacimiento,
        e.correo
    FROM empleado.empleado e
    INNER JOIN empleado.nacionalidad n ON e.id_nacionalidad = n.id_nacionalidad
    INNER JOIN empleado.genero g ON e.id_genero = g.id_genero
    INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil
    WHERE e.correo LIKE '%' || empleado_correo || '%';
END;

$$ LANGUAGE plpgsql;


SELECT *
FROM empleados_por_correo('gmail');

