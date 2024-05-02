-- para hacer las Funciones Almacenadas Sp

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
--     descripcion_grado_academico VARCHAR(30) NOT NULL,
--     especialidad VARCHAR(35) NOT NULL
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
-- 		REFERENCES empleado.departamento(id_departamento)
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
-- 	nombre_proceso VARCHAR(100) NOT NULL
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

-- CREATE TABLE permiso.permiso_compensatorio_proceso
-- (
-- 	id_permiso INT NOT NULL,
-- 	id_proceso INT NOT NULL,
	
-- 	PRIMARY KEY(id_permiso, id_proceso),
-- 	CONSTRAINT Fk_PermisoCompensatorioProceso_PermisoFinal FOREIGN KEY (id_permiso) 
-- 		REFERENCES permiso.permiso(id_permiso),
-- 	CONSTRAINT Fk_PermisoCompensatorioProceso_Proceso FOREIGN KEY (id_proceso) 
-- 		REFERENCES proceso.proceso(id_proceso)
-- );

-- CREATE TABLE permiso.permiso_compensatorio_proyecto
-- (
-- 	id_permiso INT NOT NULL,
-- 	id_actividad_empleado_proyecto INT NOT NULL,
	
-- 	PRIMARY KEY(id_permiso, id_actividad_empleado_proyecto),
-- 	CONSTRAINT Fk_PermisoCompensatorioProyecto_PermisoFinal FOREIGN KEY (id_permiso) 
-- 		REFERENCES permiso.permiso(id_permiso),
-- 	CONSTRAINT Fk_PermisoCompensatorioProyecto_ActividadEmpleadoProyecto FOREIGN KEY (id_actividad_empleado_proyecto) 
-- 		REFERENCES proyecto.actividad_empleado_proyecto(id_actividad_empleado_proyecto)

-- );



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


-----------------------------------------------------------------------------------------------------------------
-- Funciones Almacenadas de búsqueda 


-----------------------------------------------------------------------------------------------------------------
-- Funciones Almacenadas usando IF……ELSE


-----------------------------------------------------------------------------------------------------------------
-- Funciones Almacenadas usando IF EXISTS


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
		INNER JOIN permiso.permiso_compesatorio_proceso ppc
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

