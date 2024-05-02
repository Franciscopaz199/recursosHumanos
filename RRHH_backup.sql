
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
	id_usuario INT,
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

-- funciones almacenadas usando operadores de comparación

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
	FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g 
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec
		ON e.id_estado_civil = ec.id_estado_civil
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
    FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g 
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec 
		ON e.id_estado_civil = ec.id_estado_civil
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
    FROM empleado.empleado e INNER JOIN empleado.nacionalidad n
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec 
		ON e.id_estado_civil = ec.id_estado_civil
    WHERE g.nombre_genero = 'Masculino';

END; 
$$ LANGUAGE plpgsql;

SELECT * 
FROM consultar_empleados_genero_masculino();

-- 4. SP mostrar los empleados menores a 35 años y de género masculino
CREATE OR REPLACE FUNCTION consultar_empleados_menores_35_masculino()
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
    FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g 
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec 
		ON e.id_estado_civil = ec.id_estado_civil
    WHERE EXTRACT(YEAR FROM age(e.fecha_nacimiento)) < 35 AND g.nombre_genero = 'Masculino';

END; 
$$ LANGUAGE plpgsql;

SELECT * 
FROM consultar_empleados_menores_35_masculino();

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
    FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g 
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec
		ON e.id_estado_civil = ec.id_estado_civil
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
    FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g 
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec
		ON e.id_estado_civil = ec.id_estado_civil
		INNER JOIN empleado.empleado_grado_academico ega 
		ON e.codigo_empleado = ega.codigo_empleado
		INNER JOIN empleado.grado_academico ga
		ON ega.id_grado_academico = ga.id_grado_academico
		INNER JOIN empleado.institucion i 
		ON ega.id_institucion = i.id_institucion
    WHERE i.nombre_institucion = 'UNAH';

END; 
$$ LANGUAGE plpgsql;

SELECT * 
FROM consultar_empleados_egresados_unah();

-- 7. SP mostrar a los empleados con nacionalidad extranjera 

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
    FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec
		ON e.id_estado_civil = ec.id_estado_civil
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
    FROM empleado.empleado e INNER JOIN empleado.nacionalidad n
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g 
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec 
		ON e.id_estado_civil = ec.id_estado_civil
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
    FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g 
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec
		ON e.id_estado_civil = ec.id_estado_civil
		INNER JOIN empleado.contrato_laboral cl 
		ON e.codigo_empleado = cl.codigo_empleado
    WHERE cl.fecha_inicio = (SELECT MIN(ecl.fecha_inicio) FROM empleado.contrato_laboral ecl);

END; 
$$ LANGUAGE plpgsql;


SELECT * FROM consultar_empleado_mas_antiguo();

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
    FROM empleado.empleado e INNER JOIN empleado.nacionalidad n
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g 
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec
		ON e.id_estado_civil = ec.id_estado_civil
		INNER JOIN empleado.contrato_laboral cl 
		ON e.codigo_empleado = cl.codigo_empleado
    WHERE cl.fecha_inicio = (SELECT MAX(ecl.fecha_inicio) FROM empleado.contrato_laboral ecl);

END; 
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_empleado_mas_reciente();

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
    FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g 
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec 
		ON e.id_estado_civil = ec.id_estado_civil
		INNER JOIN empleado.contrato_laboral cl 
		ON e.codigo_empleado = cl.codigo_empleado
    WHERE cl.estado_contrato = TRUE;

END; 
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_empleados_contrato_activo();


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

SELECT * FROM consultar_empleados_proyecto_especifico(3);

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
    FROM proyecto.actividad a INNER JOIN proyecto.proyecto p
		ON a.id_proyecto = p.id_proyecto
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
    FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g 
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec
		ON e.id_estado_civil = ec.id_estado_civil
		INNER JOIN proceso.empleado_proceso ep
		ON e.codigo_empleado = ep.codigo_empleado
		INNER JOIN proceso.proceso pr 
		ON ep.id_proceso = pr.id_proceso
		INNER JOIN proceso.descripcion pd
		ON pr.id_descripcion = pd.id_descripcion
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
    FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g 
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec 
		ON e.id_estado_civil = ec.id_estado_civil
		INNER JOIN empleado.contrato_laboral cl 
		ON e.codigo_empleado = cl.codigo_empleado
		INNER JOIN empleado.departamento d 
		ON cl.id_departamento = d.id_departamento
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
    FROM empleado.departamento d LEFT JOIN empleado.empleado e
		ON e.codigo_empleado = d.codigo_empleado_jefe
		INNER JOIN empleado.nacionalidad n 
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g 
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec 
		ON e.id_estado_civil = ec.id_estado_civil;
END; 
$$ LANGUAGE plpgsql;
SELECT * FROM consultar_jefes_departamento();

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
    FROM proyecto.proyecto p INNER JOIN proyecto.dimension d 
		ON p.id_dimension = d.id_dimension
    WHERE d.id_dimension = dimension_id;

END; 
$$ LANGUAGE plpgsql;

SELECT *
FROM consultar_proyectos_dimension(3);


-- 18. Mostrar la cantidad de permisos compensatorios que se le han otorgado a un empleado por todos los proceso
	
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
			 INNER JOIN proceso.asistencia pa 
			 ON pa.id_empleado_proceso = ep.id_empleado_proceso 
			 INNER JOIN proceso.proceso pp 
			 ON ep.id_proceso = pp.id_proceso
			 INNER JOIN proceso.descripcion pd 
			 ON pp.id_descripcion = pd.id_descripcion
   		 WHERE ep.codigo_empleado = empleado_codigo 
         AND pa.estado = true
    GROUP BY pp.id_proceso
    ) subquery;
	
    RETURN cantidad_permisos_compensatorios;
	
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM consultar_permisos_compensatorios_empleado_process(2);

-- 19 Mostrar la cantidad de asistencias por cada proceso
CREATE OR REPLACE FUNCTION mostrar_asistencia_proceso()
RETURNS TABLE (
    nombre_proceso VARCHAR(100),
    fecha DATE,
    cantidad_asistentes BIGINT 
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        d.nombre_proceso,
        p.fecha,
        COUNT(ep.codigo_empleado) AS cantidad_asistentes
    FROM proceso.empleado_proceso ep JOIN empleado.empleado e
		ON ep.codigo_empleado = e.codigo_empleado
		JOIN proceso.proceso p
		ON ep.id_proceso = p.id_proceso
		JOIN proceso.descripcion d 
		ON p.id_descripcion = d.id_descripcion
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
    FROM proyecto.proyecto p JOIN proyecto.periodo_academico pa 
		ON p.id_periodo_academico = pa.id_periodo_academico
		JOIN proyecto.numero_periodo np 
		ON pa.id_numero_periodo = np.id_numero_periodo
    WHERE pa.id_periodo_academico = periodo_academico_id;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM mostrar_proyectos_periodo_academico(2);


-----------------------------------------------------------------------------------------------------------------
-- Funciones Almacenadas implementando case
-- Obtener el estado de un proyecto en base a la fecha actual Pendiente, En curso, Finalizado
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

-- Clasificar el periodo academico en base a la cantidad de proyectos Bajo, Medio, Alto
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


-- Obtener la prioridad de un proyecto en base al periodo academico Primer semestre, Segundo semestre
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

-- Obtener el progreso de un proyecto 0%, N%, 100%
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
    FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g 
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec 
		ON e.id_estado_civil = ec.id_estado_civil
		INNER JOIN proceso.empleado_proceso ep 
		ON e.codigo_empleado = ep.codigo_empleado
		INNER JOIN proceso.proceso pr
		ON ep.id_proceso = pr.id_proceso
		INNER JOIN proceso.descripcion pd 
		ON pr.id_descripcion = pd.id_descripcion
    WHERE pr.id_proceso = proceso_id;

END; 
$$ LANGUAGE plpgsql;

SELECT * 
FROM consultar_empleados_proceso_especifico(1);

-----------------------------------------------------------------------------------------------------------------
-- Funciones Almacenadas de búsqueda 
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
    FROM proyecto.proyecto pp INNER JOIN proyecto.dimension pd
		ON pp.id_dimension = pd.id_dimension
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
    FROM proyecto.proyecto pp INNER JOIN proyecto.dimension pd 
		ON pp.id_dimension = pd.id_dimension
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
    FROM proyecto.proyecto pp INNER JOIN proyecto.dimension pd 
		ON pp.id_dimension = pd.id_dimension
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
    FROM proyecto.proyecto pp INNER JOIN proyecto.dimension pd 
		ON pp.id_dimension = pd.id_dimension
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
    FROM proyecto.proyecto pp INNER JOIN proyecto.dimension pd 
		ON pp.id_dimension = pd.id_dimension
    	INNER JOIN proyecto.estado pe 
		ON pe.id_estado = pp.id_estado
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
    fecha_final DATE
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        pp.id_proyecto,
        pp.nombre_proyecto,
        pp.fecha_inicio,
        pp.fecha_fin
    FROM proyecto.proyecto pp
    WHERE pp.nombre_proyecto LIKE '%' || proyecto_nombre || '%';
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM proyectos_por_nombre('5');



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
    FROM proyecto.proyecto pp INNER JOIN proyecto.dimension pd 
		ON pp.id_dimension = pd.id_dimension
		INNER JOIN proyecto.estado pe 
		ON pe.id_estado = pp.id_estado
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
    FROM proyecto.proyecto pp	INNER JOIN proyecto.dimension pd 
		ON pp.id_dimension = pd.id_dimension
    WHERE pp.id_periodo_academico = periodo_id
    	AND pp.nombre_proyecto LIKE '%' || proyecto_nombre || '%';
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM proyectos_por_periodo_nombre(1, 'Proyecto');


-- 9. Obtener todos los empleados por nombre
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
    FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec 
		ON e.id_estado_civil = ec.id_estado_civil
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
    FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g 
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec 
		ON e.id_estado_civil = ec.id_estado_civil
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
    FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
		ON e.id_nacionalidad = n.id_nacionalidad
		INNER JOIN empleado.genero g 
		ON e.id_genero = g.id_genero
		INNER JOIN empleado.estado_civil ec 
		ON e.id_estado_civil = ec.id_estado_civil
    WHERE e.correo LIKE '%' || empleado_correo || '%';
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM empleados_por_correo('unah');

-----------------------------------------------------------------------------------------------------------------
-- Funciones Almacenadas usando IF……ELSE
-- 1. Mostrar todos los empleados por departamento si se pasa o todos los empleados si no se pasa el departamento
CREATE OR REPLACE FUNCTION empleados_por_departamento(departamento_id INT)
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
    IF departamento_id IS NOT NULL THEN
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
        FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
			ON e.id_nacionalidad = n.id_nacionalidad
			INNER JOIN empleado.genero g 
			ON e.id_genero = g.id_genero
			INNER JOIN empleado.estado_civil ec 
			ON e.id_estado_civil = ec.id_estado_civil
			INNER JOIN empleado.contrato_laboral cl 
			ON e.codigo_empleado = cl.codigo_empleado
			INNER JOIN empleado.departamento d
			ON cl.id_departamento = d.id_departamento
        WHERE d.id_departamento = departamento_id;
    ELSE
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
        FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
			ON e.id_nacionalidad = n.id_nacionalidad
			INNER JOIN empleado.genero g
			ON e.id_genero = g.id_genero
			INNER JOIN empleado.estado_civil ec 
			ON e.id_estado_civil = ec.id_estado_civil
			INNER JOIN empleado.contrato_laboral cl 
			ON e.codigo_empleado = cl.codigo_empleado
			INNER JOIN empleado.departamento d 
			ON cl.id_departamento = d.id_departamento;
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM empleados_por_departamento(2);


-- 2. Mostrar todos los empleados por nacionalidad si se pasa o todos los empleados si no se pasa la nacionalidad
CREATE OR REPLACE FUNCTION empleados_por_nacionalidad(nacionalidad_id INT)
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
    IF nacionalidad_id IS NOT NULL THEN
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
        FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
			ON e.id_nacionalidad = n.id_nacionalidad
			INNER JOIN empleado.genero g 
			ON e.id_genero = g.id_genero
			INNER JOIN empleado.estado_civil ec
			ON e.id_estado_civil = ec.id_estado_civil
        WHERE n.id_nacionalidad = nacionalidad_id;
    ELSE
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
        FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
			ON e.id_nacionalidad = n.id_nacionalidad
			INNER JOIN empleado.genero g 
			ON e.id_genero = g.id_genero
			INNER JOIN empleado.estado_civil ec 
			ON e.id_estado_civil = ec.id_estado_civil;
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM empleados_por_nacionalidad(1);


-- 3. Mostrar todos los empleados por genero si se pasa o todos los empleados si no se pasa el genero
CREATE OR REPLACE FUNCTION empleados_por_genero(genero_id INT)
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
    IF genero_id IS NOT NULL THEN
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
        FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
			ON e.id_nacionalidad = n.id_nacionalidad
			INNER JOIN empleado.genero g 
			ON e.id_genero = g.id_genero
			INNER JOIN empleado.estado_civil ec 
			ON e.id_estado_civil = ec.id_estado_civil
        WHERE g.id_genero = genero_id;
    ELSE
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
        FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
			ON e.id_nacionalidad = n.id_nacionalidad
			INNER JOIN empleado.genero g 
			ON e.id_genero = g.id_genero
			INNER JOIN empleado.estado_civil ec 
			ON e.id_estado_civil = ec.id_estado_civil;
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM empleados_por_genero(1);


-- 4. Mostrar todos los empleados por estado civil si se pasa o todos los empleados si no se pasa el estado civil
CREATE OR REPLACE FUNCTION empleados_por_estado_civil(estado_civil_id INT)
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
    IF estado_civil_id IS NOT NULL THEN
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
        FROM empleado.empleado e INNER JOIN empleado.nacionalidad n
			ON e.id_nacionalidad = n.id_nacionalidad
			INNER JOIN empleado.genero g 
			ON e.id_genero = g.id_genero
			INNER JOIN empleado.estado_civil ec 
			ON e.id_estado_civil = ec.id_estado_civil
        WHERE ec.id_estado_civil = estado_civil_id;
    ELSE
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
        FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
			ON e.id_nacionalidad = n.id_nacionalidad
			INNER JOIN empleado.genero g 
			ON e.id_genero = g.id_genero
			INNER JOIN empleado.estado_civil ec 
			ON e.id_estado_civil = ec.id_estado_civil;
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM empleados_por_estado_civil(1);


-- 5. Mostrar todos los empleados por estado de contrato si se pasa o todos los empleados si no se pasa el estado de contrato
CREATE OR REPLACE FUNCTION empleados_por_estado_contrato(contrato_estado BOOLEAN)
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
    IF contrato_estado IS NOT NULL THEN
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
        FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
			ON e.id_nacionalidad = n.id_nacionalidad
			INNER JOIN empleado.genero g 
			ON e.id_genero = g.id_genero
			INNER JOIN empleado.estado_civil ec 
			ON e.id_estado_civil = ec.id_estado_civil
			INNER JOIN empleado.contrato_laboral cl 
			ON e.codigo_empleado = cl.codigo_empleado
        WHERE cl.estado_contrato = contrato_estado;
    ELSE
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
        FROM empleado.empleado e INNER JOIN empleado.nacionalidad n 
			ON e.id_nacionalidad = n.id_nacionalidad
			INNER JOIN empleado.genero g 
			ON e.id_genero = g.id_genero
			INNER JOIN empleado.estado_civil ec 
			ON e.id_estado_civil = ec.id_estado_civil;
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM empleados_por_estado_contrato(TRUE);

-----------------------------------------------------------------------------------------------------------------
-- Funciones Almacenadas usando IF EXISTS
-- 1. Mostrar todos los empleados por departamento si existe el departamento pasado, de lo contrario mostrar todos los empleados
CREATE OR REPLACE FUNCTION empleados_por_departamento(departamento_id INT)
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
    IF EXISTS (
                SELECT 1 FROM empleado.departamento 
                WHERE id_departamento = departamento_id ) 
    THEN
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
        WHERE d.id_departamento = departamento_id;
    ELSE
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
        INNER JOIN empleado.departamento d ON cl.id_departamento = d.id_departamento;
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM empleados_por_departamento(1);

SELECT *
FROM empleados_por_departamento(10);

--2. Mostrar todos los proyectos por dimension si existe la dimension pasada, de lo contrario mostrar todos los proyectos
CREATE OR REPLACE FUNCTION proyectos_por_dimension(dimension_id INT)
RETURNS TABLE (
    id_proyecto INT,
    nombre_proyecto VARCHAR(60),
    fecha_inicio DATE,
    fecha_final DATE,
    nombre_dimension VARCHAR(60)
) AS $$
BEGIN
    IF EXISTS (
                SELECT 1 FROM proyecto.dimension 
                WHERE id_dimension = dimension_id ) 
    THEN
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
    ELSE
        RETURN QUERY 
        SELECT 
            p.id_proyecto,
            p.nombre_proyecto,
            p.fecha_inicio,
            p.fecha_fin,
            d.nombre_dimension
        FROM proyecto.proyecto p
        INNER JOIN proyecto.dimension d ON p.id_dimension = d.id_dimension;
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM proyectos_por_dimension(1);


SELECT *
FROM proyectos_por_dimension(20);

--3. Mostrar todos los empleados por nacionalidad si existe la nacionalidad pasada, de lo contrario mostrar todos los empleados
CREATE OR REPLACE FUNCTION empleados_por_nacionalidad(nacionalidad_id INT)
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
    IF EXISTS (
                SELECT 1 FROM empleado.nacionalidad 
                WHERE id_nacionalidad = nacionalidad_id ) 
    THEN
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
        WHERE n.id_nacionalidad = nacionalidad_id;
    ELSE
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
        INNER JOIN empleado.estado_civil ec ON e.id_estado_civil = ec.id_estado_civil;
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM empleados_por_nacionalidad(1);


SELECT *
FROM empleados_por_nacionalidad(3000);

-----------------------------------------------------------------------------------------------------------------
-- Funciones Almacenadas usando datos estadisticos: count, sum, avg, max, min, etc

-- Sp para mostrar el usuario con más cantidad de permisos compensatorios en un proceso determinado.
CREATE OR REPLACE FUNCTION empleado_mayor_cantidad_permiso (
	p_id_proceso int
)
RETURNS TABLE (
	nombres varchar(60),
	nombre_proceso varchar(100),
	cantidad_permiso bigint
) AS $$
BEGIN
    RETURN QUERY 
	SELECT ee.nombres, pd.nombre_proceso, COUNT(pa.id_empleado_proceso) AS cantidad_permiso
	FROM proceso.empleado_proceso pep INNER JOIN empleado.empleado ee   
		ON pep.codigo_empleado = ee.codigo_empleado
		INNER JOIN proceso.asistencia pa
		ON pep.id_empleado_proceso = pa.id_empleado_proceso
		INNER JOIN proceso.proceso prpr
		ON pep.id_proceso = prpr.id_proceso
		INNER JOIN proceso.descripcion pd
		ON prpr.id_descripcion = pd.id_descripcion
	WHERE prpr.id_proceso = p_id_proceso
	GROUP BY ee.nombres, pd.nombre_proceso
	ORDER BY cantidad_permiso DESC
	LIMIT 1;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM empleado_mayor_cantidad_permiso(1);


-- Sp para mostrar el promedio de compensatorios de un proceso determinado.

CREATE OR REPLACE FUNCTION promedio_compensatorio(
	p_id_proceso int
)
RETURNS TABLE (
	nombres varchar(60),
	nombre_proceso varchar(100),
	promedio numeric
) AS $$
BEGIN
    RETURN QUERY 
	SELECT ee.nombres, pd.nombre_proceso, AVG(prpr.cantidad_compensatoria) AS promedio_compensatorio
	FROM permiso.permiso pp INNER JOIN empleado.empleado ee   
		ON pp.codigo_empleado = ee.codigo_empleado
		INNER JOIN permiso.permiso_compensatorio_proceso ppc
		ON pp.id_permiso = ppc.id_permiso
		INNER JOIN proceso.proceso prpr
		ON ppc.id_proceso = prpr.id_proceso
		INNER JOIN proceso.descripcion pd
		ON prpr.id_descripcion = pd.id_descripcion
	WHERE ppc.id_proceso = p_id_proceso
	GROUP BY ee.nombres, pd.nombre_proceso;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM promedio_compensatorio(1);

-- Sp para mostrar la cantidad de permisos de cada tipo que ha solicitado un empleado.

CREATE OR REPLACE FUNCTION cantidad_permisos_empleado(
	p_codigo_empleado int
)
RETURNS TABLE (
	nombres varchar(60),
	nombre_tipo_proceso varchar(100),
	cantidad_permisos bigint
) AS $$
BEGIN
    RETURN QUERY 
	SELECT ee.nombres, ptp.nombre_tipo_permiso, COUNT(pp.id_permiso) AS cantidad_permiso
	FROM permiso.permiso pp INNER JOIN empleado.empleado ee   
		ON pp.codigo_empleado = ee.codigo_empleado
		INNER JOIN permiso.tipo_permiso ptp
		ON pp.id_tipo_permiso = ptp.id_tipo_permiso
	WHERE ee.codigo_empleado = p_codigo_empleado
	GROUP BY ee.nombres, ptp.nombre_tipo_permiso;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM cantidad_permisos_empleado(1);

-- Sp para mostrar la cantidad de proyectos en los que está trabajando un empleado Docente.
CREATE OR REPLACE FUNCTION cantidad_proyecto_empleado(
	_codigo_empleado INT
)
RETURNS TABLE (
	nombres varchar(60),
	cantidad_proyecto bigint
) AS $$
BEGIN
    RETURN QUERY 
	SELECT ee.nombres, COUNT(pep.id_proyecto) AS cantidad_proyecto
	FROM empleado.empleado ee INNER JOIN proyecto.empleado_proyecto pep    
		ON ee.codigo_empleado = pep.codigo_empleado
		INNER JOIN empleado.contrato_laboral ecl
		ON ee.codigo_empleado = ecl.codigo_empleado
		INNER JOIN empleado.puesto ep
		ON ecl.id_puesto = ep.id_puesto
	WHERE ep.descripcion_puesto = 'Docente' AND ee.codigo_empleado = _codigo_empleado
		AND ecl.estado_contrato = TRUE
	GROUP BY ee.nombres;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM cantidad_proyecto_empleado(1);

-- Sp para mostrar la cantidad la cantidad de proyectos que se han iniciado en un periodo académico en específico.

CREATE OR REPLACE FUNCTION cantidad_proyectos_periodo(
	p_id_periodo_academico int
)
RETURNS TABLE (
	nombre_periodo varchar(100),
	anio INT,
	cantidad_proyecto bigint
) AS $$
BEGIN
    RETURN QUERY 
	SELECT pnp.numero_periodo, ppa.anio, COUNT(prp.id_proyecto) AS cantidad_proyecto
	FROM proyecto.proyecto prp INNER JOIN proyecto.periodo_academico ppa
		ON prp.id_periodo_academico = ppa.id_periodo_academico
		INNER JOIN proyecto.numero_periodo pnp
		ON ppa.id_numero_periodo = pnp.id_numero_periodo
	WHERE ppa.id_periodo_academico = p_id_periodo_academico
	GROUP BY pnp.numero_periodo, ppa.anio;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM cantidad_proyectos_periodo(1);

-- Sp que muestre la cantidad de asistencias de un determinado empleado en un proceso determinado

CREATE OR REPLACE FUNCTION cantidad_asistencias_empleado_proceso(
    _codigo_empleado INT,
    _id_proceso INT
)
RETURNS TABLE (
	cantidad_asistencias BIGINT
) AS $$
BEGIN
	RETURN QUERY
	SELECT COUNT(pa.id_empleado_proceso) AS cantidad_asistencias
    FROM proceso.asistencia pa INNER JOIN proceso.empleado_proceso pep
		ON pa.id_empleado_proceso = pep.id_empleado_proceso
    WHERE pep.codigo_empleado = _codigo_empleado
    AND pep.id_proceso = _id_proceso;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM cantidad_asistencias_empleado_proceso(1, 1);

-- Sp para mostrar el nombre del Rol mas utilizado en un proceso determinado

CREATE OR REPLACE FUNCTION obtener_rol_mas_utilizado_en_proceso(id_proceso_ INT)
RETURNS VARCHAR(30) AS $$
DECLARE
    max_rol_id INT;
    max_rol_name VARCHAR(30);
BEGIN
    SELECT id_rol_proceso INTO max_rol_id
    FROM (
        SELECT id_rol_proceso, COUNT(*) AS cantidad_empleados
        FROM proceso.empleado_proceso
        WHERE id_proceso = id_proceso_
        GROUP BY id_rol_proceso
        ORDER BY COUNT(*) DESC
        LIMIT 1
    ) AS max_rol;

    SELECT descripcion_rol INTO max_rol_name
    FROM proceso.rol_proceso
    WHERE id_rol_proceso = max_rol_id;

    RETURN max_rol_name;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM obtener_rol_mas_utilizado_en_proceso(1);


-- Sp para mostrar el periodo académico con mas cantidad de proyectos

CREATE OR REPLACE FUNCTION periodo_mayor_cantidad_proyectos()
RETURNS TABLE (
	nombre_periodo varchar(100),
	anio INT,
	cantidad_proyecto bigint
) AS $$
BEGIN
    RETURN QUERY 
	SELECT pnp.numero_periodo, ppa.anio, COUNT(prp.id_proyecto) AS cantidad_proyecto
    FROM proyecto.proyecto prp INNER JOIN proyecto.periodo_academico ppa
        ON prp.id_periodo_academico = ppa.id_periodo_academico
        INNER JOIN proyecto.numero_periodo pnp
        ON ppa.id_numero_periodo = pnp.id_numero_periodo
    GROUP BY pnp.numero_periodo, ppa.anio
    ORDER BY cantidad_proyecto DESC
    LIMIT 1;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM periodo_mayor_cantidad_proyectos();

-- Sp que muestre la cantidad de permisos compensatorios que un empleado ha solicitado para un proceso en específico (count)

CREATE OR REPLACE FUNCTION cantidad_permisos_compensatorios_empleado_proceso(
    _codigo_empleado INT,
    _id_proceso INT
)
RETURNS TABLE (
    cantidad_permisos BIGINT
) AS $$
BEGIN
    RETURN QUERY
    SELECT COUNT(pp.id_permiso) AS cantidad_permisos
    FROM permiso.permiso pp INNER JOIN permiso.permiso_compensatorio_proceso pcp
        ON pp.id_permiso = pcp.id_permiso
    WHERE pp.codigo_empleado = _codigo_empleado
    AND pcp.id_proceso = _id_proceso;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM cantidad_permisos_compensatorios_empleado_proceso(1, 1);

-- Sp que muestre la cantidad de permisos compensatorios que un empleado ha solicitado para un proyecto en específico (count)

CREATE OR REPLACE FUNCTION cantidad_permisos_compensatorios_empleado_proyecto(
    _codigo_empleado INT,
    _id_proyecto INT
)
RETURNS TABLE (
    cantidad_permisos BIGINT
) AS $$
BEGIN
    RETURN QUERY
    SELECT COUNT(pp.id_permiso) AS cantidad_permisos
    FROM permiso.permiso pp INNER JOIN permiso.permiso_compensatorio_proyecto pcp
        ON pp.id_permiso = pcp.id_permiso
    WHERE pp.codigo_empleado = _codigo_empleado
    AND pcp.id_actividad_empleado_proyecto = _id_proyecto;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM cantidad_permisos_compensatorios_empleado_proyecto(1, 1);

-- Sp para mostrar la cantidad de permisos que tiene disponibles un empleado en un proceso determinado (permisos adquiridos - permisos solicitados)

CREATE OR REPLACE FUNCTION permisos_disponibles_empleado_proceso(
    _codigo_empleado INT,
    _id_proceso INT
)
RETURNS TABLE (
    cantidad_permisos BIGINT
) AS $$
BEGIN
    RETURN QUERY
    SELECT ( 
            (
            SELECT (COUNT(pa.id_empleado_proceso) * pp.cantidad_compensatoria) AS CompensatoriosObtenidos
            FROM proceso.empleado_proceso pep INNER JOIN proceso.proceso pp
                ON pep.id_proceso = pp.id_proceso
                LEFT JOIN proceso.asistencia pa
                ON pep.id_empleado_proceso = pa.id_empleado_proceso
            WHERE pep.id_proceso = _id_proceso AND pep.codigo_empleado = _codigo_empleado
            GROUP BY pp.cantidad_compensatoria
            )
            -
            (
            SELECT COUNT(ppcp.id_permiso) 
            FROM permiso.permiso pp INNER JOIN permiso.permiso_compensatorio_proceso ppcp
                ON pp.id_permiso = ppcp.id_permiso
            WHERE pp.codigo_empleado = _codigo_empleado AND ppcp.id_proceso = _id_proceso
            )
            ) AS cantidad_permisos;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM permisos_disponibles_empleado_proceso(1, 1);


-- Sp para mostrar la cantidad de permisos que tiene disponibles un empleado en un proyecto determinado (permisos adquiridos - permisos solicitados)

CREATE OR REPLACE FUNCTION permisos_disponibles_empleado_proyecto(
    _codigo_empleado INT,
    _id_proyecto INT
)
RETURNS TABLE (
    cantidad_permisos BIGINT
) AS $$
BEGIN
    RETURN QUERY
    SELECT ( 
            (
            SELECT SUM(paep.dias_compensatorios)
            FROM proyecto.actividad_empleado_proyecto paep INNER JOIN proyecto.empleado_proyecto pep
                ON paep.id_empleado_proyecto = pep.id_empleado_proyecto
            WHERE pep.codigo_empleado = _codigo_empleado AND pep.id_proyecto = _id_proyecto
            )
            -
            (
            SELECT COUNT(ppcp.id_permiso) 
            FROM permiso.permiso pp INNER JOIN permiso.permiso_compensatorio_proyecto ppcp
                ON pp.id_permiso = ppcp.id_permiso
                INNER JOIN proyecto.actividad_empleado_proyecto paep
                ON ppcp.id_actividad_empleado_proyecto = paep.id_actividad_empleado_proyecto
                INNER JOIN proyecto.empleado_proyecto pep
                ON paep.id_empleado_proyecto = pep.id_empleado_proyecto
            WHERE pp.codigo_empleado = _codigo_empleado AND pep.id_proyecto = _id_proyecto
            )
            ) AS cantidad_permisos;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM permisos_disponibles_empleado_proyecto(1, 1);

-- sp para mostrar la institucion donde se han graduado la mayor cantidad de empleados

CREATE OR REPLACE FUNCTION institucion_mayor_cantidad_empleados_graduados()
RETURNS TABLE (
    nombre_institucion VARCHAR(100),
    cantidad_empleados BIGINT
) AS $$
BEGIN
    RETURN QUERY
    SELECT i.nombre_institucion, COUNT(e.codigo_empleado) AS cantidad_empleados
    FROM empleado.empleado e INNER JOIN empleado.empleado_grado_academico ega
        ON e.codigo_empleado = ega.codigo_empleado
        INNER JOIN empleado.institucion i
        ON ega.id_institucion = i.id_institucion
    GROUP BY i.nombre_institucion
    ORDER BY COUNT(e.codigo_empleado) DESC
    LIMIT 1;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM institucion_mayor_cantidad_empleados_graduados();

-- Sp para mostrar el nombre del proyecto con mas cantidad de actividades

CREATE OR REPLACE FUNCTION proyecto_mayor_cantidad_actividades()
RETURNS TABLE (
    nombre_proyecto VARCHAR(100),
    cantidad_actividades BIGINT
) AS $$
BEGIN
    RETURN QUERY
    SELECT p.nombre_proyecto, COUNT(a.id_actividad) AS cantidad_actividades
    FROM proyecto.proyecto p INNER JOIN proyecto.actividad a
        ON p.id_proyecto = a.id_proyecto
    GROUP BY p.nombre_proyecto
    ORDER BY COUNT(a.id_actividad) DESC
    LIMIT 1;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM proyecto_mayor_cantidad_actividades();

--  Sp para mostrar la cantidad de empleados por departamento.
CREATE OR REPLACE FUNCTION cantidad_empleados_depa()
RETURNS TABLE (
    nombre_departamento VARCHAR(30), 
    cantidad_empleados BIGINT
) AS $$
BEGIN
    RETURN QUERY
    SELECT ed.nombre_departamento, COUNT(cl.id_contrato_laboral) AS cantidad_empleados
    FROM empleado.departamento as ed
    INNER JOIN empleado.contrato_laboral cl ON ed.id_departamento = cl.id_departamento
    GROUP BY ed.nombre_departamento;
END;
$$
LANGUAGE PLPGSQL;

SELECT * 
FROM cantidad_empleados_depa();


--- Sp para mostrar la sumatoria de los días, horas y minutos de cada tipo de permiso por un empleado en específico.(usando sum)

CREATE OR REPLACE FUNCTION sumatoria_permisos_empleado (
	_codigo_empleado INT
)
RETURNS TABLE(
	tipo_permiso VARCHAR, 
	dias_total BIGINT, 
	horas_total BIGINT, 
	minutos_total BIGINT
) AS
$$
BEGIN
    RETURN QUERY
    SELECT 
		   ptp.nombre_tipo_permiso,
		   SUM(pp.dias) AS dias_total,
		   SUM(pp.horas) AS horas_total,
		   SUM(pp.minutos) AS minutos_total
	FROM permiso.tipo_permiso ptp LEFT JOIN permiso.permiso pp
		ON pp.id_tipo_permiso = ptp.id_tipo_permiso
	WHERE pp.codigo_empleado = 1
	GROUP BY ptp.nombre_tipo_permiso;
END;
$$
LANGUAGE PLPGSQL;

SELECT * 
FROM sumatoria_permisos_empleado(2);

-- Sp para el empleado que más gane (salario)
CREATE OR REPLACE FUNCTION empleado_mayor_salario()
RETURNS TABLE (
    nombres VARCHAR(60),
    salario NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT e.nombres, cl.salario
    FROM empleado.empleado e INNER JOIN empleado.contrato_laboral cl
        ON e.codigo_empleado = cl.codigo_empleado
    ORDER BY cl.salario DESC
    LIMIT 1;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM empleado_mayor_salario();


-- Sp para el empleado que menos gane (salario)
CREATE OR REPLACE FUNCTION empleado_menor_salario()
RETURNS TABLE (
    nombres VARCHAR(60),
    salario NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT e.nombres, cl.salario
    FROM empleado.empleado e INNER JOIN empleado.contrato_laboral cl
        ON e.codigo_empleado = cl.codigo_empleado
    ORDER BY cl.salario ASC
    LIMIT 1;
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM empleado_menor_salario();

-- El promedio del salario de los empleados
CREATE OR REPLACE FUNCTION promedio_salario_empleados()
RETURNS NUMERIC AS $$
DECLARE
    promedio_salario NUMERIC;
BEGIN
    SELECT AVG(cl.salario) INTO promedio_salario
    FROM empleado.contrato_laboral cl;

    RETURN promedio_salario;
END;   
$$ LANGUAGE plpgsql;

SELECT * 
FROM promedio_salario_empleados();

-- Funcion para calcular la cantidad de dias que hay entre dos fechas
CREATE OR REPLACE FUNCTION calcular_dias(fecha_inicio DATE, fecha_final DATE)
RETURNS INT AS $$
DECLARE
    dias INT;
BEGIN
    dias := fecha_final - fecha_inicio;
    RETURN ABS(dias);
END;
$$ LANGUAGE plpgsql;

SELECT * 
FROM calcular_dias('2024-04-04', '2024-04-10');

-- Funcion para obtener el nombre y apellido del empleado concatenado y separados por un espacio
CREATE OR REPLACE FUNCTION obtener_nombre_completo(_codigo_empleado INT)
RETURNS VARCHAR AS $$
DECLARE
    nombre_completo VARCHAR;
BEGIN
    nombre_completo := (SELECT nombres || ' ' || apellidos 
                        FROM empleado.empleado 
                        WHERE codigo_empleado = _codigo_empleado);
    RETURN nombre_completo;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM obtener_nombre_completo(1);

-- Funcion para obtener la diferencia de horas entre dos horas
CREATE OR REPLACE FUNCTION calcular_diferencia_horas(hora_entrada TIME, hora_salida TIME)
RETURNS TIME AS $$
DECLARE
    diferencia TIME;
BEGIN
    diferencia := hora_salida - hora_entrada;
    RETURN diferencia;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM calcular_diferencia_horas('08:00:00', '12:00:00');

-- Funcion para obtener el nombre del rol de un empleado en un proyecto
CREATE OR REPLACE FUNCTION obtener_rol_proyecto(_codigo_empleado INT, _id_proyecto INT)
RETURNS VARCHAR AS $$
DECLARE
    rol VARCHAR;
BEGIN
    rol := (SELECT prp.nombre_rol 
			FROM proyecto.empleado_proyecto pep INNER JOIN proyecto.rol_proyecto prp
			ON pep.id_rol_proyecto = prp.id_rol_proyecto
			WHERE codigo_empleado = _codigo_empleado AND id_proyecto = _id_proyecto);
    RETURN rol;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM obtener_rol_proyecto(1, 1);

-- Funcion para obtener el nombre del rol de un empleado en un proceso
CREATE OR REPLACE FUNCTION obtener_rol_proceso(_codigo_empleado INT, _id_proceso INT)
RETURNS VARCHAR AS $$
DECLARE
    rol VARCHAR;
BEGIN
    rol := (SELECT prp.descripcion_rol 
            FROM proceso.empleado_proceso pep INNER JOIN proceso.rol_proceso prp
            ON pep.id_rol_proceso = prp.id_rol_proceso
            WHERE codigo_empleado = _codigo_empleado AND id_proceso = _id_proceso);
    RETURN rol;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM obtener_rol_proceso(1, 1);

-- Funcion para validar si un correo es valido
CREATE OR REPLACE FUNCTION validar_correo(correo VARCHAR)
RETURNS BOOLEAN AS $$
DECLARE
    es_valido BOOLEAN;
BEGIN
    es_valido := correo ~ '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RETURN es_valido;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM validar_correo('esdras@unah.hn');

-- Funcion para contar la cantidad de permisos que tiene un rol de usuario
CREATE OR REPLACE FUNCTION contar_permisos_rol(_id_rol INT)
RETURNS INT AS $$
DECLARE
    cantidad_permisos INT;
BEGIN
    cantidad_permisos := (SELECT COUNT(*) 
                          FROM usuario.rol_permiso_usuario 
                          WHERE id_rol = _id_rol);
    RETURN cantidad_permisos;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM contar_permisos_rol(1);

-- Funcion para validad si un numero de telefono es valido formato (9742-5325)
CREATE OR REPLACE FUNCTION validar_telefono(telefono VARCHAR)
RETURNS BOOLEAN AS $$
DECLARE
    es_valido BOOLEAN;
BEGIN
    es_valido := telefono ~ '^[0-9]{4}-[0-9]{4}$';
    RETURN es_valido;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM validar_telefono('9742-5325');

-- Funcion para obtener el nombre del operador telefonico
CREATE OR REPLACE FUNCTION obtener_operador_telefonico(_id_telefono INT)
RETURNS VARCHAR AS $$
DECLARE
    operador VARCHAR;
BEGIN
    operador := (SELECT nombre_operador 
                 FROM empleado.telefono t INNER JOIN empleado.operador_telefonico ot
                 ON t.id_operador_telefonico = ot.id_operador_telefonico
                 WHERE id_telefono = _id_telefono);
    RETURN operador;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM obtener_operador_telefonico(1);

-- Funcion para obtener hace cuantos dias se comenzo un proyecto
CREATE OR REPLACE FUNCTION calcular_dias_proyecto(_id_proyecto INT)
RETURNS INT AS $$
DECLARE
    dias INT;
BEGIN
    dias := (SELECT fecha_inicio - CURRENT_DATE
             FROM proyecto.proyecto
             WHERE id_proyecto = _id_proyecto);
    RETURN ABS(dias);
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM calcular_dias_proyecto(1);


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
    codigo_empleado INT,
    id_grado_academico INT,
    id_institucion INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    CONSTRAINT fk_auditoria_empleado_grado_academico_tipo_cambio FOREIGN KEY (id_tipo_cambio) 
        REFERENCES tipo_cambio (id_tipo_cambio),
    CONSTRAINT fk_auditoria_empleado_grado_academico_empleado FOREIGN KEY (codigo_empleado)
        REFERENCES empleado.empleado (codigo_empleado),
    CONSTRAINT fk_auditoria_empleado_grado_academico_grado_academico FOREIGN KEY (id_grado_academico)
        REFERENCES empleado.grado_academico (id_grado_academico),
    CONSTRAINT fk_auditoria_empleado_grado_academico_institucion FOREIGN KEY (id_institucion)
        REFERENCES empleado.institucion (id_institucion)
);

-- TRIGGER PARA AUDITORIA DE LA TABLA empleado.empleado_grado_academico
CREATE OR REPLACE FUNCTION auditoria_empleado_grado_academico()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO auditoria_empleado_grado_academico (codigo_empleado, id_grado_academico, id_institucion, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.codigo_empleado, NEW.id_grado_academico, NEW.id_institucion, 1, row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO auditoria_empleado_grado_academico (codigo_empleado, id_grado_academico, id_institucion, id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (NEW.codigo_empleado, NEW.id_grado_academico, NEW.id_institucion, 2, row_to_json(OLD), row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO auditoria_empleado_grado_academico (codigo_empleado, id_grado_academico, id_institucion, id_tipo_cambio, valores_anteriores)
        VALUES (OLD.codigo_empleado, OLD.id_grado_academico, OLD.id_institucion, 3, row_to_json(OLD));
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
    id_departamento INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    CONSTRAINT fk_auditoria_departamento_tipo_cambio FOREIGN KEY (id_tipo_cambio) 
        REFERENCES tipo_cambio (id_tipo_cambio),
    CONSTRAINT fk_auditoria_departamento_departamento FOREIGN KEY (id_departamento)
        REFERENCES empleado.departamento (id_departamento)
);

-- TRIGGER PARA AUDITORIA DE LA TABLA empleado.departamento
CREATE OR REPLACE FUNCTION auditoria_departamento()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO auditoria_departamento (id_departamento, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.id_departamento, 1, row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO auditoria_departamento (id_departamento, id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (NEW.id_departamento, 2, row_to_json(OLD), row_to_json(NEW));
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
    id_cambio_horario INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    CONSTRAINT fk_auditoria_cambio_horario_tipo_cambio FOREIGN KEY (id_tipo_cambio) 
        REFERENCES tipo_cambio (id_tipo_cambio),
    CONSTRAINT fk_auditoria_cambio_horario_cambio_horario FOREIGN KEY (id_cambio_horario)
        REFERENCES empleado.cambio_horario (id_cambio_horario)
);

-- TRIGGER PARA AUDITORIA DE LA TABLA empleado.cambio_horario
CREATE OR REPLACE FUNCTION auditoria_cambio_horario()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO auditoria_cambio_horario (id_cambio_horario, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.id_cambio_horario, 1, row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO auditoria_cambio_horario (id_cambio_horario, id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (NEW.id_cambio_horario, 2, row_to_json(OLD), row_to_json(NEW));
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
-- auditoria a la tabla proyecto.empleado_proyecto
CREATE TABLE auditoria_empleado_proyecto (
    id_registro SERIAL PRIMARY KEY,
    id_proyecto INT,
    codigo_empleado INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    CONSTRAINT fk_auditoria_empleado_proyecto_tipo_cambio FOREIGN KEY (id_tipo_cambio) 
        REFERENCES tipo_cambio (id_tipo_cambio),
    CONSTRAINT fk_auditoria_empleado_proyecto_proyecto FOREIGN KEY (id_proyecto)
        REFERENCES proyecto.proyecto (id_proyecto),
    CONSTRAINT fk_auditoria_empleado_proyecto_empleado FOREIGN KEY (codigo_empleado)
        REFERENCES empleado.empleado (codigo_empleado)
);

-- TRIGGER PARA AUDITORIA DE LA TABLA proyecto.empleado_proyecto
CREATE OR REPLACE FUNCTION auditoria_empleado_proyecto()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO auditoria_empleado_proyecto (id_proyecto, codigo_empleado, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.id_proyecto, NEW.codigo_empleado, 1, row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO auditoria_empleado_proyecto (id_proyecto, codigo_empleado, id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (NEW.id_proyecto, NEW.codigo_empleado, 2, row_to_json(OLD), row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO auditoria_empleado_proyecto (id_proyecto, codigo_empleado, id_tipo_cambio, valores_anteriores)
        VALUES (OLD.id_proyecto, OLD.codigo_empleado, 3, row_to_json(OLD));
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_auditoria_empleado_proyecto
AFTER INSERT OR UPDATE OR DELETE ON proyecto.empleado_proyecto
FOR EACH ROW
EXECUTE FUNCTION auditoria_empleado_proyecto();

------------------------------------------------------------------------------------------------------------------
-- auditoria a la tabla proyecto.actividad_empleado_proyecto
CREATE TABLE auditoria_actividad_empleado_proyecto (
    id_registro SERIAL PRIMARY KEY,
    id_actividad INT,
    id_empleado_proyecto INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    CONSTRAINT fk_auditoria_actividad_empleado_proyecto_tipo_cambio FOREIGN KEY (id_tipo_cambio) 
        REFERENCES tipo_cambio (id_tipo_cambio),
    CONSTRAINT fk_auditoria_actividad_empleado_proyecto_actividad FOREIGN KEY (id_actividad)
        REFERENCES proyecto.actividad (id_actividad),
    CONSTRAINT fk_auditoria_actividad_empleado_proyecto_empleado_proyecto FOREIGN KEY (id_empleado_proyecto)
        REFERENCES proyecto.empleado_proyecto (id_empleado_proyecto)
);

-- TRIGGER PARA AUDITORIA DE LA TABLA proyecto.actividad_empleado_proyecto
CREATE OR REPLACE FUNCTION auditoria_actividad_empleado_proyecto()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO auditoria_actividad_empleado_proyecto (id_actividad, id_empleado_proyecto, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.id_actividad, NEW.id_empleado_proyecto, 1, row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO auditoria_actividad_empleado_proyecto (id_actividad, id_empleado_proyecto, id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (NEW.id_actividad, NEW.id_empleado_proyecto, 2, row_to_json(OLD), row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO auditoria_actividad_empleado_proyecto (id_actividad, id_empleado_proyecto, id_tipo_cambio, valores_anteriores)
        VALUES (OLD.id_actividad, OLD.id_empleado_proyecto, 3, row_to_json(OLD));
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_auditoria_actividad_empleado_proyecto
AFTER INSERT OR UPDATE OR DELETE ON proyecto.actividad_empleado_proyecto
FOR EACH ROW
EXECUTE FUNCTION auditoria_actividad_empleado_proyecto();

------------------------------------------------------------------------------------------------------------------
-- auditoria a la tabla proceso.empleado_proceso
CREATE TABLE auditoria_empleado_proceso (
    id_registro SERIAL PRIMARY KEY,
    id_proceso INT,
    codigo_empleado INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    CONSTRAINT fk_auditoria_empleado_proceso_tipo_cambio FOREIGN KEY (id_tipo_cambio) 
        REFERENCES tipo_cambio (id_tipo_cambio),
    CONSTRAINT fk_auditoria_empleado_proceso_proceso FOREIGN KEY (id_proceso)
        REFERENCES proceso.proceso (id_proceso),
    CONSTRAINT fk_auditoria_empleado_proceso_empleado FOREIGN KEY (codigo_empleado)
        REFERENCES empleado.empleado (codigo_empleado)
);

-- TRIGGER PARA AUDITORIA DE LA TABLA proceso.empleado_proceso
CREATE OR REPLACE FUNCTION auditoria_empleado_proceso()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO auditoria_empleado_proceso (id_proceso, codigo_empleado, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.id_proceso, NEW.codigo_empleado, 1, row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO auditoria_empleado_proceso (id_proceso, codigo_empleado, id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (NEW.id_proceso, NEW.codigo_empleado, 2, row_to_json(OLD), row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO auditoria_empleado_proceso (id_proceso, codigo_empleado, id_tipo_cambio, valores_anteriores)
        VALUES (OLD.id_proceso, OLD.codigo_empleado, 3, row_to_json(OLD));
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_auditoria_empleado_proceso
AFTER INSERT OR UPDATE OR DELETE ON proceso.empleado_proceso
FOR EACH ROW
EXECUTE FUNCTION auditoria_empleado_proceso();

------------------------------------------------------------------------------------------------------------------
-- auditoria a la tabla proceso.asistencia
CREATE TABLE auditoria_asistencia (
    id_registro SERIAL PRIMARY KEY,
    id_empleado_proceso INT,
    id_nombre_prueba INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    CONSTRAINT fk_auditoria_asistencia_tipo_cambio FOREIGN KEY (id_tipo_cambio) 
        REFERENCES tipo_cambio (id_tipo_cambio),
    CONSTRAINT fk_auditoria_asistencia_empleado_proceso FOREIGN KEY (id_empleado_proceso)
        REFERENCES proceso.empleado_proceso (id_empleado_proceso),
    CONSTRAINT fk_auditoria_asistencia_nombre_prueba FOREIGN KEY (id_nombre_prueba)
        REFERENCES proceso.nombre_prueba (id_nombre_prueba)
);

-- TRIGGER PARA AUDITORIA DE LA TABLA proceso.asistencia
CREATE OR REPLACE FUNCTION auditoria_asistencia()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO auditoria_asistencia (id_empleado_proceso, id_nombre_prueba, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.id_empleado_proceso, NEW.id_nombre_prueba, 1, row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO auditoria_asistencia (id_empleado_proceso, id_nombre_prueba, id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (NEW.id_empleado_proceso, NEW.id_nombre_prueba, 2, row_to_json(OLD), row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO auditoria_asistencia (id_empleado_proceso, id_nombre_prueba, id_tipo_cambio, valores_anteriores)
        VALUES (OLD.id_empleado_proceso, OLD.id_nombre_prueba, 3, row_to_json(OLD));
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_auditoria_asistencia
AFTER INSERT OR UPDATE OR DELETE ON proceso.asistencia
FOR EACH ROW
EXECUTE FUNCTION auditoria_asistencia();

------------------------------------------------------------------------------------------------------------------
-- auditoria a la tabla permiso.permiso
CREATE TABLE auditoria_permiso (
    id_registro SERIAL PRIMARY KEY,
    codigo_empleado INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    CONSTRAINT fk_auditoria_permiso_tipo_cambio FOREIGN KEY (id_tipo_cambio) 
        REFERENCES tipo_cambio (id_tipo_cambio),
    CONSTRAINT fk_auditoria_permiso_empleado FOREIGN KEY (codigo_empleado)
        REFERENCES empleado.empleado (codigo_empleado)
);

-- TRIGGER PARA AUDITORIA DE LA TABLA permiso.permiso
CREATE OR REPLACE FUNCTION auditoria_permiso()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO auditoria_permiso (codigo_empleado, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.codigo_empleado, 1, row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO auditoria_permiso (codigo_empleado, valores_anteriores, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.codigo_empleado, 2, row_to_json(OLD), row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO auditoria_permiso (codigo_empleado, id_tipo_cambio, valores_anteriores)
        VALUES (OLD.codigo_empleado, 3, row_to_json(OLD));
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_auditoria_permiso
AFTER INSERT OR UPDATE OR DELETE ON permiso.permiso
FOR EACH ROW
EXECUTE FUNCTION auditoria_permiso();

------------------------------------------------------------------------------------------------------------------
-- auditoria a la tabla permiso.permiso_compensatorio_proceso
CREATE TABLE auditoria_permiso_compensatorio_proceso (
    id_registro SERIAL PRIMARY KEY,
    id_permiso INT,
    id_proceso INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    CONSTRAINT fk_auditoria_permiso_compensatorio_proceso_tipo_cambio FOREIGN KEY (id_tipo_cambio) 
        REFERENCES tipo_cambio (id_tipo_cambio),
    CONSTRAINT fk_auditoria_permiso_compensatorio_proceso_permiso FOREIGN KEY (id_permiso)
        REFERENCES permiso.permiso (id_permiso),
    CONSTRAINT fk_auditoria_permiso_compensatorio_proceso_proceso FOREIGN KEY (id_proceso)
        REFERENCES proceso.proceso (id_proceso)
);

-- TRIGGER PARA AUDITORIA DE LA TABLA permiso.permiso_compensatorio_proceso
CREATE OR REPLACE FUNCTION auditoria_permiso_compensatorio_proceso()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO auditoria_permiso_compensatorio_proceso (id_permiso, id_proceso, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.id_permiso, NEW.id_proceso, 1, row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO auditoria_permiso_compensatorio_proceso (id_permiso, id_proceso, id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (NEW.id_permiso, NEW.id_proceso, 2, row_to_json(OLD), row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO auditoria_permiso_compensatorio_proceso (id_permiso, id_proceso, id_tipo_cambio, valores_anteriores)
        VALUES (OLD.id_permiso, OLD.id_proceso, 3, row_to_json(OLD));
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_auditoria_permiso_compensatorio_proceso
AFTER INSERT OR UPDATE OR DELETE ON permiso.permiso_compensatorio_proceso
FOR EACH ROW
EXECUTE FUNCTION auditoria_permiso_compensatorio_proceso();

------------------------------------------------------------------------------------------------------------------
-- auditoria a la tabla permiso.permiso_compensatorio_proyecto
CREATE TABLE auditoria_permiso_compensatorio_proyecto (
    id_registro SERIAL PRIMARY KEY,
    id_permiso INT,
    id_actividad_empleado_proyecto INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    CONSTRAINT fk_auditoria_permiso_compensatorio_proyecto_tipo_cambio FOREIGN KEY (id_tipo_cambio) 
        REFERENCES tipo_cambio (id_tipo_cambio),
    CONSTRAINT fk_auditoria_permiso_compensatorio_proyecto_permiso FOREIGN KEY (id_permiso)
        REFERENCES permiso.permiso (id_permiso),
    CONSTRAINT fk_auditoria_permiso_compensatorio_proyecto_actividad_empleado_proyecto FOREIGN KEY (id_actividad_empleado_proyecto)
        REFERENCES proyecto.actividad_empleado_proyecto (id_actividad_empleado_proyecto)
);

-- TRIGGER PARA AUDITORIA DE LA TABLA permiso.permiso_compensatorio_proyecto
CREATE OR REPLACE FUNCTION auditoria_permiso_compensatorio_proyecto()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO auditoria_permiso_compensatorio_proyecto (id_permiso, id_actividad_empleado_proyecto, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.id_permiso, NEW.id_actividad_empleado_proyecto, 1, row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO auditoria_permiso_compensatorio_proyecto (id_permiso, id_actividad_empleado_proyecto, id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (NEW.id_permiso, NEW.id_actividad_empleado_proyecto, 2, row_to_json(OLD), row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO auditoria_permiso_compensatorio_proyecto (id_permiso, id_actividad_empleado_proyecto, id_tipo_cambio, valores_anteriores)
        VALUES (OLD.id_permiso, OLD.id_actividad_empleado_proyecto, 3, row_to_json(OLD));
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_auditoria_permiso_compensatorio_proyecto
AFTER INSERT OR UPDATE OR DELETE ON permiso.permiso_compensatorio_proyecto
FOR EACH ROW
EXECUTE FUNCTION auditoria_permiso_compensatorio_proyecto();


------------------------------------------------------------------------------------------------------------------
-- Triggers especiales
-- Trigger para validar que el correo sea valido
CREATE OR REPLACE FUNCTION validar_correo_tr()
RETURNS TRIGGER AS $$
BEGIN
    IF (validar_correo(NEW.correo)) THEN
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'El correo % no es valido', NEW.correo;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_validar_correo
BEFORE INSERT OR UPDATE ON empleado.empleado
FOR EACH ROW
EXECUTE FUNCTION validar_correo_tr();

-- Trigger para validar que el telefono sea valido
CREATE OR REPLACE FUNCTION validar_telefono_tr()
RETURNS TRIGGER AS $$
BEGIN
    IF (validar_telefono(NEW.telefono)) THEN
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'El telefono % no es valido', NEW.telefono;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_validar_telefono
BEFORE INSERT OR UPDATE ON empleado.telefono
FOR EACH ROW
EXECUTE FUNCTION validar_telefono_tr();

-- Trigger para validar que un permiso sea de tipo compensatorio antes de asignarlo a la tabla permiso_compensatorio_proceso
-- Funcion para validar si un permiso es de tipo compensatorio
CREATE OR REPLACE FUNCTION validar_permiso_compensatorio(_id_permiso INT)
RETURNS BOOLEAN AS $$
DECLARE
    es_compensatorio BOOLEAN;
BEGIN
    es_compensatorio := (SELECT id_tipo_permiso = 2 FROM permiso.permiso WHERE id_permiso = _id_permiso);
    RETURN es_compensatorio;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION validar_permiso_compensatorio_proceso_tr()
RETURNS TRIGGER AS $$
BEGIN
    IF (validar_permiso_compensatorio(NEW.id_permiso)) THEN
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'El permiso con id % no es de tipo compensatorio', NEW.id_permiso;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_validar_permiso_compensatorio_proceso
BEFORE INSERT OR UPDATE ON permiso.permiso_compensatorio_proceso
FOR EACH ROW
EXECUTE FUNCTION validar_permiso_compensatorio_proceso_tr();

-- Trigger para validar que un permiso sea de tipo compensatorio antes de asignarlo a la tabla permiso_compensatorio_proyecto
CREATE OR REPLACE FUNCTION validar_permiso_compensatorio_proyecto_tr()
RETURNS TRIGGER AS $$
BEGIN
    IF (validar_permiso_compensatorio(NEW.id_permiso)) THEN
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'El permiso con id % no es de tipo compensatorio', NEW.id_permiso;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_validar_permiso_compensatorio_proyecto
BEFORE INSERT OR UPDATE ON permiso.permiso_compensatorio_proyecto
FOR EACH ROW
EXECUTE FUNCTION validar_permiso_compensatorio_proyecto_tr();



-- 3 Insert de la tabla empleado.beneficio
INSERT INTO empleado.beneficio (descripcion_beneficio)
VALUES ('BENEFICIO 1');
INSERT INTO empleado.beneficio (descripcion_beneficio)
VALUES ('BENEFICIO 2');
INSERT INTO empleado.beneficio (descripcion_beneficio)
VALUES ('BENEFICIO 3');

-- 2 Insert de la tabla empleado.tipo_contrato
INSERT INTO empleado.tipo_contrato (descripcion_tipo_contrato)
VALUES ('Permanente');
INSERT INTO empleado.tipo_contrato (descripcion_tipo_contrato)
VALUES ('Por horas');

-- 3 Insert de la tabla empleado.puesto
INSERT INTO empleado.puesto (descripcion_puesto)
VALUES ('Supervisor');
INSERT INTO empleado.puesto (descripcion_puesto)
VALUES ('Operador');
INSERT INTO empleado.puesto (descripcion_puesto)
VALUES ('Jefe de departamento');

-- 3 Insert de la tabla empleado.grado_academico
INSERT INTO empleado.grado_academico (descripcion_grado_academico, especialidad)
VALUES ('Licenciatura', 'Informatica');
INSERT INTO empleado.grado_academico (descripcion_grado_academico, especialidad)
VALUES ('Maestria', 'Administracion');
INSERT INTO empleado.grado_academico (descripcion_grado_academico, especialidad)
VALUES ('Doctorado', 'Ingenieria');

-- 3 Insert de la tabla empleado.institucion
INSERT INTO empleado.institucion (nombre_institucion)
VALUES ('UNAH');
INSERT INTO empleado.institucion (nombre_institucion)
VALUES ('UNITEC');
INSERT INTO empleado.institucion (nombre_institucion)
VALUES ('UNICAH');

-- Insert de la tabla empleado.nacionalidad algunas de las nacionalidades en un solo insert
INSERT INTO empleado.nacionalidad (nombre_nacionalidad, pais)
VALUES
    ('Afgana', 'Afganistán'),
    ('Albanesa', 'Albania'),
    ('Alemana', 'Alemania'),
    ('Andorrana', 'Andorra'),
    ('Angoleña', 'Angola'),
    ('Antiguana y Barbudana', 'Antigua y Barbuda'),
    ('Argentina', 'Argentina'),
    ('Armenia', 'Armenia'),
    ('Arubeña', 'Aruba'),
    ('Australiana', 'Australia'),
    ('Austríaca', 'Austria'),
    ('Azerbaiyana', 'Azerbaiyán'),
    ('Bahameña', 'Bahamas'),
    ('Bahreiní', 'Baréin'),
    ('Bangladesí', 'Bangladés'),
    ('Barbadense', 'Barbados'),
    ('Belga', 'Bélgica'),
    ('Beliceña', 'Belice'),
    ('Beninesa', 'Benín'),
    ('Bermudeña', 'Bermudas'),
    ('Bielorrusa', 'Bielorrusia'),
    ('Birmana', 'Birmania'),
    ('Boliviana', 'Bolivia'),
    ('Bosnia', 'Bosnia y Herzegovina'),
    ('Botsuana', 'Botsuana'),
    ('Brasileña', 'Brasil'),
    ('Británica', 'Reino Unido'),
    ('Bruneana', 'Brunéi'),
    ('Búlgara', 'Bulgaria'),
    ('Burkinesa', 'Burkina Faso'),
    ('Burundesa', 'Burundi'),
    ('Butanesa', 'Bután'),
    ('Cabo Verdiana', 'Cabo Verde'),
    ('Camboyana', 'Camboya'),
    ('Camerunesa', 'Camerún'),
    ('Canadiense', 'Canadá'),
    ('Centroafricana', 'República Centroafricana'),
    ('Chadiana', 'Chad'),
    ('Checa', 'República Checa'),
    ('Chilena', 'Chile'),
    ('China', 'China'),
    ('Chipriota', 'Chipre'),
    ('Comorense', 'Comoras'),
    ('Congoleña', 'República del Congo'),
    ('Costarricense', 'Costa Rica'),
    ('Croata', 'Croacia'),
    ('Cubana', 'Cuba'),
    ('Danés', 'Dinamarca'),
    ('Dominicana', 'República Dominicana'),
    ('Ecuatoriana', 'Ecuador'),
    ('Egipcia', 'Egipto'),
    ('Emiratí', 'Emiratos Árabes Unidos'),
    ('Eritrea', 'Eritrea'),
    ('Eslovaca', 'Eslovaquia'),
    ('Eslovena', 'Eslovenia'),
    ('Española', 'España'),
    ('Estadounidense', 'Estados Unidos'),
    ('Estonia', 'Estonia'),
    ('Etiopía', 'Etiopía'),
    ('Feroesa', 'Islas Feroe'),
    ('Filipina', 'Filipinas'),
    ('Finlandesa', 'Finlandia'),
    ('Fiyiana', 'Fiyi'),
    ('Francesa', 'Francia'),
    ('Gabonesa', 'Gabón'),
    ('Gambiana', 'Gambia'),
    ('Georgiana', 'Georgia'),
    ('Ghanesa', 'Ghana'),
    ('Gibraltareña', 'Gibraltar'),
    ('Granadina', 'Granada'),
    ('Griega', 'Grecia'),
    ('Groenlandesa', 'Groenlandia'),
    ('Guatemalteca', 'Guatemala'),
    ('Guineana', 'Guinea'),
    ('Guineana Ecuatorial', 'Guinea Ecuatorial'),
    ('Guyanesa', 'Guyana'),
    ('Haitiana', 'Haití'),
    ('Hondureña', 'Honduras'),
    ('Hongkonesa', 'Hong Kong'),
    ('Húngara', 'Hungría'),
    ('India', 'India'),
    ('Indonesa', 'Indonesia'),
    ('Iraní', 'Irán'),
    ('Iraquí', 'Irak'),
    ('Irlandesa', 'Irlanda'),
    ('Islandesa', 'Islandia'),
    ('Israelí', 'Israel'),
    ('Italiana', 'Italia'),
    ('Jamaicana', 'Jamaica'),
    ('Japonesa', 'Japón'),
    ('Jordana', 'Jordania'),
    ('Kazaja', 'Kazajistán'),
    ('Keniata', 'Kenia'),
    ('Kirguisa', 'Kirguistán'),
    ('Kiribatiana', 'Kiribati'),
    ('Kuwaití', 'Kuwait'),
    ('Laosiana', 'Laos'),
    ('Lesotense', 'Lesoto'),
    ('Letona', 'Letonia'),
    ('Libanesa', 'Líbano'),
    ('Liberiana', 'Liberia'),
    ('Libia', 'Libia'),
    ('Liechtensteiniana', 'Liechtenstein'),
    ('Lituana', 'Lituania'),
    ('Luxemburguesa', 'Luxemburgo'),
    ('Macao', 'Macao'),
    ('Macedonia', 'Macedonia del Norte'),
    ('Malasia', 'Malasia'),
    ('Malauí', 'Malaui'),
    ('Maldiva', 'Maldivas'),
    ('Malgache', 'Madagascar'),
    ('Maliense', 'Malí'),
    ('Maltesa', 'Malta'),
    ('Marfileña', 'Costa de Marfil'),
    ('Marroquí', 'Marruecos'),
    ('Mauriciana', 'Mauricio'),
    ('Mauritana', 'Mauritania'),
    ('Mexicana', 'México'),
    ('Micronesia', 'Micronesia'),
    ('Moldava', 'Moldavia'),
    ('Monegasca', 'Mónaco'),
    ('Mongola', 'Mongolia'),
    ('Montenegrina', 'Montenegro'),
    ('Mozambiqueña', 'Mozambique'),
    ('Namibia', 'Namibia'),
    ('Nauruana', 'Nauru'),
    ('Neerlandesa', 'Países Bajos'),
    ('Neozelandesa', 'Nueva Zelanda'),
    ('Nepalí', 'Nepal'),
    ('Nicaragüense', 'Nicaragua'),
    ('Nigeriana', 'Nigeria'),
    ('Nortecoreana', 'Corea del Norte'),
    ('Noruega', 'Noruega'),
    ('Omana', 'Omán'),
    ('Pakistani', 'Pakistán'),
    ('Palaos', 'Palaos'),
    ('Palestina', 'Estado de Palestina'),
    ('Panameña', 'Panamá'),
    ('Papú', 'Papúa Nueva Guinea'),
    ('Paraguaya', 'Paraguay'),
    ('Peruana', 'Perú'),
    ('Polaca', 'Polonia'),
    ('Portuguesa', 'Portugal'),
    ('Qatarí', 'Catar'),
    ('Ruandesa', 'Ruanda'),
    ('Rumana', 'Rumania'),
    ('Rusa', 'Rusia'),
    ('Salomonense', 'Islas Salomón'),
    ('Salvadoreña', 'El Salvador'),
    ('Samoa', 'Samoa'),
    ('Sanmarinense', 'San Marino'),
    ('Santaluciana', 'Santa Lucía'),
    ('Sanvicentina', 'San Vicente y las Granadinas'),
    ('Santomense', 'Santo Tomé y Príncipe'),
    ('Saudí', 'Arabia Saudita'),
    ('Senegalesa', 'Senegal'),
    ('Serbia', 'Serbia'),
    ('Seychellense', 'Seychelles'),
    ('Sierra Leonesa', 'Sierra Leona'),
    ('Singapurense', 'Singapur'),
    ('Siria', 'Siria'),
    ('Somalí', 'Somalia'),
    ('Srilanka', 'Sri Lanka'),
    ('Sudafricana', 'Sudáfrica'),
    ('Sudanesa', 'Sudán'),
    ('Sueca', 'Suecia'),
    ('Suiza', 'Suiza'),
    ('Surinamesa', 'Surinam'),
    ('Esvatini', 'Esvatini'),
    ('Tailandesa', 'Tailandia'),
    ('Tanzana', 'Tanzania'),
    ('Tayika', 'Tayikistán'),
    ('Timorense', 'Timor Oriental'),
    ('Togolesa', 'Togo'),
    ('Tongana', 'Tonga'),
    ('Trinitense', 'Trinidad y Tobago'),
    ('Tunecina', 'Túnez'),
    ('Turca', 'Turquía'),
    ('Turkmenistana', 'Turkmenistán'),
    ('Tuvaluana', 'Tuvalu'),
    ('Ucraniana', 'Ucrania'),
    ('Ugandesa', 'Uganda'),
    ('Uruguaya', 'Uruguay'),
    ('Uzbeka', 'Uzbekistán'),
    ('Vanuatense', 'Vanuatu'),
    ('Vaticana', 'Ciudad del Vaticano'),
    ('Venezolana', 'Venezuela'),
    ('Vietnamita', 'Vietnam'),
    ('Yemení', 'Yemen'),
    ('Yibutiana', 'Yibuti'),
    ('Zambiana', 'Zambia'),
    ('Zimbabuense', 'Zimbabue');


-- 2 Insert de la tabla empleado.genero
INSERT INTO empleado.genero (nombre_genero)
VALUES ('Masculino');
INSERT INTO empleado.genero (nombre_genero)
VALUES ('Femenino');

-- 3 Insert de la tabla empleado.estado_civil
INSERT INTO empleado.estado_civil (descripcion_estado_civil)
VALUES ('Soltero');
INSERT INTO empleado.estado_civil (descripcion_estado_civil)
VALUES ('Casado');
INSERT INTO empleado.estado_civil (descripcion_estado_civil)
VALUES ('Divorciado');


-- 3 Insert de la tabla usuario.usuario
INSERT INTO usuario.usuario (nombre_usuario, email, password)
VALUES ('usuario1', 'user1@unah.hn', '123456');
INSERT INTO usuario.usuario (nombre_usuario, email, password)
VALUES ('usuario2', 'user2@unah.hn', '123456');
INSERT INTO usuario.usuario (nombre_usuario, email, password)
VALUES ('usuario3', 'unser3@unah.hn', '123456');

-- 3 Insert de la tabla usuario.rol
INSERT INTO usuario.rol (nombre_rol)
VALUES ('Administrador');
INSERT INTO usuario.rol (nombre_rol)
VALUES ('Usuario');
INSERT INTO usuario.rol (nombre_rol)
VALUES ('Invitado');

-- 3 Insert de la tabla usuario.permiso_usuario
INSERT INTO usuario.permiso_usuario (nombre_permiso)
VALUES ('Permiso 1');
INSERT INTO usuario.permiso_usuario (nombre_permiso)
VALUES ('Permiso 2');
INSERT INTO usuario.permiso_usuario (nombre_permiso)
VALUES ('Permiso 3');

-- 3 Insert de la tabla usuario.rol_permiso_usuario
INSERT INTO usuario.rol_permiso_usuario (id_rol, id_permiso_usuario)
VALUES (1, 1);
INSERT INTO usuario.rol_permiso_usuario (id_rol, id_permiso_usuario)
VALUES (2, 2);
INSERT INTO usuario.rol_permiso_usuario (id_rol, id_permiso_usuario)
VALUES (3, 3);

-- 3 Insert de la tabla usuario.usuario_rol
INSERT INTO usuario.usuario_rol (id_usuario, id_rol)
VALUES (1, 1);
INSERT INTO usuario.usuario_rol (id_usuario, id_rol)
VALUES (2, 2);
INSERT INTO usuario.usuario_rol (id_usuario, id_rol)
VALUES (3, 3);

-- 3 Insert de la tabla empleado.empleado
INSERT INTO empleado.empleado (codigo_empleado, id_nacionalidad, id_genero, id_estado_civil, id_usuario, dni, nombres, apellidos, fecha_nacimiento, correo, estado_empleado)
VALUES (1, 1, 1, 1, 1, '0801199900001', 'Juan', 'Perez', '1999-01-08', 'juan@unah.hn', TRUE);
INSERT INTO empleado.empleado (codigo_empleado, id_nacionalidad, id_genero, id_estado_civil, id_usuario, dni, nombres, apellidos, fecha_nacimiento, correo, estado_empleado)
VALUES (2, 2, 2, 2, 2, '0801199900002', 'Maria', 'Lopez', '1999-01-08', 'maria@unah.hn', TRUE);
INSERT INTO empleado.empleado (codigo_empleado, id_nacionalidad, id_genero, id_estado_civil, id_usuario, dni, nombres, apellidos, fecha_nacimiento, correo, estado_empleado)
VALUES (3, 3, 1, 3, 3, '0801199900003', 'Pedro', 'Ramirez', '1999-01-08', 'pedro@unah.hn', TRUE);

-- 2 Insert de la tabla empleado.operador_telefonico
INSERT INTO empleado.operador_telefonico (nombre_operador)
VALUES ('Claro');
INSERT INTO empleado.operador_telefonico (nombre_operador)
VALUES ('Tigo');

-- 2 Insert por cada empleado.empleado en la tabla empleado.telefono
INSERT INTO empleado.telefono (codigo_empleado, telefono, id_operador_telefonico)
VALUES (1, '9742-5325', 1);
INSERT INTO empleado.telefono (codigo_empleado, telefono, id_operador_telefonico)
VALUES (1, '9742-5326', 2);
INSERT INTO empleado.telefono (codigo_empleado, telefono, id_operador_telefonico)
VALUES (2, '9742-5327', 1);
INSERT INTO empleado.telefono (codigo_empleado, telefono, id_operador_telefonico)
VALUES (2, '9742-5328', 2);
INSERT INTO empleado.telefono (codigo_empleado, telefono, id_operador_telefonico)
VALUES (3, '9742-5329', 1);
INSERT INTO empleado.telefono (codigo_empleado, telefono, id_operador_telefonico)
VALUES (3, '9742-5330', 2);

-- 2 Insert por cada empleado.empleado en la tabla empleado.empleado_grado_academico
INSERT INTO empleado.empleado_grado_academico (codigo_empleado, id_grado_academico, id_institucion, anio_obtencion)
VALUES (1, 1, 1, '2018-01-01');
INSERT INTO empleado.empleado_grado_academico (codigo_empleado, id_grado_academico, id_institucion, anio_obtencion)
VALUES (1, 2, 2, '2019-01-01');
INSERT INTO empleado.empleado_grado_academico (codigo_empleado, id_grado_academico, id_institucion, anio_obtencion)
VALUES (2, 2, 2, '2018-01-01');
INSERT INTO empleado.empleado_grado_academico (codigo_empleado, id_grado_academico, id_institucion, anio_obtencion)
VALUES (2, 3, 3, '2019-01-01');

-- 1 Insert por cada empleado.empleado en la tabla empleado.departamento
INSERT INTO empleado.departamento (nombre_departamento, codigo_empleado_jefe)
VALUES ('Departamento 1', 1);
INSERT INTO empleado.departamento (nombre_departamento, codigo_empleado_jefe)
VALUES ('Departamento 2', 2);
INSERT INTO empleado.departamento (nombre_departamento, codigo_empleado_jefe)
VALUES ('Departamento 3', 3);

-- 1 Insert por cada empleado.empleado en la tabla empleado.contrato_laboral
INSERT INTO empleado.contrato_laboral (codigo_empleado, id_tipo_contrato, id_puesto, id_departamento, numero_contrato, fecha_inicio, fecha_finalizacion, salario, hora_entrada, hora_salida, estado_contrato)
VALUES (1, 1, 1, 1, '00000001', '2020-01-01', '2021-01-01', 10000.00, '08:00:00', '16:00:00', TRUE);
INSERT INTO empleado.contrato_laboral (codigo_empleado, id_tipo_contrato, id_puesto, id_departamento, numero_contrato, fecha_inicio, fecha_finalizacion, salario, hora_entrada, hora_salida, estado_contrato)
VALUES (2, 2, 2, 2, '00000002', '2020-01-01', '2021-01-01', 20000.00, '08:00:00', '16:00:00', TRUE);
INSERT INTO empleado.contrato_laboral (codigo_empleado, id_tipo_contrato, id_puesto, id_departamento, numero_contrato, fecha_inicio, fecha_finalizacion, salario, hora_entrada, hora_salida, estado_contrato)
VALUES (3, 1, 3, 3, '00000003', '2020-01-01', '2021-01-01', 30000.00, '08:00:00', '16:00:00', TRUE);

-- 1 Insert por cada empleado.contrato_laboral en la tabla empleado.contrato_laboral_beneficio
INSERT INTO empleado.contrato_laboral_beneficio (id_contrato_laboral, id_beneficio)
VALUES (1, 1);
INSERT INTO empleado.contrato_laboral_beneficio (id_contrato_laboral, id_beneficio)
VALUES (2, 2);
INSERT INTO empleado.contrato_laboral_beneficio (id_contrato_laboral, id_beneficio)
VALUES (3, 3);

-- 3 Insert por cada proyecto.numero_periodo en la tabla proyecto.numero_periodo
INSERT INTO proyecto.numero_periodo (numero_periodo)
VALUES ('1PAC');
INSERT INTO proyecto.numero_periodo (numero_periodo)
VALUES ('2PAC');
INSERT INTO proyecto.numero_periodo (numero_periodo)
VALUES ('3PAC');

-- 3 Insert por cada proyecto.numero_periodo en la tabla proyecto.periodo_academico
INSERT INTO proyecto.periodo_academico (id_numero_periodo, anio)
VALUES (1, 2020);
INSERT INTO proyecto.periodo_academico (id_numero_periodo, anio)
VALUES (2, 2020);
INSERT INTO proyecto.periodo_academico (id_numero_periodo, anio)
VALUES (3, 2020);
INSERT INTO proyecto.periodo_academico (id_numero_periodo, anio)
VALUES (1, 2021);
INSERT INTO proyecto.periodo_academico (id_numero_periodo, anio)
VALUES (2, 2021);
INSERT INTO proyecto.periodo_academico (id_numero_periodo, anio)
VALUES (3, 2021);
INSERT INTO proyecto.periodo_academico (id_numero_periodo, anio)
VALUES (1, 2022);
INSERT INTO proyecto.periodo_academico (id_numero_periodo, anio)
VALUES (2, 2022);
INSERT INTO proyecto.periodo_academico (id_numero_periodo, anio)
VALUES (3, 2022);

-- 1 Insert en la tabla empleado.cambio_horario por cada empleado.contrato_laboral
INSERT INTO empleado.cambio_horario (id_contrato_laboral, id_periodo_academico, nueva_hora_entrada, nueva_hora_salida, nota, fecha_cambio)
VALUES (1, 1, '07:00:00', '15:00:00', 'Cambio de horario', '2020-01-01');
INSERT INTO empleado.cambio_horario (id_contrato_laboral, id_periodo_academico, nueva_hora_entrada, nueva_hora_salida, nota, fecha_cambio)
VALUES (2, 2, '07:00:00', '15:00:00', 'Cambio de horario', '2020-01-01');
INSERT INTO empleado.cambio_horario (id_contrato_laboral, id_periodo_academico, nueva_hora_entrada, nueva_hora_salida, nota, fecha_cambio)
VALUES (3, 3, '07:00:00', '15:00:00', 'Cambio de horario', '2020-01-01');

-- 3 Insert por cada proyecto.dimension en la tabla proyecto.dimension
INSERT INTO proyecto.dimension (nombre_dimension)
VALUES ('Dimension 1');
INSERT INTO proyecto.dimension (nombre_dimension)
VALUES ('Dimension 2');
INSERT INTO proyecto.dimension (nombre_dimension)
VALUES ('Dimension 3');

-- 3 Insert por cada proyecto.tipo_proyecto en la tabla proyecto.tipo_proyecto
INSERT INTO proyecto.tipo_proyecto (nombre_tipo_proyecto)
VALUES ('Investigacion');
INSERT INTO proyecto.tipo_proyecto (nombre_tipo_proyecto)
VALUES ('Vinculacion');
INSERT INTO proyecto.tipo_proyecto (nombre_tipo_proyecto)
VALUES ('Comision');

-- 3 Insert por cada proyecto.estado en la tabla proyecto.estado
INSERT INTO proyecto.estado (nombre_estado)
VALUES ('En proceso');
INSERT INTO proyecto.estado (nombre_estado)
VALUES ('Finalizado');
INSERT INTO proyecto.estado (nombre_estado)
VALUES ('Cancelado');
INSERT INTO proyecto.estado (nombre_estado)
VALUES ('Activo');

-- 1 Insert por cada proyecto.periodo_academico en la tabla proyecto.proyecto
INSERT INTO proyecto.proyecto (id_tipo_proyecto, id_periodo_academico, id_departamento, id_dimension, id_estado, nombre_proyecto, fecha_inicio, fecha_fin)
VALUES (1, 1, 1, 1, 1, 'Proyecto 1', '2020-01-01', '2021-01-01');
INSERT INTO proyecto.proyecto (id_tipo_proyecto, id_periodo_academico, id_departamento, id_dimension, id_estado, nombre_proyecto, fecha_inicio, fecha_fin)
VALUES (2, 2, 2, 2, 2, 'Proyecto 2', '2020-01-01', '2021-01-01');
INSERT INTO proyecto.proyecto (id_tipo_proyecto, id_periodo_academico, id_departamento, id_dimension, id_estado, nombre_proyecto, fecha_inicio, fecha_fin)
VALUES (3, 3, 3, 3, 3, 'Proyecto 3', '2020-01-01', '2021-01-01');

-- 1 Insert por cada proyecto.proyecto en la tabla proyecto.actividad
INSERT INTO proyecto.actividad (id_proyecto, nombre_actividad, fecha_actividad)
VALUES (1, 'Actividad 1', '2020-01-01');
INSERT INTO proyecto.actividad (id_proyecto, nombre_actividad, fecha_actividad)
VALUES (2, 'Actividad 2', '2020-01-01');
INSERT INTO proyecto.actividad (id_proyecto, nombre_actividad, fecha_actividad)
VALUES (3, 'Actividad 3', '2020-01-01');

-- 3 Insert por cada proyecto.rol_proyecto en la tabla proyecto.rol_proyecto
INSERT INTO proyecto.rol_proyecto (nombre_rol)
VALUES ('Administrador');
INSERT INTO proyecto.rol_proyecto (nombre_rol)
VALUES ('Investigador');
INSERT INTO proyecto.rol_proyecto (nombre_rol)
VALUES ('Invitado');

-- 1 Insert por cada proyecto.proyecto en la tabla proyecto.empleado_proyecto
INSERT INTO proyecto.empleado_proyecto (id_rol_proyecto, id_proyecto, codigo_empleado)
VALUES (1, 1, 1);
INSERT INTO proyecto.empleado_proyecto (id_rol_proyecto, id_proyecto, codigo_empleado)
VALUES (2, 1, 2);
INSERT INTO proyecto.empleado_proyecto (id_rol_proyecto, id_proyecto, codigo_empleado)
VALUES (3, 1, 3);
INSERT INTO proyecto.empleado_proyecto (id_rol_proyecto, id_proyecto, codigo_empleado)
VALUES (1, 2, 1);
INSERT INTO proyecto.empleado_proyecto (id_rol_proyecto, id_proyecto, codigo_empleado)
VALUES (2, 2, 2);
INSERT INTO proyecto.empleado_proyecto (id_rol_proyecto, id_proyecto, codigo_empleado)
VALUES (3, 2, 3);
INSERT INTO proyecto.empleado_proyecto (id_rol_proyecto, id_proyecto, codigo_empleado)
VALUES (1, 3, 1);
INSERT INTO proyecto.empleado_proyecto (id_rol_proyecto, id_proyecto, codigo_empleado)
VALUES (2, 3, 2);
INSERT INTO proyecto.empleado_proyecto (id_rol_proyecto, id_proyecto, codigo_empleado)
VALUES (3, 3, 3);

-- 1 Insert por cada proyecto.actividad en la tabla proyecto.actividad_empleado_proyecto
INSERT INTO proyecto.actividad_empleado_proyecto (id_actividad, id_empleado_proyecto, id_estado, horas_trabajadas, dias_compensatorios, medio_verificacion)
VALUES (1, 1, 4, 8, 1, 'Medio 1');
INSERT INTO proyecto.actividad_empleado_proyecto (id_actividad, id_empleado_proyecto, id_estado, horas_trabajadas, dias_compensatorios, medio_verificacion)
VALUES (2, 2, 4, 8, 1, 'Medio 2');
INSERT INTO proyecto.actividad_empleado_proyecto (id_actividad, id_empleado_proyecto, id_estado, horas_trabajadas, dias_compensatorios, medio_verificacion)
VALUES (3, 3, 4, 8, 1, 'Medio 3');

-- 3 Insert por cada proceso.nombre_prueba en la tabla proceso.nombre_prueba
INSERT INTO proceso.nombre_prueba (nombre_prueba)
VALUES ('PAA');
INSERT INTO proceso.nombre_prueba (nombre_prueba)
VALUES ('PAM');
INSERT INTO proceso.nombre_prueba (nombre_prueba)
VALUES ('PCNCS');

-- 12 Insert por cada proceso.rol_proceso en la tabla proceso.rol_proceso
INSERT INTO proceso.rol_proceso (descripcion_rol)
VALUES ('Aplicador');
INSERT INTO proceso.rol_proceso (descripcion_rol)
VALUES ('Asistente');
INSERT INTO proceso.rol_proceso (descripcion_rol)
VALUES ('Director');
INSERT INTO proceso.rol_proceso (descripcion_rol)
VALUES ('Supervisor');
INSERT INTO proceso.rol_proceso (descripcion_rol)
VALUES ('Apoyo');
INSERT INTO proceso.rol_proceso (descripcion_rol)
VALUES ('Salud');
INSERT INTO proceso.rol_proceso (descripcion_rol)
VALUES ('Aseo');
INSERT INTO proceso.rol_proceso (descripcion_rol)
VALUES ('CORSA');
INSERT INTO proceso.rol_proceso (descripcion_rol)
VALUES ('Mantenimiento');
INSERT INTO proceso.rol_proceso (descripcion_rol)
VALUES ('Motorista');
INSERT INTO proceso.rol_proceso (descripcion_rol)
VALUES ('Logistica');

-- 3 Insert por cada proceso.descripcion en la tabla proceso.descripcion
INSERT INTO proceso.descripcion (nombre_proceso)
VALUES ('Proceso1');
INSERT INTO proceso.descripcion (nombre_proceso)
VALUES ('Proceso2');
INSERT INTO proceso.descripcion (nombre_proceso)
VALUES ('Proceso3');

-- 4 Insert por cada proceso.estado_proceso en la tabla proceso.estado_proceso
INSERT INTO proceso.estado_proceso (nombre_estado_proceso)
VALUES ('En proceso');
INSERT INTO proceso.estado_proceso (nombre_estado_proceso)
VALUES ('Finalizado');
INSERT INTO proceso.estado_proceso (nombre_estado_proceso)
VALUES ('Cancelado');
INSERT INTO proceso.estado_proceso (nombre_estado_proceso)
VALUES ('Inactivo');

-- 1 Insert por cada proceso.descripcion en la tabla proceso.proceso
INSERT INTO proceso.proceso (id_descripcion, id_estado_proceso, fecha, cantidad_compensatoria)
VALUES (1, 1, '2020-01-01', 1);
INSERT INTO proceso.proceso (id_descripcion, id_estado_proceso, fecha, cantidad_compensatoria)
VALUES (2, 2, '2020-01-01', 2);
INSERT INTO proceso.proceso (id_descripcion, id_estado_proceso, fecha, cantidad_compensatoria)
VALUES (3, 3, '2020-01-01', 3);

-- 1 Insert por cada proceso.proceso en la tabla proceso.empleado_proceso
INSERT INTO proceso.empleado_proceso (codigo_empleado, id_rol_proceso, id_proceso)
VALUES (1, 1, 1);
INSERT INTO proceso.empleado_proceso (codigo_empleado, id_rol_proceso, id_proceso)
VALUES (2, 2, 2);
INSERT INTO proceso.empleado_proceso (codigo_empleado, id_rol_proceso, id_proceso)
VALUES (3, 3, 3);

-- 1 Insert por cada proceso.nombre_prueba en la tabla proceso.asistencia
INSERT INTO proceso.asistencia (id_empleado_proceso, id_nombre_prueba, estado)
VALUES (1, 1, TRUE);
INSERT INTO proceso.asistencia (id_empleado_proceso, id_nombre_prueba, estado)
VALUES (2, 2, TRUE);
INSERT INTO proceso.asistencia (id_empleado_proceso, id_nombre_prueba, estado)
VALUES (3, 3, TRUE);

-- 4 Insert de la tabla permiso.tipo_permiso (Personal, Compensatorio, academico, administrativo)
INSERT INTO permiso.tipo_permiso (nombre_tipo_permiso)
VALUES ('Personal');
INSERT INTO permiso.tipo_permiso (nombre_tipo_permiso)
VALUES ('Compensatorio');
INSERT INTO permiso.tipo_permiso (nombre_tipo_permiso)
VALUES ('Academico');
INSERT INTO permiso.tipo_permiso (nombre_tipo_permiso)
VALUES ('Administrativo');

-- 1 Insert por cada permiso.tipo_permiso en la tabla permiso.permiso
INSERT INTO permiso.permiso (codigo_empleado, id_tipo_permiso, hora_recibido, fecha_ingreso, fecha_inicio, fecha_final, descripcion, dias, horas, minutos, observacion, respaldo, recibido_por)
VALUES (1, 2, '08:00:00', '2020-01-01', '2020-01-01', '2020-01-01', 'Descripcion', 1, 1, 1, 'Observacion', TRUE, 1);
INSERT INTO permiso.permiso (codigo_empleado, id_tipo_permiso, hora_recibido, fecha_ingreso, fecha_inicio, fecha_final, descripcion, dias, horas, minutos, observacion, respaldo, recibido_por)
VALUES (2, 2, '08:00:00', '2020-01-01', '2020-01-01', '2020-01-01', 'Descripcion', 1, 1, 1, 'Observacion', TRUE, 2);
INSERT INTO permiso.permiso (codigo_empleado, id_tipo_permiso, hora_recibido, fecha_ingreso, fecha_inicio, fecha_final, descripcion, dias, horas, minutos, observacion, respaldo, recibido_por)
VALUES (3, 2, '08:00:00', '2020-01-01', '2020-01-01', '2020-01-01', 'Descripcion', 1, 1, 1, 'Observacion', TRUE, 3);

-- 1 Insert por cada permiso.permiso en la tabla permiso.permiso_compensatorio_proceso
INSERT INTO permiso.permiso_compensatorio_proceso (id_permiso, id_proceso)
VALUES (1, 1);
INSERT INTO permiso.permiso_compensatorio_proceso (id_permiso, id_proceso)
VALUES (2, 2);
INSERT INTO permiso.permiso_compensatorio_proceso (id_permiso, id_proceso)
VALUES (3, 3);

-- 1 Insert por cada permiso.permiso en la tabla permiso.permiso_compensatorio_proyecto
INSERT INTO permiso.permiso_compensatorio_proyecto (id_permiso, id_actividad_empleado_proyecto)
VALUES (1, 1);
INSERT INTO permiso.permiso_compensatorio_proyecto (id_permiso, id_actividad_empleado_proyecto)
VALUES (2, 2);
INSERT INTO permiso.permiso_compensatorio_proyecto (id_permiso, id_actividad_empleado_proyecto)
VALUES (3, 3);


-- procedimientos almacenados basicos para las tablas en el archivo DDL_proyecto_final.sql


-- Funcionces almacenadas basicas para tabla empleado.beneficio

-- Funcion almacenada de insertar beneficio
CREATE FUNCTION insertar_beneficio (
    descripcion_beneficio VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.beneficio (descripcion_beneficio) 
    VALUES (descripcion_beneficio);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar beneficio
CREATE FUNCTION actualizar_beneficio(
    _id_beneficio INT,
    _descripcion_beneficio VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.beneficio 
    SET descripcion_beneficio = _descripcion_beneficio 
    WHERE id_beneficio = _id_beneficio;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_beneficio(
    _id_beneficio INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM empleado.beneficio 
    WHERE id_beneficio = _id_beneficio;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE OR REPLACE FUNCTION consultar_beneficio()
RETURNS TABLE (
    id_beneficio INT, 
    descripcion_beneficio VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		eb.id_beneficio, 
		eb.descripcion_beneficio 
    FROM empleado.beneficio eb;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_beneficio_id(
    _id_beneficio INT
)
RETURNS TABLE (
    id_beneficio INT, 
    descripcion_beneficio VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		eb.id_beneficio, 
		eb.descripcion_beneficio 
    FROM empleado.beneficio eb
    WHERE eb.id_beneficio = _id_beneficio;
END;
$$ LANGUAGE plpgsql;


-- Funcionces almacenadas basicas para tabla empleado.tipo_contrato

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_tipo_contrato (
    descripcion_tipo_contrato VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.tipo_contrato (descripcion_tipo_contrato) 
    VALUES (descripcion_tipo_contrato);
END;
$$ LANGUAGE plpgsql;



-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_tipo_contrato (
    _id_tipo_contrato INT,
    _descripcion_tipo_contrato VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.tipo_contrato 
    SET descripcion_tipo_contrato = _descripcion_tipo_contrato 
    WHERE id_tipo_contrato = _id_tipo_contrato;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_tipo_contrato (
    _id_tipo_contrato INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM empleado.tipo_contrato 
    WHERE id_tipo_contrato = _id_tipo_contrato;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_tipo_contratos()
RETURNS TABLE (
    id_tipo_contrato INT, 
    descripcion_tipo_contrato VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		etc.id_tipo_contrato, 
		etc.descripcion_tipo_contrato 
    FROM empleado.tipo_contrato etc;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_tipo_contrato_por_id(
    _id_tipo_contrato INT
)
RETURNS TABLE (
    id_tipo_contrato INT, 
    descripcion_tipo_contrato VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		etc.id_tipo_contrato, 
		etc.descripcion_tipo_contrato 
    FROM empleado.tipo_contrato etc
    WHERE etc.id_tipo_contrato = _id_tipo_contrato;
END;
$$ LANGUAGE plpgsql;


-- Funcionces almacenadas basicas para tabla empleado.puesto

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_puesto (
    descripcion_puesto VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.puesto (descripcion_puesto) 
    VALUES (descripcion_puesto);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_puesto (
    _id_puesto INT,
    _descripcion_puesto VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.puesto 
    SET descripcion_puesto = _descripcion_puesto 
    WHERE id_puesto = _id_puesto;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_puesto (
    _id_puesto INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM empleado.puesto 
    WHERE id_puesto = _id_puesto;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_puestos()
RETURNS TABLE (
    id_puesto INT, 
    descripcion_puesto VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ep.id_puesto, 
		ep.descripcion_puesto 
    FROM empleado.puesto ep;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_puesto_por_id(
    _id_puesto INT
)
RETURNS TABLE (
    id_puesto INT, 
    descripcion_puesto VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ep.id_puesto, 
		ep.descripcion_puesto 
    FROM empleado.puesto ep
    WHERE ep.id_puesto = _id_puesto;
END;
$$ LANGUAGE plpgsql;


-- Funcionces almacenadas basicas para tabla empleado.grado_academico

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_grado_academico (
    descripcion_grado_academico VARCHAR(30),
    especialidad VARCHAR(35)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.grado_academico (descripcion_grado_academico, especialidad) 
    VALUES (descripcion_grado_academico, especialidad);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_grado_academico (
    _id_grado_academico INT,
    _descripcion_grado_academico VARCHAR(30),
    _especialidad VARCHAR(35)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.grado_academico 
    SET descripcion_grado_academico = _descripcion_grado_academico, 
		especialidad = _especialidad
    WHERE id_grado_academico = _id_grado_academico;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_grado_academico (
    _id_grado_academico INT
)
RETURNS VOID AS $$
BEGIN
    DELETE
	FROM empleado.grado_academico 
    WHERE id_grado_academico = _id_grado_academico;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_grados_academicos()
RETURNS TABLE (
    id_grado_academico INT, 
    descripcion_grado_academico VARCHAR(30),
    especialidad VARCHAR(35)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ega.id_grado_academico, 
		ega.descripcion_grado_academico, 
		ega.especialidad
    FROM empleado.grado_academico ega;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_grado_academico_por_id(
    _id_grado_academico INT
)
RETURNS TABLE (
    id_grado_academico INT, 
    descripcion_grado_academico VARCHAR(30),
    especialidad VARCHAR(35)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ega.id_grado_academico, 
		ega.descripcion_grado_academico, 
		ega.especialidad
    FROM empleado.grado_academico ega
    WHERE ega.id_grado_academico = _id_grado_academico;
END;
$$ LANGUAGE plpgsql;


-- Funcionces almacenadas basicas para tabla empleado.institucion

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_institucion (
    nombre_institucion VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.institucion (nombre_institucion) 
    VALUES (nombre_institucion);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_institucion (
    _id_institucion INT,
    _nombre_institucion VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.institucion 
    SET nombre_institucion = _nombre_institucion 
    WHERE id_institucion = _id_institucion;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_institucion (
    _id_institucion INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM empleado.institucion 
    WHERE id_institucion = _id_institucion;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_instituciones()
RETURNS TABLE (
    id_institucion INT, 
    nombre_institucion VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ei.id_institucion, 
		ei.nombre_institucion 
    FROM empleado.institucion ei;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_instituciones();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_institucion_por_id(
    _id_institucion INT
)
RETURNS TABLE (
    id_institucion INT, 
    nombre_institucion VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
     SELECT 
		ei.id_institucion, 
		ei.nombre_institucion 
    FROM empleado.institucion ei
    WHERE ei.id_institucion = _id_institucion;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_institucion_por_id(1);

-- Funcioces almacenadas basicas para tabla empleado.nacionalidad

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_nacionalidad (
    nombre_nacionalidad VARCHAR(25),
    pais VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.nacionalidad (nombre_nacionalidad, pais) 
    VALUES (nombre_nacionalidad, pais);
END;
$$ LANGUAGE plpgsql;

SELECT insertar_nacionalidad ('Banquiteña', 'Republica Soberana e Independiente El Banquito');
SELECT insertar_nacionalidad ('Corpeña', 'Republica Corpeña');

-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_nacionalidad (
    _id_nacionalidad INT,
    _nombre_nacionalidad VARCHAR(25),
    _pais VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.nacionalidad 
    SET nombre_nacionalidad = _nombre_nacionalidad, 
		pais = _pais
    WHERE id_nacionalidad = _id_nacionalidad;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_nacionalidad (
    _id_nacionalidad INT
)
RETURNS VOID AS $$
BEGIN
    DELETE
	FROM empleado.nacionalidad 
    WHERE id_nacionalidad = _id_nacionalidad;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_nacionalidades()
RETURNS TABLE (
    id_nacionalidad INT, 
    nombre_nacionalidad VARCHAR(25),
    pais VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		en.id_nacionalidad, 
		en.nombre_nacionalidad, 
		en.pais
    FROM empleado.nacionalidad en;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_nacionalidades();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_nacionalidad_por_id (
   _id_nacionalidad INT
)
RETURNS TABLE (
    id_nacionalidad INT, 
    nombre_nacionalidad VARCHAR(25),
    pais VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		en.id_nacionalidad, 
		en.nombre_nacionalidad, 
		en.pais
    FROM empleado.nacionalidad en
    WHERE en.id_nacionalidad = _id_nacionalidad;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_nacionalidad_por_id (193);

-- Funcioces almacenadas basicas para tabla empleado.genero

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_genero (
    nombre_genero VARCHAR(10)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.genero (nombre_genero) 
    VALUES (nombre_genero);
END;
$$ LANGUAGE plpgsql;

SELECT insertar_genero ('Otros');

-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_genero (
    _id_genero INT,
    _nombre_genero VARCHAR(10)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.genero 
    SET nombre_genero = _nombre_genero 
    WHERE id_genero = _id_genero;
END;
$$ LANGUAGE plpgsql;

SELECT actualizar_genero (3,'no sabe');

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_genero (
    _id_genero INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM empleado.genero 
    WHERE id_genero = _id_genero;
END;
$$ LANGUAGE plpgsql;

SELECT eliminar_genero (4);

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_generos()
RETURNS TABLE (
    id_genero INT, 
    nombre_genero VARCHAR(10)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		eg.id_genero, 
		eg.nombre_genero 
    FROM empleado.genero eg;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_generos();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_genero_por_id(
    _id_genero INT
)
RETURNS TABLE (
    id_genero INT, 
    nombre_genero VARCHAR(10)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		eg.id_genero, 
		eg.nombre_genero 
    FROM empleado.genero eg
    WHERE eg.id_genero = _id_genero;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_genero_por_id(1);

-- Funciones almacenadas basicas para tabla empleado.estado_civil

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_estado_civil (
    descripcion_estado_civil VARCHAR(10)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.estado_civil (descripcion_estado_civil) 
    VALUES (descripcion_estado_civil);
END;
$$ LANGUAGE plpgsql;

SELECT insertar_estado_civil ('biudo');

-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_estado_civil (
    _id_estado_civil INT,
    _descripcion_estado_civil VARCHAR(10)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.estado_civil 
    SET descripcion_estado_civil = _descripcion_estado_civil 
    WHERE id_estado_civil = _id_estado_civil;
END;
$$ LANGUAGE plpgsql;

SELECT actualizar_estado_civil (4,'Uni libre');

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_estado_civil (
    _id_estado_civil INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM empleado.estado_civil 
    WHERE id_estado_civil = _id_estado_civil;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_estados_civiles()
RETURNS TABLE (
    id_estado_civil INT, 
    descripcion_estado_civil VARCHAR(10)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		eec.id_estado_civil, 
		eec.descripcion_estado_civil 
    FROM empleado.estado_civil eec;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_estados_civiles();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_estado_civil_por_id (
    _id_estado_civil INT
)
RETURNS TABLE (
    id_estado_civil INT, 
    descripcion_estado_civil VARCHAR(10)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		eec.id_estado_civil, 
		eec.descripcion_estado_civil 
    FROM empleado.estado_civil eec
    WHERE eec.id_estado_civil = _id_estado_civil;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_estado_civil_por_id (2);

-- Funciones almacenadas basicas para tabla usuario.usuario

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_usuario (
    nombre_usuario VARCHAR(15),
    email VARCHAR(50),
    password VARCHAR(50)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO usuario.usuario (nombre_usuario, email, password) 
    VALUES (nombre_usuario, email, password);
END;
$$ LANGUAGE plpgsql;

SELECT insertar_usuario('usuario5', 'unser5@unah.hn', '123456');
SELECT insertar_usuario('usuario6', 'unser6@unah.hn', '123456');

-- Funcion almacenada de actualizar
CREATE OR REPLACE FUNCTION actualizar_usuario(
    _id_usuario INT,
    _nombre_usuario VARCHAR(15),
    _email VARCHAR(50),
    _password VARCHAR(50)
)
RETURNS VOID AS $$
BEGIN
    UPDATE usuario.usuario 
    SET nombre_usuario = _nombre_usuario, 
		email = _email, 
		password = _password
    WHERE id_usuario = _id_usuario;
END;
$$ LANGUAGE plpgsql;

SELECT actualizar_usuario(6,'usuario7', 'User7@unah.hn', '123456');

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_usuario (
    _id_usuario INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM usuario.usuario 
    WHERE id_usuario = _id_usuario;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_usuarios()
RETURNS TABLE (
    id_usuario INT, 
    nombre_usuario VARCHAR(15),
    email VARCHAR(50),
    password VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		u.id_usuario, 
		u.nombre_usuario, 
		u.email, 
		u.password
    FROM usuario.usuario u;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_usuarios();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_usuario_por_id (
    _id_usuario INT
)
RETURNS TABLE (
    id_usuario INT, 
    nombre_usuario VARCHAR(15),
    email VARCHAR(50),
    password VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		u.id_usuario, 
		u.nombre_usuario, 
		u.email, 
		u.password
    FROM usuario.usuario u
    WHERE u.id_usuario = _id_usuario;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_usuario_por_id (2);
-- Funciones almacenadas basicas para tabla usuario.rol

-- Funcion almacenada de insertar

CREATE FUNCTION insertar_rol (
    nombre_rol VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO usuario.rol (nombre_rol) 
    VALUES (nombre_rol);
END;
$$ LANGUAGE plpgsql;

SELECT insertar_rol ('sudo');
SELECT insertar_rol ('sudo2');

-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_rol (
    _id_rol INT,
    _nombre_rol VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    UPDATE usuario.rol 
    SET nombre_rol = _nombre_rol 
    WHERE id_rol = _id_rol;
END;
$$ LANGUAGE plpgsql;

SELECT actualizar_rol (5,'SuperAdmin');

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_rol (
    _id_rol INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM usuario.rol 
    WHERE id_rol = _id_rol;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos los roles
CREATE FUNCTION consultar_roles ()
RETURNS TABLE (
    id_rol INT, 
    nombre_rol VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ur.id_rol, 
		ur.nombre_rol 
    FROM usuario.rol ur;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_roles ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_rol_por_id (
    _id_rol INT
)
RETURNS TABLE (
    id_rol INT, 
    nombre_rol VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ur.id_rol, 
		ur.nombre_rol 
    FROM usuario.rol ur
    WHERE ur.id_rol = _id_rol;
END;
$$ LANGUAGE plpgsql;

SELECT consultar_rol_por_id (2);

-- Funciones almacenadas basicas para tabla usuario.permiso_usuario

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_permiso_usuario (
    nombre_permiso VARCHAR(70)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO usuario.permiso_usuario (nombre_permiso) 
    VALUES (nombre_permiso);
END;
$$ LANGUAGE plpgsql;

SELECT insertar_permiso_usuario ('Permiso 5');

-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_permiso_usuario (
    _id_permiso_usuario INT,
    _nombre_permiso VARCHAR(70)
)
RETURNS VOID AS $$
BEGIN
    UPDATE usuario.permiso_usuario 
    SET nombre_permiso = _nombre_permiso 
    WHERE id_permiso_usuario = _id_permiso_usuario;
END;
$$ LANGUAGE plpgsql;

SELECT actualizar_permiso_usuario (4,'Permiso A4');

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_permiso_usuario (
    _id_permiso_usuario INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM usuario.permiso_usuario 
    WHERE id_permiso_usuario = _id_permiso_usuario;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_permisos_usuarios ()
RETURNS TABLE (
    id_permiso_usuario INT, 
    nombre_permiso VARCHAR(70)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		up.id_permiso_usuario, 
		up.nombre_permiso 
    FROM usuario.permiso_usuario up;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_permisos_usuarios ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_permiso_usuario_por_id (
    _id_permiso_usuario INT
)
RETURNS TABLE (
    id_permiso_usuario INT, 
    nombre_permiso VARCHAR(70)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		up.id_permiso_usuario, 
		up.nombre_permiso 
    FROM usuario.permiso_usuario up
    WHERE up.id_permiso_usuario = _id_permiso_usuario;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_permiso_usuario_por_id (2);

-- Funciones almacenadas basicas para tabla usuario.rol_permiso_usuario

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_rol_permiso_usuario (
    id_rol INT,
    id_permiso_usuario INT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO usuario.rol_permiso_usuario (id_rol, id_permiso_usuario) 
    VALUES (id_rol, id_permiso_usuario);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_rol_permiso_usuario (
    _id_permiso_usuario INT,
    _id_rol INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM usuario.rol_permiso_usuario 
    WHERE id_permiso_usuario = _id_permiso_usuario AND id_rol = _id_rol;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_roles_permisos_usuarios ()
RETURNS TABLE (
    id_rol INT, 
    id_permiso_usuario INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		rpu.id_rol, 
		rpu.id_permiso_usuario
    FROM usuario.rol_permiso_usuario rpu;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_roles_permisos_usuarios ();

-- Funciones almacenadas basicas para tabla usuario.usuario_rol

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_usuario_rol (
    id_usuario INT,
    id_rol INT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO usuario.usuario_rol (id_usuario, id_rol) 
    VALUES (id_usuario, id_rol);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_usuario_rol (
    _id_usuario INT,
    _id_rol INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM usuario.usuario_rol 
    WHERE id_usuario = _id_usuario AND id_rol = _id_rol;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_usuarios_roles ()
RETURNS TABLE (
    id_usuario INT, 
    id_rol INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ur.id_usuario,
		ur.id_rol
    FROM usuario.usuario_rol ur;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_usuarios_roles ();

-- Funciones almacenadas basicas para tabla empleado.empleado

-- Funcion almacenada de insertar
CREATE OR REPLACE FUNCTION insertar_empleado (
    codigo_empleado INT,
    id_nacionalidad INT,
    id_genero INT,
    id_estado_civil INT,
    id_usuario INT,
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.empleado (codigo_empleado, id_nacionalidad, id_genero, 
								   id_estado_civil, id_usuario, dni, nombres, apellidos,
								   fecha_nacimiento, correo) 
    VALUES (codigo_empleado, id_nacionalidad, id_genero, id_estado_civil, 
			id_usuario, dni, nombres, apellidos, fecha_nacimiento, correo);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_empleado (
    _codigo_empleado INT,
    _id_nacionalidad INT,
    _id_genero INT,
    _id_estado_civil INT,
    _id_usuario INT,
    _dni VARCHAR(15),
    _nombres VARCHAR(60),
    _apellidos VARCHAR(60),
    _fecha_nacimiento DATE,
    _correo VARCHAR(50)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.empleado 
    SET id_nacionalidad = _id_nacionalidad, 
		id_genero = _id_genero, 
		id_estado_civil = _id_estado_civil, 
		id_usuario = _id_usuario, 
		dni = _dni,
		nombres = _nombres, 
		apellidos = _apellidos,
		fecha_nacimiento = _fecha_nacimiento, 
		correo = _correo
    WHERE codigo_empleado = _codigo_empleado;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_empleado (
    _codigo_empleado INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM empleado.empleado 
    WHERE codigo_empleado = _codigo_empleado;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_empleados()
RETURNS TABLE (
    codigo_empleado INT, 
    id_nacionalidad INT,
    id_genero INT,
    id_estado_civil INT,
    id_usuario INT,
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50),
    estado_empleado BOOLEAN
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		e.codigo_empleado, 
		e.id_nacionalidad,
		e.id_genero, 
		e.id_estado_civil, 
		e.id_usuario,
		e.dni,
		e.nombres,
		e.apellidos, 
		e.fecha_nacimiento, 
		e.correo, 
		e.estado_empleado
    FROM empleado.empleado e;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_empleados();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_empleado_por_id (
    _codigo_empleado INT
)
RETURNS TABLE (
    codigo_empleado INT, 
    id_nacionalidad INT,
    id_genero INT,
    id_estado_civil INT,
    id_usuario INT,
    dni VARCHAR(15),
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento DATE,
    correo VARCHAR(50),
    estado_empleado BOOLEAN
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		e.codigo_empleado, 
		e.id_nacionalidad,
		e.id_genero, 
		e.id_estado_civil, 
		e.id_usuario,
		e.dni,
		e.nombres,
		e.apellidos, 
		e.fecha_nacimiento, 
		e.correo, 
		e.estado_empleado
    FROM empleado.empleado e
    WHERE e.codigo_empleado = _codigo_empleado;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_empleado_por_id (2);

-- Funciones almacenadas basicas para tabla empleado.operador_telefonico

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_operador_telefonico (
    nombre_operador VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.operador_telefonico (nombre_operador) 
    VALUES (nombre_operador);
END;
$$ LANGUAGE plpgsql;

SELECT insertar_operador_telefonico ('Digicell');
SELECT insertar_operador_telefonico ('Movistar');

-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_operador_telefonico(
    _id_operador_telefonico INT,
    _nombre_operador VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.operador_telefonico 
    SET nombre_operador = _nombre_operador 
    WHERE id_operador_telefonico = _id_operador_telefonico;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_operador_telefonico (
    _id_operador_telefonico INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM empleado.operador_telefonico 
    WHERE id_operador_telefonico = _id_operador_telefonico;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_operadores_telefonicos()
RETURNS TABLE (
    id_operador_telefonico INT, 
    nombre_operador VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		eot.id_operador_telefonico, 
		eot.nombre_operador 
    FROM empleado.operador_telefonico eot;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_operadores_telefonicos();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_operador_telefonico_por_id (
    _id_operador_telefonico INT
)
RETURNS TABLE (
    id_operador_telefonico INT, 
    nombre_operador VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		eot.id_operador_telefonico, 
		eot.nombre_operador 
    FROM empleado.operador_telefonico eot
    WHERE eot.id_operador_telefonico = _id_operador_telefonico;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_operador_telefonico_por_id (2);

-- Funciones almacenadas basicas para tabla empleado.telefono

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_telefono (
    id_operador_telefonico INT,
    codigo_empleado INT,
    telefono VARCHAR(9)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.telefono (id_operador_telefonico, codigo_empleado, telefono) 
    VALUES (id_operador_telefonico, codigo_empleado, telefono);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_telefono (
    _id_telefono INT,
    _id_operador_telefonico INT,
    _codigo_empleado INT,
    _telefono VARCHAR(9)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.telefono 
    SET id_operador_telefonico = _id_operador_telefonico,
		codigo_empleado = _codigo_empleado, 
		telefono = _telefono
    WHERE id_telefono = _id_telefono;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_telefono (
    _id_telefono INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM empleado.telefono 
    WHERE id_telefono = _id_telefono;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_telefonos ()
RETURNS TABLE (
    id_telefono INT, 
    id_operador_telefonico INT,
    codigo_empleado INT,
    telefono VARCHAR(9)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		et.id_telefono, 
		et.id_operador_telefonico, 
		et.codigo_empleado,
		et.telefono
    FROM 
		empleado.telefono et;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_telefonos ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_telefono_por_id (
    _id_telefono INT
)
RETURNS TABLE (
    id_telefono INT, 
    id_operador_telefonico INT,
    codigo_empleado INT,
    telefono VARCHAR(9)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		et.id_telefono, 
		et.id_operador_telefonico, 
		et.codigo_empleado,
		et.telefono
    FROM 
		empleado.telefono et
    WHERE et.id_telefono = _id_telefono;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla empleado.empleado_grado_academico

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_empleado_grado_academico (
    codigo_empleado INT,
    id_grado_academico INT,
    id_institucion INT,
    anio_obtencion DATE
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.empleado_grado_academico (codigo_empleado, id_grado_academico,
												   id_institucion, anio_obtencion) 
    VALUES (codigo_empleado, id_grado_academico, id_institucion, anio_obtencion);
END;
$$ LANGUAGE plpgsql;

SELECT insertar_empleado_grado_academico (1, 2, 3, '2019-01-01');

-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_empleado_grado_academico (
    _codigo_empleado INT, -- llave primaria
    _id_grado_academico INT, -- llave primaria
    _id_institucion INT, -- llave primaria
    _anio_obtencion DATE
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.empleado_grado_academico 
    SET anio_obtencion = _anio_obtencion
    WHERE codigo_empleado = _codigo_empleado 
		AND id_grado_academico = _id_grado_academico 
		AND id_institucion = _id_institucion;
END;
$$ LANGUAGE plpgsql;

SELECT actualizar_empleado_grado_academico (1, 2, 3, '2018-01-01');

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_empleado_grado_academico (
    _codigo_empleado INT, -- llave primaria
    _id_grado_academico INT, -- llave primaria
    _id_institucion INT -- llave primaria
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM empleado.empleado_grado_academico 
    WHERE codigo_empleado = _codigo_empleado 
		AND id_grado_academico = _id_grado_academico 
		AND id_institucion = _id_institucion;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_empleados_grados_academicos ()
RETURNS TABLE (
    codigo_empleado INT, 
    id_grado_academico INT,
    id_institucion INT,
    anio_obtencion DATE
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ega.codigo_empleado, 
		ega.id_grado_academico, 
		ega.id_institucion, 
		ega.anio_obtencion
    FROM empleado.empleado_grado_academico ega;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_empleados_grados_academicos ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_empleado_grado_academico_por_id (
    _codigo_empleado INT, -- llave primaria
    _id_grado_academico INT, -- llave primaria
    _id_institucion INT -- llave primaria
)
RETURNS TABLE (
    codigo_empleado INT, 
    id_grado_academico INT,
    id_institucion INT,
    anio_obtencion DATE
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ega.codigo_empleado, 
		ega.id_grado_academico, 
		ega.id_institucion, 
		ega.anio_obtencion
    FROM empleado.empleado_grado_academico ega
    WHERE ega.codigo_empleado = _codigo_empleado 
		AND ega.id_grado_academico = _id_grado_academico 
		AND ega.id_institucion = _id_institucion;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_empleado_grado_academico_por_id (2,2,2);

-- Funciones almacenadas basicas para tabla empleado.departamento

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_departamento (
    nombre_departamento VARCHAR(30),
    codigo_empleado_jefe INT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.departamento (nombre_departamento, codigo_empleado_jefe) 
    VALUES (nombre_departamento, codigo_empleado_jefe);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_departamento (
    _id_departamento INT,
    _nombre_departamento VARCHAR(30),
    _codigo_empleado_jefe INT
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.departamento 
    SET nombre_departamento = _nombre_departamento,
		codigo_empleado_jefe = _codigo_empleado_jefe
    WHERE id_departamento = _id_departamento;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_departamento (
    _id_departamento INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM empleado.departamento 
    WHERE id_departamento = _id_departamento;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_departamentos ()
RETURNS TABLE (
    id_departamento INT, 
    nombre_departamento VARCHAR(30),
    codigo_empleado_jefe INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ed.id_departamento, 
		ed.nombre_departamento, 
		ed.codigo_empleado_jefe
    FROM empleado.departamento ed;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_departamentos ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_departamento_por_id(
    _id_departamento INT
)
RETURNS TABLE (
    id_departamento INT, 
    nombre_departamento VARCHAR(30),
    codigo_empleado_jefe INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ed.id_departamento, 
		ed.nombre_departamento, 
		ed.codigo_empleado_jefe
    FROM empleado.departamento ed
    WHERE ed.id_departamento = _id_departamento;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla empleado.contrato_laboral

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_contrato_laboral (
    codigo_empleado INT,
	id_tipo_contrato INT,
	id_puesto INT,
	id_departamento INT,
	numero_contrato VARCHAR(9),
	fecha_inicio DATE,
	fecha_finalizacion DATE,
	salario DECIMAL(9,2),
	hora_entrada TIME,
	hora_salida TIME,
	estado_contrato BOOLEAN
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.contrato_laboral (codigo_empleado, id_tipo_contrato, id_puesto, 
										   id_departamento, numero_contrato, 
										   fecha_inicio, fecha_finalizacion, salario, hora_entrada, 
										   hora_salida, estado_contrato) 
    VALUES (codigo_empleado, id_tipo_contrato, id_puesto, id_departamento, 
			numero_contrato, fecha_inicio, fecha_finalizacion,
			salario, hora_entrada, hora_salida, estado_contrato);
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_contrato_laboral (
    _id_contrato_laboral INT,
    _codigo_empleado INT,
	_id_tipo_contrato INT,
	_id_puesto INT,
	_id_departamento INT,
	_numero_contrato VARCHAR(9),
	_fecha_inicio DATE,
	_fecha_finalizacion DATE,
	_salario DECIMAL(9,2),
	_hora_entrada TIME,
	_hora_salida TIME,
	_estado_contrato BOOLEAN
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.contrato_laboral 
    SET codigo_empleado = _codigo_empleado,
		id_tipo_contrato = _id_tipo_contrato, 
		id_puesto = _id_puesto,
		id_departamento = _id_departamento,  
		numero_contrato = _numero_contrato,
		fecha_inicio = _fecha_inicio, 
		fecha_finalizacion = _fecha_finalizacion,
		salario = _salario, 
		hora_entrada = _hora_entrada,
		hora_salida = _hora_salida, 
		estado_contrato = _estado_contrato
    WHERE id_contrato_laboral = _id_contrato_laboral;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_contrato_laboral (
    _id_contrato_laboral INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM empleado.contrato_laboral 
    WHERE id_contrato_laboral = _id_contrato_laboral;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_contratos_laborale ()
RETURNS TABLE (
    id_contrato_laboral INT, 
    codigo_empleado INT,
    id_tipo_contrato INT,
    id_puesto INT,
    id_departamento INT,
    numero_contrato VARCHAR(9),
    fecha_inicio DATE,
    fecha_finalizacion DATE,
    salario NUMERIC(9,2),
    hora_entrada TIME,
    hora_salida TIME,
    estado_contrato BOOLEAN
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
			ecl.id_contrato_laboral, 
			ecl.codigo_empleado, 
			ecl.id_tipo_contrato,
			ecl.id_puesto, 
			ecl.id_departamento,
			ecl.numero_contrato,
			ecl.fecha_inicio, 
			ecl.fecha_finalizacion, 
			ecl.salario,
			ecl.hora_entrada, 
			ecl.hora_salida,
			ecl.estado_contrato
    FROM empleado.contrato_laboral ecl;
END;
$$ LANGUAGE plpgsql;



-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_contrato_laboral_por_id (
    _id_contrato_laboral INT
)
RETURNS TABLE (
    id_contrato_laboral INT, 
    codigo_empleado INT,
    id_tipo_contrato INT,
    id_puesto INT,
    id_departamento INT,
    numero_contrato VARCHAR(9),
    fecha_inicio DATE,
    fecha_finalizacion DATE,
    salario DECIMAL(9,2),
    hora_entrada TIME,
    hora_salida TIME,
    estado_contrato BOOLEAN
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
			ecl.id_contrato_laboral, 
			ecl.codigo_empleado, 
			ecl.id_tipo_contrato,
			ecl.id_puesto, 
			ecl.id_departamento,
			ecl.numero_contrato,
			ecl.fecha_inicio, 
			ecl.fecha_finalizacion, 
			ecl.salario,
			ecl.hora_entrada, 
			ecl.hora_salida,
			ecl.estado_contrato
    FROM empleado.contrato_laboral ecl
    WHERE ecl.id_contrato_laboral = _id_contrato_laboral;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_contrato_laboral_por_id (2);

-- Funciones almacenadas basicas para tabla empleado.contrato_laboral_beneficio

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_contrato_laboral_beneficio (
    id_contrato_laboral INT,
    id_beneficio INT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.contrato_laboral_beneficio (id_contrato_laboral, id_beneficio) 
    VALUES (id_contrato_laboral, id_beneficio);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_contrato_laboral_beneficio (
    _id_contrato_laboral INT,
    _id_beneficio INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
    FROM empleado.contrato_laboral_beneficio 
    WHERE id_contrato_laboral = _id_contrato_laboral AND id_beneficio = _id_beneficio;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_contratos_laborales_beneficios ()
RETURNS TABLE (
    id_contrato_laboral INT, 
    id_beneficio INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        eclb.id_contrato_laboral, 
        eclb.id_beneficio
    FROM empleado.contrato_laboral_beneficio eclb;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_contratos_laborales_beneficios ();


-- Funciones almacenadas basicas para tabla proyecto.numero_periodo

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_numero_periodo (
    numero_periodo VARCHAR(15)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO proyecto.numero_periodo (numero_periodo) 
    VALUES (numero_periodo);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_numero_periodo (
    _id_numero_periodo INT,
    _numero_periodo VARCHAR(15)
)
RETURNS VOID AS $$
BEGIN
    UPDATE proyecto.numero_periodo 
    SET numero_periodo = _numero_periodo 
    WHERE id_numero_periodo = _id_numero_periodo;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_numero_periodo (
    _id_numero_periodo INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM proyecto.numero_periodo 
    WHERE id_numero_periodo = _id_numero_periodo;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_numeros_periodos()
RETURNS TABLE (
    id_numero_periodo INT, 
    numero_periodo VARCHAR(15)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pnp.id_numero_periodo, 
		pnp.numero_periodo 
    FROM proyecto.numero_periodo pnp;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_numeros_periodos();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_numero_periodo_por_id (
    _id_numero_periodo INT
)
RETURNS TABLE (
    id_numero_periodo INT, 
    numero_periodo VARCHAR(15)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pnp.id_numero_periodo, 
		pnp.numero_periodo 
    FROM proyecto.numero_periodo pnp
    WHERE pnp.id_numero_periodo = _id_numero_periodo;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla proyecto.periodo_academico

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_periodo_academico (
    id_numero_periodo INT,
    anio INT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO proyecto.periodo_academico (id_numero_periodo, anio) 
    VALUES (id_numero_periodo, anio);
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_periodo_academico (
    _id_periodo_academico INT,
    _id_numero_periodo INT,
    _anio INT
)
RETURNS VOID AS $$
BEGIN
    UPDATE proyecto.periodo_academico 
    SET id_numero_periodo = _id_numero_periodo,
		anio = _anio
    WHERE id_periodo_academico = _id_periodo_academico;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_periodo_academico (
    _id_periodo_academico INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM proyecto.periodo_academico 
    WHERE id_periodo_academico = _id_periodo_academico;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_periodos_academicos ()
RETURNS TABLE (
    id_periodo_academico INT, 
    id_numero_periodo INT,
    anio INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ppa.id_periodo_academico, 
		ppa.id_numero_periodo, 
		ppa.anio 
    FROM proyecto.periodo_academico ppa;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_periodos_academicos ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_periodo_academico_por_id (
    _id_periodo_academico INT
)
RETURNS TABLE (
    id_periodo_academico INT, 
    id_numero_periodo INT,
    anio INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ppa.id_periodo_academico, 
		ppa.id_numero_periodo, 
		ppa.anio 
    FROM proyecto.periodo_academico ppa
    WHERE ppa.id_periodo_academico = _id_periodo_academico;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla empleado.cambio_horario

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_cambio_horario (
    id_contrato_laboral INT,
	id_periodo_academico INT,
	nueva_hora_entrada TIME,
	nueva_hora_salida TIME,
	nota VARCHAR(350),
	fecha_cambio DATE
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.cambio_horario (id_contrato_laboral, id_periodo_academico, 
										 nueva_hora_entrada, nueva_hora_salida, nota, fecha_cambio) 
    VALUES (id_contrato_laboral, id_periodo_academico, nueva_hora_entrada, 
			nueva_hora_salida, nota, fecha_cambio);
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_cambio_horario (
    _id_cambio_horario INT,
    _id_contrato_laboral INT,
    _id_periodo_academico INT,
    _nueva_hora_entrada TIME,
    _nueva_hora_salida TIME,
    _nota VARCHAR(350),
    _fecha_cambio DATE
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.cambio_horario 
    SET id_contrato_laboral = _id_contrato_laboral,
		id_periodo_academico = _id_periodo_academico,
		nueva_hora_entrada = _nueva_hora_entrada,
		nueva_hora_salida = _nueva_hora_salida, 
		nota = _nota,
		fecha_cambio = _fecha_cambio
    WHERE id_cambio_horario = _id_cambio_horario;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_cambio_horario (
    _id_cambio_horario INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM empleado.cambio_horario 
    WHERE id_cambio_horario = _id_cambio_horario;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_cambios_horarios ()
RETURNS TABLE (
    id_cambio_horario INT, 
    id_contrato_laboral INT,
    id_periodo_academico INT,
    nueva_hora_entrada TIME,
    nueva_hora_salida TIME,
    nota VARCHAR(350),
    fecha_cambio DATE
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ech.id_cambio_horario, 
		ech.id_contrato_laboral, 
		ech.id_periodo_academico,
		ech.nueva_hora_entrada,
		ech.nueva_hora_salida, 
		ech.nota, 
		ech.fecha_cambio
    FROM 
		empleado.cambio_horario ech;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_cambios_horarios ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_cambio_horario_por_id (
    _id_cambio_horario INT
)
RETURNS TABLE (
    id_cambio_horario INT, 
    id_contrato_laboral INT,
    id_periodo_academico INT,
    nueva_hora_entrada TIME,
    nueva_hora_salida TIME,
    nota VARCHAR(350),
    fecha_cambio DATE
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ech.id_cambio_horario, 
		ech.id_contrato_laboral, 
		ech.id_periodo_academico,
		ech.nueva_hora_entrada,
		ech.nueva_hora_salida, 
		ech.nota, 
		ech.fecha_cambio
    FROM 
		empleado.cambio_horario ech
    WHERE ech.id_cambio_horario = _id_cambio_horario;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla proyecto.dimension

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_dimension (
    nombre_dimension VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO proyecto.dimension (nombre_dimension) 
    VALUES (nombre_dimension);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_dimension(
    _id_dimension INT,
    _nombre_dimension VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    UPDATE proyecto.dimension 
    SET nombre_dimension = _nombre_dimension 
    WHERE id_dimension = _id_dimension;
END;
$$ LANGUAGE plpgsql;



-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_dimension (
    _id_dimension INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM proyecto.dimension 
    WHERE id_dimension = _id_dimension;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_dimensiones()
RETURNS TABLE (
    id_dimension INT, 
    nombre_dimension VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pd.id_dimension, 
		pd.nombre_dimension 
    FROM proyecto.dimension pd;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_dimensiones();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_dimension_por_id (
    _id_dimension INT
)
RETURNS TABLE (
    id_dimension INT, 
    nombre_dimension VARCHAR(30)
) AS $$
BEGIN
     RETURN QUERY 
    SELECT 
		pd.id_dimension, 
		pd.nombre_dimension 
    FROM proyecto.dimension pd
    WHERE pd.id_dimension = _id_dimension;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla proyecto.tipo_proyecto

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_tipo_proyecto (
    nombre_tipo_proyecto VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO proyecto.tipo_proyecto (nombre_tipo_proyecto) 
    VALUES (nombre_tipo_proyecto);
END;
$$ LANGUAGE plpgsql;

SELECT insertar_tipo_proyecto ('Investigativo');

-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_tipo_proyecto (
    _id_tipo_proyecto INT,
    _nombre_tipo_proyecto VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    UPDATE proyecto.tipo_proyecto 
    SET nombre_tipo_proyecto = _nombre_tipo_proyecto 
    WHERE id_tipo_proyecto = _id_tipo_proyecto;
END;
$$ LANGUAGE plpgsql;

SELECT actualizar_tipo_proyecto (4,'Investigaciones');

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_tipo_proyecto (
    _id_tipo_proyecto INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proyecto.tipo_proyecto 
    WHERE id_tipo_proyecto = _id_tipo_proyecto;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_tipos_proyectos ()
RETURNS TABLE (
    id_tipo_proyecto INT, 
    nombre_tipo_proyecto VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ptp.id_tipo_proyecto,
		ptp.nombre_tipo_proyecto 
    FROM proyecto.tipo_proyecto ptp;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_tipos_proyectos ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_tipo_proyecto_por_id (
    _id_tipo_proyecto INT
)
RETURNS TABLE (
    id_tipo_proyecto INT, 
    nombre_tipo_proyecto VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ptp.id_tipo_proyecto,
		ptp.nombre_tipo_proyecto 
    FROM proyecto.tipo_proyecto ptp
    WHERE ptp.id_tipo_proyecto = _id_tipo_proyecto;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla proyecto.estado

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_estado (
    nombre_estado VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO proyecto.estado (nombre_estado) 
    VALUES (nombre_estado);
END;
$$ LANGUAGE plpgsql;

SELECT insertar_estado ('Pausado');

-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_estado (
    _id_estado INT,
    _nombre_estado VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    UPDATE proyecto.estado 
    SET nombre_estado = _nombre_estado 
    WHERE id_estado = _id_estado;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_estado (
    _id_estado INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM proyecto.estado 
    WHERE id_estado = _id_estado;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_estados ()
RETURNS TABLE (
    id_estado INT, 
    nombre_estado VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pe.id_estado, 
		pe.nombre_estado 
    FROM proyecto.estado pe;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_estados ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_estado_por_id(
    _id_estado INT
)
RETURNS TABLE (
    id_estado INT, 
    nombre_estado VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pe.id_estado, 
		pe.nombre_estado 
    FROM proyecto.estado pe
    WHERE pe.id_estado = _id_estado;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla proyecto.proyecto

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_proyecto (
    id_tipo_proyecto INT,
	id_periodo_academico INT,
	id_departamento INT,
	id_dimension INT,
	id_estado INT,
	nombre_proyecto VARCHAR(60),
	fecha_inicio DATE,
	fecha_fin DATE
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO proyecto.proyecto (id_tipo_proyecto, id_periodo_academico,
								   id_departamento, id_dimension, id_estado, 
								   nombre_proyecto, fecha_inicio, fecha_fin) 
    VALUES (id_tipo_proyecto, id_periodo_academico, id_departamento, 
			id_dimension, id_estado, nombre_proyecto, fecha_inicio, fecha_fin);
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_proyecto (
    _id_proyecto INT,
    _id_tipo_proyecto INT,
    _id_periodo_academico INT,
    _id_departamento INT,
    _id_dimension INT,
    _id_estado INT,
    _nombre_proyecto VARCHAR(60),
    _fecha_inicio DATE,
    _fecha_fin DATE
)RETURNS VOID AS $$
BEGIN
    UPDATE proyecto.proyecto 
    SET id_tipo_proyecto = _id_tipo_proyecto, 
		id_periodo_academico = _id_periodo_academico,
		id_departamento = _id_departamento, 
		id_dimension = _id_dimension,
		id_estado = _id_estado, 
		nombre_proyecto = _nombre_proyecto,
		fecha_inicio = _fecha_inicio, 
		fecha_fin = _fecha_fin
    WHERE id_proyecto = _id_proyecto;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_proyecto (
    _id_proyecto INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM proyecto.proyecto 
    WHERE id_proyecto = _id_proyecto;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_proyectos ()
RETURNS TABLE (
    id_proyecto INT, 
    id_tipo_proyecto INT,
    id_periodo_academico INT,
    id_departamento INT,
    id_dimension INT,
    id_estado INT,
    nombre_proyecto VARCHAR(60),
    fecha_inicio DATE,
    fecha_fin DATE
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pp.id_proyecto, 
		pp.id_tipo_proyecto,
		pp.id_periodo_academico, 
		pp.id_departamento, 
		pp.id_dimension, 
		pp.id_estado,
		pp.nombre_proyecto,
		pp.fecha_inicio, 
		pp.fecha_fin
    FROM proyecto.proyecto pp;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_proyectos ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_proyecto_por_id(
    _id_proyecto INT
)
RETURNS TABLE (
    id_proyecto INT, 
    id_tipo_proyecto INT,
    id_periodo_academico INT,
    id_departamento INT,
    id_dimension INT,
    id_estado INT,
    nombre_proyecto VARCHAR(60),
    fecha_inicio DATE,
    fecha_fin DATE
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pp.id_proyecto, 
		pp.id_tipo_proyecto,
		pp.id_periodo_academico, 
		pp.id_departamento, 
		pp.id_dimension, 
		pp.id_estado,
		pp.nombre_proyecto,
		pp.fecha_inicio, 
		pp.fecha_fin
    FROM proyecto.proyecto pp
    WHERE pp.id_proyecto = _id_proyecto;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla proyecto.actividad

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_actividad (
    id_proyecto INT,
    nombre_actividad VARCHAR(70),
    fecha_actividad DATE
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO proyecto.actividad (id_proyecto, nombre_actividad, fecha_actividad) 
    VALUES (id_proyecto, nombre_actividad, fecha_actividad);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_actividad (
    _id_actividad INT,
    _id_proyecto INT,
    _nombre_actividad VARCHAR(70),
    _fecha_actividad DATE
)
RETURNS VOID AS $$
BEGIN
    UPDATE proyecto.actividad 
    SET id_proyecto = _id_proyecto,
		nombre_actividad = _nombre_actividad, 
		fecha_actividad = _fecha_actividad
    WHERE id_actividad = _id_actividad;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_actividad (
    _id_actividad INT
)
RETURNS VOID AS $$
BEGIN
	DELETE FROM proyecto.actividad
	WHERE id_actividad = _id_actividad;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_actividades ()
RETURNS TABLE (
    id_actividad INT, 
    id_proyecto INT,
    nombre_actividad VARCHAR(70),
    fecha_actividad DATE
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pa.id_actividad, 
		pa.id_proyecto, 
		pa.nombre_actividad, 
		pa.fecha_actividad
    FROM proyecto.actividad pa;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_actividades ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_actividad_por_id (
    _id_actividad INT
)
RETURNS TABLE (
    id_actividad INT, 
    id_proyecto INT,
    nombre_actividad VARCHAR(70),
    fecha_actividad DATE
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pa.id_actividad, 
		pa.id_proyecto, 
		pa.nombre_actividad, 
		pa.fecha_actividad
    FROM proyecto.actividad pa
    WHERE pa.id_actividad = _id_actividad;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla proyecto.rol_proyecto

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_rol_proyecto (
    nombre_rol VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO proyecto.rol_proyecto (nombre_rol) 
    VALUES (nombre_rol);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_rol_proyecto (
    _id_rol_proyecto INT,
    _nombre_rol VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    UPDATE proyecto.rol_proyecto 
    SET nombre_rol = _nombre_rol 
    WHERE id_rol_proyecto = _id_rol_proyecto;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_rol_proyecto (
    _id_rol_proyecto INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proyecto.rol_proyecto 
    WHERE id_rol_proyecto = _id_rol_proyecto;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_roles_proyectos ()
RETURNS TABLE (
    id_rol_proyecto INT, 
    nombre_rol VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 	
		prp.id_rol_proyecto, 
		prp.nombre_rol 
    FROM proyecto.rol_proyecto prp;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_roles_proyectos ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_rol_proyecto_por_id (
    _id_rol_proyecto INT
)
RETURNS TABLE (
    id_rol_proyecto INT, 
    nombre_rol VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 	
		prp.id_rol_proyecto, 
		prp.nombre_rol 
    FROM proyecto.rol_proyecto prp
    WHERE prp.id_rol_proyecto = _id_rol_proyecto;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla proyecto.empleado_proyecto

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_empleado_proyecto (
    codigo_empleado INT,
    id_proyecto INT,
    id_rol_proyecto INT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO proyecto.empleado_proyecto (codigo_empleado, id_proyecto, id_rol_proyecto) 
    VALUES (codigo_empleado, id_proyecto, id_rol_proyecto);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_empleado_proyecto (
    _id_empleado_proyecto INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM proyecto.empleado_proyecto 
    WHERE id_empleado_proyecto = _id_empleado_proyecto;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_empleados_proyectos ()
RETURNS TABLE (
    id_empleado_proyecto INT, 
    codigo_empleado INT,
    id_proyecto INT,
    id_rol_proyecto INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pep.id_empleado_proyecto, 
		pep.codigo_empleado, 
		pep.id_proyecto, 
		pep.id_rol_proyecto
    FROM proyecto.empleado_proyecto pep;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_empleados_proyectos ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_empleado_proyecto_por_idd (
    _id_empleado_proyecto INT
)
RETURNS TABLE (
    id_empleado_proyecto INT, 
    codigo_empleado INT,
    id_proyecto INT,
    id_rol_proyecto INT
) AS $$
BEGIN
   RETURN QUERY 
    SELECT 
		pep.id_empleado_proyecto, 
		pep.codigo_empleado, 
		pep.id_proyecto, 
		pep.id_rol_proyecto
    FROM proyecto.empleado_proyecto pep
    WHERE pep.id_empleado_proyecto = _id_empleado_proyecto;
END;
$$ LANGUAGE plpgsql;

-- Funciones almacenadas basicas para tabla proyecto.actividad_empleado_proyecto

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_actividad_empleado_proyecto (
    id_actividad INT,
    id_empleado_proyecto INT,
    id_estado INT,
    horas_trabajadas INT,
    dias_compensatorios INT,
    medio_verificacion VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO proyecto.actividad_empleado_proyecto (id_actividad, id_empleado_proyecto, id_estado,
													  horas_trabajadas, dias_compensatorios, 
													  medio_verificacion) 
    VALUES (id_actividad, id_empleado_proyecto, id_estado, horas_trabajadas, dias_compensatorios,
			medio_verificacion);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_actividad_empleado_proyecto (
    _id_actividad_empleado_proyecto INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM proyecto.actividad_empleado_proyecto 
    WHERE id_actividad_empleado_proyecto = _id_actividad_empleado_proyecto;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar actividad_empleado_proyecto
CREATE OR REPLACE FUNCTION actualizar_actividad_empleado_proyecto(
	_id_actividad_empleado_proyecto INT,
	_id_actividad INT,
	_id_empleado_proyecto INT,
    _id_estado INT,
    _horas_trabajadas INT,
    _dias_compensatorios INT,
    _medio_verificacion VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
	UPDATE proyecto.actividad_empleado_proyecto
	SET id_actividad = _id_actividad,
		id_empleado_proyecto = _id_empleado_proyecto,
		id_estado = _id_estado,
		horas_trabajadas = _horas_trabajadas,
		dias_compensatorios = _dias_compensatorios,
		medio_verificacion = _medio_verificacion
	WHERE id_actividad_empleado_proyecto = _id_actividad_empleado_proyecto;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_actividades_empleados_proyectos ()
RETURNS TABLE (
    id_actividad_empleado_proyecto INT, 
    id_actividad INT,
    id_empleado_proyecto INT,
    id_estado INT,
    horas_trabajadas INT,
    dias_compensatorios INT,
    medio_verificacion VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT
		aep.id_actividad_empleado_proyecto, 
		aep.id_actividad, 
		aep.id_empleado_proyecto,
		aep.id_estado, 
		aep.horas_trabajadas, 
		aep.dias_compensatorios, 
		aep.medio_verificacion
    FROM proyecto.actividad_empleado_proyecto aep;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_actividades_empleados_proyectos ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_actividad_empleado_proyecto_por_id(
    _id_actividad_empleado_proyecto INT
)
RETURNS TABLE (
    id_actividad_empleado_proyecto INT, 
    id_actividad INT,
    id_empleado_proyecto INT,
    id_estado INT,
    horas_trabajadas INT,
    dias_compensatorios INT,
    medio_verificacion VARCHAR(100)
) AS $$
BEGIN
     RETURN QUERY 
    SELECT
		aep.id_actividad_empleado_proyecto, 
		aep.id_actividad, 
		aep.id_empleado_proyecto,
		aep.id_estado, 
		aep.horas_trabajadas, 
		aep.dias_compensatorios, 
		aep.medio_verificacion
    FROM proyecto.actividad_empleado_proyecto aep
    WHERE aep.id_actividad_empleado_proyecto = _id_actividad_empleado_proyecto;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla proceso.nombre_prueba

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_nombre_prueba (
    nombre_prueba VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO proceso.nombre_prueba (nombre_prueba) 
    VALUES (nombre_prueba);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_nombre_prueba (
    _id_nombre_prueba INT,
    _nombre_prueba VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE proceso.nombre_prueba 
    SET nombre_prueba = _nombre_prueba 
    WHERE id_nombre_prueba = _id_nombre_prueba;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_nombre_prueba (
    _id_nombre_prueba INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM proceso.nombre_prueba 
    WHERE id_nombre_prueba = _id_nombre_prueba;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_nombres_pruebas ()
RETURNS TABLE (
    id_nombre_prueba INT, 
    nombre_prueba VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pnp.id_nombre_prueba,
		pnp.nombre_prueba 
    FROM proceso.nombre_prueba pnp;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_nombres_pruebas ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_nombre_prueba_por_id (
    _id_nombre_prueba INT
)
RETURNS TABLE (
    id_nombre_prueba INT, 
    nombre_prueba VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pnp.id_nombre_prueba,
		pnp.nombre_prueba 
    FROM proceso.nombre_prueba pnp
    WHERE pnp.id_nombre_prueba = _id_nombre_prueba;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla proceso.rol_proceso

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_rol_proceso (
    descripcion_rol VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO proceso.rol_proceso (descripcion_rol) 
    VALUES (descripcion_rol);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_rol_proceso (
    _id_rol_proceso INT,
    _descripcion_rol VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    UPDATE proceso.rol_proceso 
    SET descripcion_rol = _descripcion_rol 
    WHERE id_rol_proceso = _id_rol_proceso;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_rol_proceso (
    _id_rol_proceso INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM proceso.rol_proceso 
    WHERE id_rol_proceso = _id_rol_proceso;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_roles_procesos ()
RETURNS TABLE (
    id_rol_proceso INT, 
    descripcion_rol VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		prp.id_rol_proceso, 
		prp.descripcion_rol 
    FROM proceso.rol_proceso prp;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_roles_procesos ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_rol_proceso_por_id(
    _id_rol_proceso INT
)
RETURNS TABLE (
    id_rol_proceso INT, 
    descripcion_rol VARCHAR(30)
) AS $$
BEGIN
   RETURN QUERY 
    SELECT 
		prp.id_rol_proceso, 
		prp.descripcion_rol 
    FROM proceso.rol_proceso prp
    WHERE prp.id_rol_proceso = _id_rol_proceso;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla proceso.descripcion

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_descripcion (
    nombre_proceso VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO proceso.descripcion (nombre_proceso) 
    VALUES (nombre_proceso);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_descripcion (
    _id_descripcion INT,
    _nombre_proceso VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE proceso.descripcion 
    SET nombre_proceso = _nombre_proceso 
    WHERE id_descripcion = _id_descripcion;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_descripcion (
    _id_descripcion INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM proceso.descripcion 
    WHERE id_descripcion = _id_descripcion;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_descripciones ()
RETURNS TABLE (
    id_descripcion INT, 
    nombre_proceso VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pd.id_descripcion, 
		pd.nombre_proceso 
    FROM proceso.descripcion pd;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_descripciones ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_descripcion_por_id (
    _id_descripcion INT
)
RETURNS TABLE (
    id_descripcion INT, 
    nombre_proceso VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pd.id_descripcion, 
		pd.nombre_proceso 
    FROM proceso.descripcion pd
    WHERE pd.id_descripcion = _id_descripcion;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla proceso.estado_proceso

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_estado_proceso (
    nombre_estado_proceso VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO proceso.estado_proceso (nombre_estado_proceso) 
    VALUES (nombre_estado_proceso);
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_estado_proceso (
    _id_estado_proceso INT,
    _nombre_estado_proceso VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE proceso.estado_proceso 
    SET nombre_estado_proceso = _nombre_estado_proceso 
    WHERE id_estado_proceso = _id_estado_proceso;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_estado_proceso (
    _id_estado_proceso INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM proceso.estado_proceso 
    WHERE id_estado_proceso = _id_estado_proceso;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_estados_procesos ()
RETURNS TABLE (
    id_estado_proceso INT, 
    nombre_estado_proceso VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pep.id_estado_proceso,
		pep.nombre_estado_proceso 
    FROM proceso.estado_proceso pep;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_estados_procesos ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_estado_proceso_por_id (
    _id_estado_proceso INT
)
RETURNS TABLE (
    id_estado_proceso INT, 
    nombre_estado_proceso VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pep.id_estado_proceso,
		pep.nombre_estado_proceso 
    FROM proceso.estado_proceso pep
    WHERE pep.id_estado_proceso = _id_estado_proceso;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla proceso.proceso

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_proceso (
    id_descripcion INT,
    id_estado_proceso INT,
    fecha DATE,
    cantidad_compensatoria INT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO proceso.proceso (id_descripcion, id_estado_proceso, fecha, cantidad_compensatoria) 
    VALUES (id_descripcion, id_estado_proceso, fecha, cantidad_compensatoria);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_proceso (
    _id_proceso INT,
    _id_descripcion INT,
    _id_estado_proceso INT,
    _fecha DATE,
    _cantidad_compensatoria INT
)
RETURNS VOID AS $$
BEGIN
    UPDATE proceso.proceso 
    SET id_descripcion = _id_descripcion, 
	id_estado_proceso = _id_estado_proceso, 
	fecha = _fecha, 
	cantidad_compensatoria = _cantidad_compensatoria
    WHERE id_proceso = _id_proceso;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_proceso(
    _id_proceso INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proceso.proceso 
    WHERE id_proceso = _id_proceso;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_procesos ()
RETURNS TABLE (
    id_proceso INT, 
    id_descripcion INT,
    id_estado_proceso INT,
    fecha DATE,
    cantidad_compensatoria INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pp.id_proceso,
		pp.id_descripcion,
		pp.id_estado_proceso,
		pp.fecha, 
		pp.cantidad_compensatoria
    FROM proceso.proceso pp;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_procesos ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_proceso_por_id (
    _id_proceso INT
)RETURNS TABLE (
    id_proceso INT, 
    id_descripcion INT,
    id_estado_proceso INT,
    fecha DATE,
    cantidad_compensatoria INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pp.id_proceso,
		pp.id_descripcion,
		pp.id_estado_proceso,
		pp.fecha, 
		pp.cantidad_compensatoria
    FROM proceso.proceso pp
    WHERE pp.id_proceso = _id_proceso;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla proceso.empleado_proceso

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_empleado_proceso (
    codigo_empleado INT,
    id_rol_proceso INT,
    id_proceso INT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO proceso.empleado_proceso (codigo_empleado, id_rol_proceso, id_proceso) 
    VALUES (codigo_empleado, id_rol_proceso, id_proceso);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_empleado_proceso (
    _id_empleado_proceso INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM proceso.empleado_proceso 
    WHERE id_empleado_proceso = _id_empleado_proceso;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_empleados_procesos ()
RETURNS TABLE (
    id_empleado_proceso INT, 
    codigo_empleado INT,
    id_rol_proceso INT,
    id_proceso INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pep.id_empleado_proceso, 
		pep.codigo_empleado, 
		pep.id_rol_proceso, 
		pep.id_proceso
    FROM proceso.empleado_proceso pep;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_empleados_procesos ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_empleado_proceso_por_id (
    _id_empleado_proceso INT
)
RETURNS TABLE (
    id_empleado_proceso INT, 
    codigo_empleado INT,
    id_rol_proceso INT,
    id_proceso INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pep.id_empleado_proceso, 
		pep.codigo_empleado, 
		pep.id_rol_proceso, 
		pep.id_proceso
    FROM proceso.empleado_proceso pep
    WHERE pep.id_empleado_proceso = _id_empleado_proceso;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla poceso.asistencia

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_asistencia (
    id_empleado_proceso INT,
    id_nombre_prueba INT,
    estado BOOLEAN
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO proceso.asistencia (id_empleado_proceso, id_nombre_prueba, estado) 
    VALUES (id_empleado_proceso, id_nombre_prueba, estado);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_asistencia (
    _id_empleado_proceso INT,
    _id_nombre_prueba INT,
    _estado BOOLEAN
)
RETURNS VOID AS $$
BEGIN
    UPDATE proceso.asistencia 
    SET estado = _estado
    WHERE id_empleado_proceso = _id_empleado_proceso AND id_nombre_prueba = _id_nombre_prueba;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_asistencia (
    _id_empleado_proceso INT,
    _id_nombre_prueba INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM proceso.asistencia 
    WHERE id_empleado_proceso = _id_empleado_proceso AND id_nombre_prueba = _id_nombre_prueba;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_asistencias ()
RETURNS TABLE (
    id_empleado_proceso INT, 
    id_nombre_prueba INT,
    estado BOOLEAN
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pa.id_empleado_proceso, 
		pa.id_nombre_prueba, 
		pa.estado
    FROM proceso.asistencia pa;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_asistencias ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_asistencia_por_id(
    _id_empleado_proceso INT,
    _id_nombre_prueba INT
)
RETURNS TABLE (
    id_empleado_proceso INT, 
    id_nombre_prueba INT,
    estado BOOLEAN
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pa.id_empleado_proceso, 
		pa.id_nombre_prueba, 
		pa.estado
    FROM proceso.asistencia pa
    WHERE pa.id_empleado_proceso = _id_empleado_proceso AND pa.id_nombre_prueba = _id_nombre_prueba;
END;
$$ LANGUAGE plpgsql;

-- Funciones almacenadas basicas para tabla permiso.tipo_permiso

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_tipo_permiso (
    nombre_tipo_permiso VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO permiso.tipo_permiso (nombre_tipo_permiso) 
    VALUES (nombre_tipo_permiso);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_tipo_permiso (
    _id_tipo_permiso INT,
    _nombre_tipo_permiso VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    UPDATE permiso.tipo_permiso 
    SET nombre_tipo_permiso = _nombre_tipo_permiso 
    WHERE id_tipo_permiso = _id_tipo_permiso;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_tipo_permiso (
    _id_tipo_permiso INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM permiso.tipo_permiso 
    WHERE id_tipo_permiso = _id_tipo_permiso;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_tipos_permisos ()
RETURNS TABLE (
    id_tipo_permiso INT, 
    nombre_tipo_permiso VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ptp.id_tipo_permiso, 
		ptp.nombre_tipo_permiso 
    FROM permiso.tipo_permiso ptp;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_tipos_permisos ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_tipo_permiso_por_idd(
    _id_tipo_permiso INT
)
RETURNS TABLE (
    id_tipo_permiso INT, 
    nombre_tipo_permiso VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		ptp.id_tipo_permiso, 
		ptp.nombre_tipo_permiso 
    FROM permiso.tipo_permiso ptp
    WHERE ptp.id_tipo_permiso = _id_tipo_permiso;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla permiso.permiso

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_permiso (
    codigo_empleado INT,
	id_tipo_permiso INT,
	hora_recibido TIME,
	fecha_ingreso DATE, 
	fecha_inicio DATE,
	fecha_final DATE,
	descripcion VARCHAR(200),
	dias INT,
	horas INT,
	minutos INT,
	observacion VARCHAR(200),
	respaldo BOOLEAN,
	recibido_por INT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO permiso.permiso (codigo_empleado, id_tipo_permiso, hora_recibido,
								 fecha_ingreso, fecha_inicio, fecha_final, descripcion, 
								 dias, horas, minutos, observacion, respaldo, recibido_por) 
    VALUES (codigo_empleado, id_tipo_permiso, hora_recibido, fecha_ingreso, fecha_inicio,
			fecha_final, descripcion, dias, horas, minutos, observacion, respaldo, recibido_por);
END;
$$ LANGUAGE plpgsql;

					 
-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_permiso (
    _id_permiso INT,
    _codigo_empleado INT,
    _id_tipo_permiso INT,
    _hora_recibido TIME,
    _fecha_ingreso DATE, 
    _fecha_inicio DATE,
    _fecha_final DATE,
    _descripcion VARCHAR(200),
    _dias INT,
    _horas INT,
    _minutos INT,
    _observacion VARCHAR(200),
    _respaldo BOOLEAN,
    _recibido_por INT
)
RETURNS VOID AS $$
BEGIN
    UPDATE permiso.permiso 
    SET codigo_empleado = _codigo_empleado, 
		id_tipo_permiso = _id_tipo_permiso, 
		hora_recibido = _hora_recibido, 
		fecha_ingreso = _fecha_ingreso, 
		fecha_inicio = _fecha_inicio, 
		fecha_final = _fecha_final, 
		descripcion = _descripcion, 
		dias = _dias, 
		horas = _horas, 
		minutos = _minutos,
		observacion = _observacion, 
		respaldo = _respaldo, 
		recibido_por = _recibido_por
    WHERE id_permiso = _id_permiso;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_permiso (
    _id_permiso INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM permiso.permiso 
    WHERE id_permiso = _id_permiso;
END;
$$ LANGUAGE plpgsql;

SELECT eliminar_permiso (5);

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_permisos ()
RETURNS TABLE (
    id_permiso INT, 
    codigo_empleado INT,
    id_tipo_permiso INT,
    hora_recibido TIME,
    fecha_ingreso DATE, 
    fecha_inicio DATE,
    fecha_final DATE,
    descripcion VARCHAR(200),
    dias INT,
    horas INT,
    minutos INT,
    observacion VARCHAR(200),
    respaldo BOOLEAN,
    recibido_por INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pp.id_permiso, 
		pp.codigo_empleado, 
		pp.id_tipo_permiso, 
		pp.hora_recibido,
		pp.fecha_ingreso, 
		pp.fecha_inicio, 
		pp.fecha_final, 
		pp.descripcion, 
		pp.dias,
		pp.horas,
		pp.minutos,
		pp.observacion,
		pp.respaldo,
		pp.recibido_por
    FROM permiso.permiso pp;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM consultar_permisos ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_permiso_por_id (
    _id_permiso INT
)
RETURNS TABLE (
    id_permiso INT, 
    codigo_empleado INT,
    id_tipo_permiso INT,
    hora_recibido TIME,
    fecha_ingreso DATE, 
    fecha_inicio DATE,
    fecha_final DATE,
    descripcion VARCHAR(200),
    dias INT,
    horas INT,
    minutos INT,
    observacion VARCHAR(200),
    respaldo BOOLEAN,
    recibido_por INT
) AS $$
BEGIN
 RETURN QUERY 
    SELECT 
		pp.id_permiso, 
		pp.codigo_empleado, 
		pp.id_tipo_permiso, 
		pp.hora_recibido,
		pp.fecha_ingreso, 
		pp.fecha_inicio, 
		pp.fecha_final, 
		pp.descripcion, 
		pp.dias,
		pp.horas,
		pp.minutos,
		pp.observacion,
		pp.respaldo,
		pp.recibido_por
    FROM permiso.permiso pp
    WHERE pp.id_permiso = _id_permiso;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla permiso.permiso_compensatorio_proceso

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_permiso_compensatorio_proceso (
    id_permiso INT,
    id_proceso INT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO permiso.permiso_compensatorio_proceso (id_permiso, id_proceso) 
    VALUES (id_permiso, id_proceso);
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_permiso_compensatorio_proceso (
    _id_permiso INT,
    _id_proceso INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM permiso.permiso_compensatorio_proceso 
    WHERE id_permiso = _id_permiso AND id_proceso = _id_proceso;
END;
$$ LANGUAGE plpgsql;


-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_permisos_compensatorios_procesos ()
RETURNS TABLE (
    id_permiso INT, 
    id_proceso INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pcp.id_permiso, 
		pcp.id_proceso
    FROM permiso.permiso_compensatorio_proceso pcp;
END;
$$ LANGUAGE plpgsql;

SELECT consultar_permisos_compensatorios_procesos ();

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_permiso_compensatorio_proceso_por_id (
    _id_permiso INT,
    _id_proceso INT
)
RETURNS TABLE (
    id_permiso INT, 
    id_proceso INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pcp.id_permiso, 
		pcp.id_proceso
    FROM permiso.permiso_compensatorio_proceso pcp
    WHERE pcp.id_permiso = _id_permiso AND pcp.id_proceso = _id_proceso;
END;
$$ LANGUAGE plpgsql;


-- Funciones almacenadas basicas para tabla permiso.permiso_compensatorio_proyecto

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_permiso_compensatorio_proyecto (
    id_permiso INT,
    id_actividad_empleado_proyecto INT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO permiso.permiso_compensatorio_proyecto (id_permiso, id_actividad_empleado_proyecto) 
    VALUES (id_permiso, id_actividad_empleado_proyecto);
END;
$$ LANGUAGE plpgsql;


--SELECT insertar_permiso_compensatorio_proyecto (1,1);

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_permiso_compensatorio_proyecto (
    _id_permiso INT,
    _id_actividad_empleado_proyecto INT
)
RETURNS VOID AS $$
BEGIN
    DELETE 
	FROM permiso.permiso_compensatorio_proyecto 
    WHERE id_permiso = _id_permiso AND id_actividad_empleado_proyecto = _id_actividad_empleado_proyecto;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_permisos_compensatorios_proyectos ()
RETURNS TABLE (
    id_permiso INT, 
    id_actividad_empleado_proyecto INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pcp.id_permiso, 
		pcp.id_actividad_empleado_proyecto
    FROM permiso.permiso_compensatorio_proyecto pcp;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_permiso_compensatorio_proyecto_por_idd (
    _id_permiso INT,
    _id_actividad_empleado_proyecto INT
)
RETURNS TABLE (
    id_permiso INT, 
    id_actividad_empleado_proyecto INT
) AS $$
BEGIN
  RETURN QUERY 
    SELECT 
		pcp.id_permiso, 
		pcp.id_actividad_empleado_proyecto
    FROM permiso.permiso_compensatorio_proyecto pcp
    WHERE pcp.id_permiso = _id_permiso 
		AND pcp.id_actividad_empleado_proyecto = _id_actividad_empleado_proyecto;
END;
$$ LANGUAGE plpgsql;

-- 5 Insert de la tabla empleado.beneficio

SELECT insertar_beneficio('Días de vacaciones adicionales');
SELECT insertar_beneficio('Seguro médico');
SELECT insertar_beneficio('Bonificación por desempeño');
SELECT insertar_beneficio('Comida subsidiada');
SELECT insertar_beneficio('Programa de desarrollo profesional');


-- 5 insert tabla empleado.tipo_contrato
SELECT insertar_tipo_contrato('Tiempo completo');
SELECT insertar_tipo_contrato('Tiempo parcial');
SELECT insertar_tipo_contrato('Contrato por obra o servicio determinado');
SELECT insertar_tipo_contrato('Contrato de prácticas');
SELECT insertar_tipo_contrato('Contrato de formación y aprendizaje');

-- 5 Insert de la tabla empleado.puesto
SELECT insertar_puesto('Docente');
SELECT insertar_puesto('VOAE');
SELECT insertar_puesto('DEGT');
SELECT insertar_puesto('Administrar');
SELECT insertar_puesto('Director');

-- 5 Insert de la tabla empleado.grado_academico

SELECT insertar_grado_academico('Licenciatura Informática', 'Desarrollo de Software');
SELECT insertar_grado_academico('Maestría en Administración', 'Gestión Financiera');
SELECT insertar_grado_academico('Doctorado Ambientales', 'Biodiversidad');
SELECT insertar_grado_academico('Ingeniería Civil', 'Diseño Estructural');
SELECT insertar_grado_academico('Técnico en Electrónica', 'Reparación Electrónicos');


-- 5 Insert de la tabla empleado.institucion
SELECT insertar_institucion('Universidad Nacional Autónoma de México');
SELECT insertar_institucion('Universidad de Buenos Aires');
SELECT insertar_institucion('Universidad de Sao Paulo');
SELECT insertar_institucion('Universidad de Barcelona');
SELECT insertar_institucion('Universidad de California, Berkeley');

-- Insert de la tabla empleado.nacionalidad algunas de las nacionalidades 
SELECT insertar_nacionalidad('Japonés', 'Japan');
SELECT insertar_nacionalidad('Coreano', 'Corea del Sur');
SELECT insertar_nacionalidad('Chino', 'Chiina');
SELECT insertar_nacionalidad('Indio', 'Indiea');
SELECT insertar_nacionalidad('Tailandés', 'Taileeandia');


-- 2 Insert de la tabla empleado.genero
SELECT insertar_genero('M');
SELECT insertar_genero('F');

-- 5 Insert de la tabla empleado.estado_civil
SELECT insertar_estado_civil('Single');
SELECT insertar_estado_civil('Married');
SELECT insertar_estado_civil('Divorced');
SELECT insertar_estado_civil('Viudo');
SELECT insertar_estado_civil('Unión libre');


-- 5 Insert de la tabla usuario.usuario
SELECT insertar_usuario('usuario001', 'usuario1@example.com', 'password1');
SELECT insertar_usuario('usuario002', 'usuario2@example.com', 'password2');
SELECT insertar_usuario('usuario003', 'usuario3@example.com', 'password3');
SELECT insertar_usuario('usuario004', 'usuario4@example.com', 'password4');
SELECT insertar_usuario('usuario005', 'usuario5@example.com', 'password5');

-- 5 Insert de la tabla usuario.rol
SELECT insertar_rol('Administradr');
SELECT insertar_rol('Supervisor');
SELECT insertar_rol('Empleado');
SELECT insertar_rol('Analista');
SELECT insertar_rol('Gerente');

-- 5 Insert de la tabla usuario.permiso_usuario
SELECT insertar_permiso_usuario('Crear usuario');
SELECT insertar_permiso_usuario('Editar usuario');
SELECT insertar_permiso_usuario('Eliminar usuario');
SELECT insertar_permiso_usuario('Ver información del usuario');
SELECT insertar_permiso_usuario('Administrar roles y permisos');

-- 5 Insert de la tabla usuario.rol_permiso_usuario
SELECT insertar_rol_permiso_usuario(2, 1);
SELECT insertar_rol_permiso_usuario(1, 2);
SELECT insertar_rol_permiso_usuario(1, 3);
SELECT insertar_rol_permiso_usuario(1, 4);

-- 5 Insert de la tabla usuario.usuario_rol
SELECT insertar_usuario_rol(2, 1);
SELECT insertar_usuario_rol(3, 2);
SELECT insertar_usuario_rol(2, 3);
SELECT insertar_usuario_rol(2, 5);
SELECT insertar_usuario_rol(5, 5);

-- 5 Insert de la tabla empleado.empleado

SELECT insertar_empleado(6, 1, 1, 1, 1, '123456789', 'Juan', 'Pérez', '1990-05-15', 'juan@example.com');
SELECT insertar_empleado(7, 2, 2, 2, 2, '987654321', 'María', 'López', '1985-09-20', 'maria@example.com');
SELECT insertar_empleado(8, 3, 1, 1, 3, '567890123', 'Carlos', 'González', '1982-02-10', 'carlos@example.com');
SELECT insertar_empleado(9, 4, 2, 2, 4, '321098765', 'Ana', 'Martínez', '1995-07-03', 'ana@example.com');
SELECT insertar_empleado(5, 5, 1, 3, 5, '098765432', 'Pedro', 'García', '1988-11-30', 'pedro@example.com');

-- 5 Insert de la tabla empleado.operador_telefonico
SELECT insertar_operador_telefonico('Telcel');
SELECT insertar_operador_telefonico('AT&T');
SELECT insertar_operador_telefonico('T-Mobile');

-- 5 Insert por cada empleado.empleado en la tabla empleado.telefono
SELECT insertar_telefono(1, 1, '9965-2645');
SELECT insertar_telefono(2, 2, '9876-5432');
SELECT insertar_telefono(3, 3, '8575-6545');
SELECT insertar_telefono(4, 6, '9626-6646');
SELECT insertar_telefono(5, 5, '8767-4547');

-- 5 Insert por cada empleado.empleado en la tabla empleado.empleado_grado_academico

SELECT insertar_empleado_grado_academico(6, 1, 1, '2020-01-01');
SELECT insertar_empleado_grado_academico(3, 2, 2, '2018-01-01');
SELECT insertar_empleado_grado_academico(7, 3, 3, '2015-01-01');
SELECT insertar_empleado_grado_academico(5, 3, 2, '2019-01-01');
SELECT insertar_empleado_grado_academico(2, 3, 5, '2021-01-01');

--  Insert por cada empleado.empleado en la tabla empleado.departamento
SELECT insertar_departamento('Desarrollo', 1);
SELECT insertar_departamento('Ventas', 2);
SELECT insertar_departamento('Recursos Humanos', 3);
SELECT insertar_departamento('Finanzas', 6);
SELECT insertar_departamento('Operaciones', 5);

--  Insert por cada empleado.empleado en la tabla empleado.contrato_laboral
-- 
SELECT insertar_contrato_laboral(1, 1, 1, 1, '123456789', '2023-01-01', '2024-01-01', 50000.00, '08:00:00', '17:00:00', true);
SELECT insertar_contrato_laboral(2, 2, 2, 2, '987654321', '2022-03-15', '2023-03-15', 60000.00, '09:00:00', '18:00:00', true);
SELECT insertar_contrato_laboral(3, 3, 3, 3, '567890123', '2021-05-20', '2022-05-20', 45000.00, '08:30:00', '17:30:00', true);
SELECT insertar_contrato_laboral(6, 2, 3, 2, '321098765', '2024-07-10', '2025-07-10', 55000.00, '08:00:00', '16:00:00', true);
SELECT insertar_contrato_laboral(5, 6, 2, 1, '098765432', '2023-11-15', '2024-11-15', 48000.00, '09:30:00', '18:30:00', true);


-- 5 Insert por cada proyecto.numero_periodo en la tabla proyecto.numero_periodo
SELECT insertar_numero_periodo('1');
SELECT insertar_numero_periodo('2');
SELECT insertar_numero_periodo('3');
SELECT insertar_numero_periodo('4');
SELECT insertar_numero_periodo('5');

-- 5 Insert por cada proyecto.numero_periodo en la tabla proyecto.periodo_academico

SELECT insertar_periodo_academico(1, 2024);
SELECT insertar_periodo_academico(2, 2024);
SELECT insertar_periodo_academico(3, 2024);
SELECT insertar_periodo_academico(4, 2024);
SELECT insertar_periodo_academico(5, 2024);

--  Insert en la tabla empleado.cambio_horario por cada empleado.contrato_laboral
SELECT insertar_cambio_horario(1, 1, '08:00:00', '16:00:00', 'Cambio de horario para el período académico', '2024-04-30');
SELECT insertar_cambio_horario(2, 2, '09:00:00', '17:00:00', 'Cambio de horario para el período académico', '2024-04-30');
SELECT insertar_cambio_horario(3, 3, '08:30:00', '16:30:00', 'Cambio de horario para el período académico', '2024-04-30');
SELECT insertar_cambio_horario(2, 4, '08:00:00', '16:00:00', 'Cambio de horario para el período académico', '2024-04-30');
SELECT insertar_cambio_horario(3, 5, '09:00:00', '17:00:00', 'Cambio de horario para el período académico', '2024-04-30');

-- 5 Insert por cada proyecto.dimension en la tabla proyecto.dimension

SELECT insertar_dimension('Dimensión 1');
SELECT insertar_dimension('Dimensión 2');
SELECT insertar_dimension('Dimensión 3');
SELECT insertar_dimension('Dimensión 4');
SELECT insertar_dimension('Dimensión 5');

-- 5 Insert por cada proyecto.tipo_proyecto en la tabla proyecto.tipo_proyecto
SELECT insertar_tipo_proyecto('Tipo Proyecto 1');
SELECT insertar_tipo_proyecto('Tipo Proyecto 2');
SELECT insertar_tipo_proyecto('Tipo Proyecto 3');
SELECT insertar_tipo_proyecto('Tipo Proyecto 4');
SELECT insertar_tipo_proyecto('Tipo Proyecto 5');

-- 5 Insert por cada proyecto.estado en la tabla proyecto.estado
SELECT insertar_estado('Estado 1');
SELECT insertar_estado('Estado 2');
SELECT insertar_estado('Estado 3');
SELECT insertar_estado('Estado 4');
SELECT insertar_estado('Estado 5');

--  Insert por cada proyecto.periodo_academico en la tabla proyecto.proyecto
SELECT insertar_proyecto(1, 1, 1, 1, 1, 'Proyecto 1', '2024-05-01', '2024-06-30');
SELECT insertar_proyecto(2, 2, 2, 2, 2, 'Proyecto 2', '2024-07-01', '2024-08-31');
SELECT insertar_proyecto(3, 3, 3, 3, 3, 'Proyecto 3', '2024-09-01', '2024-10-31');
SELECT insertar_proyecto(4, 4, 4, 4, 4, 'Proyecto 4', '2024-11-01', '2024-12-31');
SELECT insertar_proyecto(5, 5, 5, 5, 5, 'Proyecto 5', '2025-01-01', '2025-02-28');

-- 5 Insert por cada proyecto.proyecto en la tabla proyecto.actividad
SELECT insertar_actividad(1, 'Actividad 1', '2024-05-01');
SELECT insertar_actividad(2, 'Actividad 2', '2024-06-01');
SELECT insertar_actividad(3, 'Actividad 3', '2024-07-01');
SELECT insertar_actividad(3, 'Actividad 6', '2024-08-01');
SELECT insertar_actividad(2, 'Actividad 5', '2024-09-01');

-- 5 Insert por cada proyecto.rol_proyecto en la tabla proyecto.rol_proyecto
SELECT insertar_rol_proyecto('Desarrollador');
SELECT insertar_rol_proyecto('Analista');
SELECT insertar_rol_proyecto('Diseñador');
SELECT insertar_rol_proyecto('Gerente de Proyecto');
SELECT insertar_rol_proyecto('QA Tester');

-- Insert por cada proyecto.proyecto en la tabla proyecto.empleado_proyecto
SELECT insertar_empleado_proyecto(2, 1, 1);
SELECT insertar_empleado_proyecto(3, 2, 2);
SELECT insertar_empleado_proyecto(2, 3, 3);
SELECT insertar_empleado_proyecto(6, 2, 4);
SELECT insertar_empleado_proyecto(3, 3, 5);

--  Insert por cada proyecto.actividad en la tabla proyecto.actividad_empleado_proyecto
SELECT insertar_actividad_empleado_proyecto(2, 1, 1, 8, 0, 'Informe diario');
SELECT insertar_actividad_empleado_proyecto(3, 2, 2, 6, 1, 'Informe semanal');
SELECT insertar_actividad_empleado_proyecto(2, 3, 1, 7, 0, 'Informe diario');
SELECT insertar_actividad_empleado_proyecto(3, 4, 3, 5, 2, 'Informe mensual');
SELECT insertar_actividad_empleado_proyecto(2, 5, 2, 9, 0, 'Informe diario');


--  Insert por cada proceso.nombre_prueba en la tabla proceso.nombre_prueba

SELECT insertar_nombre_prueba('Prueba de concepto A');
SELECT insertar_nombre_prueba('Prueba de concepto B');
SELECT insertar_nombre_prueba('Prueba de concepto C');
SELECT insertar_nombre_prueba('Prueba de concepto D');
SELECT insertar_nombre_prueba('Prueba de concepto E');

-- 5 Insert por cada proceso.rol_proceso en la tabla proceso.rol_proceso
SELECT insertar_rol_proceso('Rol de proceso A');
SELECT insertar_rol_proceso('Rol de proceso B');
SELECT insertar_rol_proceso('Rol de proceso C');
SELECT insertar_rol_proceso('Rol de proceso D');
SELECT insertar_rol_proceso('Rol de proceso E');

-- Insert por cada proceso.descripcion en la tabla proceso.descripcion

SELECT insertar_descripcion('Descripción del proceso A');
SELECT insertar_descripcion('Descripción del proceso B');
SELECT insertar_descripcion('Descripción del proceso C');
SELECT insertar_descripcion('Descripción del proceso D');
SELECT insertar_descripcion('Descripción del proceso E');

-- Insert por cada proceso.estado_proceso en la tabla proceso.estado_proceso
SELECT insertar_estado_proceso('Estado A');
SELECT insertar_estado_proceso('Estado B');
SELECT insertar_estado_proceso('Estado C');
SELECT insertar_estado_proceso('Estado D');
SELECT insertar_estado_proceso('Estado E');

-- Insert por cada proceso.descripcion en la tabla proceso.proceso
SELECT insertar_proceso(1, 1, '2024-04-30', 10);
SELECT insertar_proceso(2, 2, '2024-04-29', 15);
SELECT insertar_proceso(3, 3, '2024-04-28', 20);
SELECT insertar_proceso(4, 4, '2024-04-27', 25);
SELECT insertar_proceso(5, 5, '2024-04-26', 30);


--  Insert por cada proceso.proceso en la tabla proceso.empleado_proceso
SELECT insertar_empleado_proceso(3, 1, 1);
SELECT insertar_empleado_proceso(6, 2, 2);
SELECT insertar_empleado_proceso(1, 3, 3);
SELECT insertar_empleado_proceso(2, 4, 4);
SELECT insertar_empleado_proceso(2, 5, 5);

-- Insert por cada proceso.nombre_prueba en la tabla proceso.asistencia
SELECT insertar_asistencia(2, 1, TRUE);
SELECT insertar_asistencia(1, 2, FALSE);
SELECT insertar_asistencia(2, 3, TRUE);
SELECT insertar_asistencia(2, 4, TRUE);
SELECT insertar_asistencia(3, 5, FALSE);

-- Insert de la tabla permiso.tipo_permiso (Personal, Compensatorio, academico, administrativo)
SELECT insertar_tipo_permiso('Vacaciones');
SELECT insertar_tipo_permiso('enfermedad');
SELECT insertar_tipo_permiso('maternidad/paternidad');
SELECT insertar_tipo_permiso('Permiso por duelo');
SELECT insertar_tipo_permiso('Permiso por estudios');


-- Insert por cada permiso.tipo_permiso en la tabla permiso.permiso

SELECT insertar_permiso(3, 3, '09:00:00', '2024-04-30', '2024-05-01', '2024-05-05', 'Vacaciones de verano', 5, 0, 0, 'Disfrutando del tiempo libre', true, 1);
SELECT insertar_permiso(3, 3, '10:30:00', '2024-04-30', '2024-05-03', '2024-05-03', 'Permiso por consulta médica', 0, 4, 30, 'Revisión médica de rutina', true, 1);
SELECT insertar_permiso(3, 3, '08:45:00', '2024-04-30', '2024-06-15', '2024-07-15', 'Permiso por paternidad', 30, 0, 0, 'Tiempo para cuidar al recién nacido', true, 1);
SELECT insertar_permiso(6, 4, '11:00:00', '2024-04-30', '2024-05-10', '2024-05-12', 'Permiso por fallecimiento familiar', 3, 0, 0, 'Lamentablemente, fallecimiento del abuelo', true, 1);
SELECT insertar_permiso(5, 5, '14:20:00', '2024-04-30', '2024-05-20', '2024-05-25', 'Permiso para asistir a curso de capacitación', 5, 0, 0, 'Curso de desarrollo profesional', true, 1);
