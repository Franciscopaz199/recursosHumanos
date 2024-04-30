-- procedimientos almacenados basicos para las tablas en el archivo DDL_proyecto_final.sql


-- Funcionces almacenadas basicas para tabla empleado.beneficio

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_beneficio (
    descripcion_beneficio VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.beneficio (descripcion_beneficio) 
    VALUES (descripcion_beneficio);
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de actualizar
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

-- Funcionces almacenadas basicas para tabla empleado.nacionalidad

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


-- Funcionces almacenadas basicas para tabla empleado.genero

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

-- Funcionces almacenadas basicas para tabla empleado.estado_civil

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


-- Funcionces almacenadas basicas para tabla usuario.usuario

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

-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_usuario(
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
    WHERE id_usuario = id_usuario;
END;
$$ LANGUAGE plpgsql;

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

SELECT consultar_usuarios();

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


-- Funcionces almacenadas basicas para tabla usuario.rol

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


-- Funcionces almacenadas basicas para tabla usuario.permiso_usuario

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


-- Funcionces almacenadas basicas para tabla usuario.rol_permiso_usuario

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
    DELETE FROM usuario.rol_permiso_usuario 
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


-- Funcionces almacenadas basicas para tabla usuario.usuario_rol

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

-- Funcionces almacenadas basicas para tabla empleado.empleado

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_empleado (
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
    INSERT INTO empleado.empleado (codigo_empleado, id_nacionalidad, id_genero, id_estado_civil, id_usuario, dni, nombres, apellidos, fecha_nacimiento, correo) 
    VALUES (codigo_empleado, id_nacionalidad, id_genero, id_estado_civil, id_usuario, dni, nombres, apellidos, fecha_nacimiento, correo);
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


-- Funcionces almacenadas basicas para tabla empleado.operador_telefonico

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


-- Funcionces almacenadas basicas para tabla empleado.telefono

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


-- Funcionces almacenadas basicas para tabla empleado.empleado_grado_academico

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_empleado_grado_academico (
    codigo_empleado INT,
    id_grado_academico INT,
    id_institucion INT,
    anio_obtencion DATE
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO empleado.empleado_grado_academico (codigo_empleado, id_grado_academico, id_institucion, anio_obtencion) 
    VALUES (codigo_empleado, id_grado_academico, id_institucion, anio_obtencion);
END;
$$ LANGUAGE plpgsql;

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


-- Funcionces almacenadas basicas para tabla empleado.departamento

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

-- Funcionces almacenadas basicas para tabla empleado.contrato_laboral

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_contrato_laboral (
    codigo_empleado INT,
	id_tipo_contrato INT,
	id_puesto INT,
	id_departamento INT,
	id_beneficio INT,
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
    INSERT INTO empleado.contrato_laboral (codigo_empleado, id_tipo_contrato, id_puesto, id_departamento, id_beneficio, numero_contrato, fecha_inicio, fecha_finalizacion, salario, hora_entrada, hora_salida, estado_contrato) 
    VALUES (codigo_empleado, id_tipo_contrato, id_puesto, id_departamento, id_beneficio, numero_contrato, fecha_inicio, fecha_finalizacion, salario, hora_entrada, hora_salida, estado_contrato);
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_contrato_laboral (
    _id_contrato_laboral INT,
    _codigo_empleado INT,
	_id_tipo_contrato INT,
	_id_puesto INT,
	_id_departamento INT,
	_id_beneficio INT,
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
		id_beneficio = _id_beneficio, 
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
CREATE FUNCTION consultar_contratos_laborales ()
RETURNS TABLE (
    id_contrato_laboral INT, 
    codigo_empleado INT,
    id_tipo_contrato INT,
    id_puesto INT,
    id_departamento INT,
    id_beneficio INT,
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
			ecl.id_beneficio, 
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
    id_beneficio INT,
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
			ecl.id_beneficio, 
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


-- Funcionces almacenadas basicas para tabla proyecto.numero_periodo

-- Funcion almacenada de insertar
CREATE FUNCTION insertar_numero_periodo (
    numero_periodo INT
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
    _numero_periodo INT
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
    numero_periodo INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
		pnp.id_numero_periodo, 
		pnp.numero_periodo 
    FROM proyecto.numero_periodo pnp;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_numero_periodo_por_id (
    _id_numero_periodo INT
)
RETURNS TABLE (
    id_numero_periodo INT, 
    numero_periodo INT
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


-- Funcionces almacenadas basicas para tabla proyecto.periodo_academico

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

-- Funcionces almacenadas basicas para tabla empleado.cambio_horario

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
    INSERT INTO empleado.cambio_horario (id_contrato_laboral, id_periodo_academico, nueva_hora_entrada, nueva_hora_salida, nota, fecha_cambio) 
    VALUES (id_contrato_laboral, id_periodo_academico, nueva_hora_entrada, nueva_hora_salida, nota, fecha_cambio);
END;
$$ LANGUAGE plpgsql;

--SELECT insertar_cambio_horario ();

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
		empleado.cambio_horario ech;
    WHERE ech.id_cambio_horario = _id_cambio_horario;
END;
$$ LANGUAGE plpgsql;

-- Funcionces almacenadas basicas para tabla proyecto.dimension

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



-- Funcionces almacenadas basicas para tabla proyecto.tipo_proyecto

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
CREATE FUNCTION consultar_tipos_proyectoss ()
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

-- Funcionces almacenadas basicas para tabla proyecto.estado

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

-- Funcionces almacenadas basicas para tabla proyecto.proyecto

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
    INSERT INTO proyecto.proyecto (id_tipo_proyecto, id_periodo_academico, id_departamento, id_dimension, id_estado, nombre_proyecto, fecha_inicio, fecha_fin) 
    VALUES (id_tipo_proyecto, id_periodo_academico, id_departamento, id_dimension, id_estado, nombre_proyecto, fecha_inicio, fecha_fin);
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
)
RETURNS VOID AS $$
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

-- Funcionces almacenadas basicas para tabla proyecto.actividad

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
    id_actividad INT
)
RETURNS VOID AS $$
BEGIN
	DELETE FROM proyecto.actividad
	WHERE id_actividad = id_actividad;
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

-- Funcionces almacenadas basicas para tabla proyecto.rol_proyecto

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

-- Funcionces almacenadas basicas para tabla proyecto.empleado_proyecto

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

-- Funcionces almacenadas basicas para tabla proyecto.actividad_empleado_proyecto

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
    INSERT INTO proyecto.actividad_empleado_proyecto (id_actividad, id_empleado_proyecto, id_estado, horas_trabajadas, dias_compensatorios, medio_verificacion) 
    VALUES (id_actividad, id_empleado_proyecto, id_estado, horas_trabajadas, dias_compensatorios, medio_verificacion);
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


-- Funcionces almacenadas basicas para tabla proceso.nombre_prueba

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

-- Funcionces almacenadas basicas para tabla proceso.rol_proceso

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

-- Funcionces almacenadas basicas para tabla proceso.descripcion

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

-- Funcionces almacenadas basicas para tabla proceso.estado_proceso

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

-- Funcionces almacenadas basicas para tabla proceso.proceso

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
CREATE FUNCTION eliminar_proceso (
    id_proceso INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proceso.proceso 
    WHERE id_proceso = id_proceso;
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

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_proceso_por_id (
    _id_proceso INT
)
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
    FROM proceso.proceso pp
    WHERE pp.id_proceso = _id_proceso;
END;
$$ LANGUAGE plpgsql;

-- Funcionces almacenadas basicas para tabla proceso.empleado_proceso

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


-- Funcionces almacenadas basicas para tabla poceso.asistencia

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

-- Funcionces almacenadas basicas para tabla permiso.tipo_permiso

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

-- Funcionces almacenadas basicas para tabla permiso.permiso

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
    INSERT INTO permiso.permiso (codigo_empleado, id_tipo_permiso, hora_recibido, fecha_ingreso, fecha_inicio, fecha_final, descripcion, dias, horas, minutos, observacion, respaldo, recibido_por) 
    VALUES (codigo_empleado, id_tipo_permiso, hora_recibido, fecha_ingreso, fecha_inicio, fecha_final, descripcion, dias, horas, minutos, observacion, respaldo, recibido_por);
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

-- Funcionces almacenadas basicas para tabla permiso.permiso_compensatorio_proceso

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


-- Funcionces almacenadas basicas para tabla permiso.permiso_compensatorio_proyecto

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
    WHERE pcp.id_permiso = _id_permiso AND pcp.id_actividad_empleado_proyecto = _id_actividad_empleado_proyecto;
END;
$$ LANGUAGE plpgsql;