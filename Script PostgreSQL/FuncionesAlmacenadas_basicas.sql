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
CREATE FUNCTION actualizar_beneficio (
    id_beneficio INT,
    descripcion_beneficio VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.beneficio 
    SET descripcion_beneficio = descripcion_beneficio 
    WHERE id_beneficio = id_beneficio;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_beneficio (
    id_beneficio INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM empleado.beneficio 
    WHERE id_beneficio = id_beneficio;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_beneficios ()
RETURNS TABLE (
    id_beneficio INT, 
    descripcion_beneficio VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_beneficio, descripcion_beneficio 
    FROM empleado.beneficio;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_beneficio_por_id (
    _id_beneficio INT
)
RETURNS TABLE (
    id_beneficio INT, 
    descripcion_beneficio VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_beneficio, descripcion_beneficio 
    FROM empleado.beneficio
    WHERE id_beneficio = _id_beneficio;
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
    id_tipo_contrato INT,
    descripcion_tipo_contrato VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.tipo_contrato 
    SET descripcion_tipo_contrato = descripcion_tipo_contrato 
    WHERE id_tipo_contrato = id_tipo_contrato;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_tipo_contrato (
    id_tipo_contrato INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM empleado.tipo_contrato 
    WHERE id_tipo_contrato = id_tipo_contrato;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_tipo_contratos ()
RETURNS TABLE (
    id_tipo_contrato INT, 
    descripcion_tipo_contrato VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_tipo_contrato, descripcion_tipo_contrato 
    FROM empleado.tipo_contrato;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_tipo_contrato_por_id (
    _id_tipo_contrato INT
)
RETURNS TABLE (
    id_tipo_contrato INT, 
    descripcion_tipo_contrato VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_tipo_contrato, descripcion_tipo_contrato 
    FROM empleado.tipo_contrato
    WHERE id_tipo_contrato = _id_tipo_contrato;
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
    id_puesto INT,
    descripcion_puesto VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.puesto 
    SET descripcion_puesto = descripcion_puesto 
    WHERE id_puesto = id_puesto;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_puesto (
    id_puesto INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM empleado.puesto 
    WHERE id_puesto = id_puesto;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_puestos ()
RETURNS TABLE (
    id_puesto INT, 
    descripcion_puesto VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_puesto, descripcion_puesto 
    FROM empleado.puesto;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_puesto_por_id (
    _id_puesto INT
)
RETURNS TABLE (
    id_puesto INT, 
    descripcion_puesto VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_puesto, descripcion_puesto 
    FROM empleado.puesto
    WHERE id_puesto = _id_puesto;
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
    id_grado_academico INT,
    descripcion_grado_academico VARCHAR(30),
    especialidad VARCHAR(35)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.grado_academico 
    SET descripcion_grado_academico = descripcion_grado_academico, especialidad = especialidad
    WHERE id_grado_academico = id_grado_academico;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_grado_academico (
    id_grado_academico INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM empleado.grado_academico 
    WHERE id_grado_academico = id_grado_academico;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_grados_academicos ()
RETURNS TABLE (
    id_grado_academico INT, 
    descripcion_grado_academico VARCHAR(30),
    especialidad VARCHAR(35)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_grado_academico, descripcion_grado_academico, especialidad
    FROM empleado.grado_academico;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_grado_academico_por_id (
    _id_grado_academico INT
)
RETURNS TABLE (
    id_grado_academico INT, 
    descripcion_grado_academico VARCHAR(30),
    especialidad VARCHAR(35)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_grado_academico, descripcion_grado_academico, especialidad
    FROM empleado.grado_academico
    WHERE id_grado_academico = _id_grado_academico;
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
    id_institucion INT,
    nombre_institucion VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.institucion 
    SET nombre_institucion = nombre_institucion 
    WHERE id_institucion = id_institucion;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_institucion (
    id_institucion INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM empleado.institucion 
    WHERE id_institucion = id_institucion;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_instituciones ()
RETURNS TABLE (
    id_institucion INT, 
    nombre_institucion VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_institucion, nombre_institucion 
    FROM empleado.institucion;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_institucion_por_id (
    _id_institucion INT
)
RETURNS TABLE (
    id_institucion INT, 
    nombre_institucion VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_institucion, nombre_institucion 
    FROM empleado.institucion
    WHERE id_institucion = _id_institucion;
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
    id_nacionalidad INT,
    nombre_nacionalidad VARCHAR(25),
    pais VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.nacionalidad 
    SET nombre_nacionalidad = nombre_nacionalidad, pais = pais
    WHERE id_nacionalidad = id_nacionalidad;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_nacionalidad (
    id_nacionalidad INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM empleado.nacionalidad 
    WHERE id_nacionalidad = id_nacionalidad;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_nacionalidades ()
RETURNS TABLE (
    id_nacionalidad INT, 
    nombre_nacionalidad VARCHAR(25),
    pais VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_nacionalidad, nombre_nacionalidad, pais
    FROM empleado.nacionalidad;
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
    SELECT id_nacionalidad, nombre_nacionalidad, pais
    FROM empleado.nacionalidad
    WHERE id_nacionalidad = _id_nacionalidad;
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
    id_genero INT,
    nombre_genero VARCHAR(10)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.genero 
    SET nombre_genero = nombre_genero 
    WHERE id_genero = id_genero;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_genero (
    id_genero INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM empleado.genero 
    WHERE id_genero = id_genero;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_generos ()
RETURNS TABLE (
    id_genero INT, 
    nombre_genero VARCHAR(10)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_genero, nombre_genero 
    FROM empleado.genero;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_genero_por_id (
    _id_genero INT
)
RETURNS TABLE (
    id_genero INT, 
    nombre_genero VARCHAR(10)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_genero, nombre_genero 
    FROM empleado.genero
    WHERE id_genero = _id_genero;
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
    id_estado_civil INT,
    descripcion_estado_civil VARCHAR(10)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.estado_civil 
    SET descripcion_estado_civil = descripcion_estado_civil 
    WHERE id_estado_civil = id_estado_civil;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_estado_civil (
    id_estado_civil INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM empleado.estado_civil 
    WHERE id_estado_civil = id_estado_civil;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_estados_civiles ()
RETURNS TABLE (
    id_estado_civil INT, 
    descripcion_estado_civil VARCHAR(10)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_estado_civil, descripcion_estado_civil 
    FROM empleado.estado_civil;
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
    SELECT id_estado_civil, descripcion_estado_civil 
    FROM empleado.estado_civil
    WHERE id_estado_civil = _id_estado_civil;
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
CREATE FUNCTION actualizar_usuario (
    id_usuario INT,
    nombre_usuario VARCHAR(15),
    email VARCHAR(50),
    password VARCHAR(50)
)
RETURNS VOID AS $$
BEGIN
    UPDATE usuario.usuario 
    SET nombre_usuario = nombre_usuario, email = email, password = password
    WHERE id_usuario = id_usuario;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_usuario (
    id_usuario INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM usuario.usuario 
    WHERE id_usuario = id_usuario;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_usuarios ()
RETURNS TABLE (
    id_usuario INT, 
    nombre_usuario VARCHAR(15),
    email VARCHAR(50),
    password VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_usuario, nombre_usuario, email, password
    FROM usuario.usuario;
END;
$$ LANGUAGE plpgsql;

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
    SELECT id_usuario, nombre_usuario, email, password
    FROM usuario.usuario
    WHERE id_usuario = _id_usuario;
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
    id_rol INT,
    nombre_rol VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    UPDATE usuario.rol 
    SET nombre_rol = nombre_rol 
    WHERE id_rol = id_rol;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_rol (
    id_rol INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM usuario.rol 
    WHERE id_rol = id_rol;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_roles ()
RETURNS TABLE (
    id_rol INT, 
    nombre_rol VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_rol, nombre_rol 
    FROM usuario.rol;
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
    SELECT id_rol, nombre_rol 
    FROM usuario.rol
    WHERE id_rol = _id_rol;
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
    id_permiso_usuario INT,
    nombre_permiso VARCHAR(70)
)
RETURNS VOID AS $$
BEGIN
    UPDATE usuario.permiso_usuario 
    SET nombre_permiso = nombre_permiso 
    WHERE id_permiso_usuario = id_permiso_usuario;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_permiso_usuario (
    id_permiso_usuario INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM usuario.permiso_usuario 
    WHERE id_permiso_usuario = id_permiso_usuario;
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
    SELECT id_permiso_usuario, nombre_permiso 
    FROM usuario.permiso_usuario;
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
    SELECT id_permiso_usuario, nombre_permiso 
    FROM usuario.permiso_usuario
    WHERE id_permiso_usuario = _id_permiso_usuario;
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
    id_permiso_usuario INT,
    id_rol INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM usuario.rol_permiso_usuario 
    WHERE id_permiso_usuario = id_permiso_usuario AND id_rol = id_rol;
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
    SELECT id_rol, id_permiso_usuario
    FROM usuario.rol_permiso_usuario;
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
    id_usuario INT,
    id_rol INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM usuario.usuario_rol 
    WHERE id_usuario = id_usuario AND id_rol = id_rol;
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
    SELECT id_usuario, id_rol
    FROM usuario.usuario_rol;
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
    UPDATE empleado.empleado 
    SET id_nacionalidad = id_nacionalidad, id_genero = id_genero, id_estado_civil = id_estado_civil, id_usuario = id_usuario, dni = dni, nombres = nombres, apellidos = apellidos, fecha_nacimiento = fecha_nacimiento, correo = correo
    WHERE codigo_empleado = codigo_empleado;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_empleado (
    codigo_empleado INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM empleado.empleado 
    WHERE codigo_empleado = codigo_empleado;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_empleados ()
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
    SELECT codigo_empleado, id_nacionalidad, id_genero, id_estado_civil, id_usuario, dni, nombres, apellidos, fecha_nacimiento, correo, estado_empleado
    FROM empleado.empleado;
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
    SELECT codigo_empleado, id_nacionalidad, id_genero, id_estado_civil, id_usuario, dni, nombres, apellidos, fecha_nacimiento, correo, estado_empleado
    FROM empleado.empleado
    WHERE codigo_empleado = _codigo_empleado;
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
CREATE FUNCTION actualizar_operador_telefonico (
    id_operador_telefonico INT,
    nombre_operador VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.operador_telefonico 
    SET nombre_operador = nombre_operador 
    WHERE id_operador_telefonico = id_operador_telefonico;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_operador_telefonico (
    id_operador_telefonico INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM empleado.operador_telefonico 
    WHERE id_operador_telefonico = id_operador_telefonico;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_operadores_telefonicos ()
RETURNS TABLE (
    id_operador_telefonico INT, 
    nombre_operador VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_operador_telefonico, nombre_operador 
    FROM empleado.operador_telefonico;
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
    SELECT id_operador_telefonico, nombre_operador 
    FROM empleado.operador_telefonico
    WHERE id_operador_telefonico = _id_operador_telefonico;
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
    id_telefono INT,
    id_operador_telefonico INT,
    codigo_empleado INT,
    telefono VARCHAR(9)
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.telefono 
    SET id_operador_telefonico = id_operador_telefonico, codigo_empleado = codigo_empleado, telefono = telefono
    WHERE id_telefono = id_telefono;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_telefono (
    id_telefono INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM empleado.telefono 
    WHERE id_telefono = id_telefono;
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
    SELECT id_telefono, id_operador_telefonico, codigo_empleado, telefono
    FROM empleado.telefono;
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
    SELECT id_telefono, id_operador_telefonico, codigo_empleado, telefono
    FROM empleado.telefono
    WHERE id_telefono = _id_telefono;
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
    codigo_empleado INT, -- llave primaria
    id_grado_academico INT, -- llave primaria
    id_institucion INT, -- llave primaria
    anio_obtencion DATE
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.empleado_grado_academico 
    SET anio_obtencion = anio_obtencion
    WHERE codigo_empleado = codigo_empleado AND id_grado_academico = id_grado_academico AND id_institucion = id_institucion;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_empleado_grado_academico (
    codigo_empleado INT, -- llave primaria
    id_grado_academico INT, -- llave primaria
    id_institucion INT -- llave primaria
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM empleado.empleado_grado_academico 
    WHERE codigo_empleado = codigo_empleado AND id_grado_academico = id_grado_academico AND id_institucion = id_institucion;
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
    SELECT codigo_empleado, id_grado_academico, id_institucion, anio_obtencion
    FROM empleado.empleado_grado_academico;
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
    SELECT codigo_empleado, id_grado_academico, id_institucion, anio_obtencion
    FROM empleado.empleado_grado_academico
    WHERE codigo_empleado = _codigo_empleado AND id_grado_academico = _id_grado_academico AND id_institucion = _id_institucion;
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
    id_departamento INT,
    nombre_departamento VARCHAR(30),
    codigo_empleado_jefe INT
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.departamento 
    SET nombre_departamento = nombre_departamento, codigo_empleado_jefe = codigo_empleado_jefe
    WHERE id_departamento = id_departamento;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_departamento (
    id_departamento INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM empleado.departamento 
    WHERE id_departamento = id_departamento;
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
    SELECT id_departamento, nombre_departamento, codigo_empleado_jefe
    FROM empleado.departamento;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_departamento_por_id (
    _id_departamento INT
)
RETURNS TABLE (
    id_departamento INT, 
    nombre_departamento VARCHAR(30),
    codigo_empleado_jefe INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_departamento, nombre_departamento, codigo_empleado_jefe
    FROM empleado.departamento
    WHERE id_departamento = _id_departamento;
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
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.contrato_laboral 
    SET codigo_empleado = codigo_empleado, id_tipo_contrato = id_tipo_contrato, id_puesto = id_puesto, id_departamento = id_departamento, id_beneficio = id_beneficio, numero_contrato = numero_contrato, fecha_inicio = fecha_inicio, fecha_finalizacion = fecha_finalizacion, salario = salario, hora_entrada = hora_entrada, hora_salida = hora_salida, estado_contrato = estado_contrato
    WHERE id_contrato_laboral = id_contrato_laboral;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_contrato_laboral (
    id_contrato_laboral INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM empleado.contrato_laboral 
    WHERE id_contrato_laboral = id_contrato_laboral;
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
    SELECT id_contrato_laboral, codigo_empleado, id_tipo_contrato, id_puesto, id_departamento, id_beneficio, numero_contrato, fecha_inicio, fecha_finalizacion, salario, hora_entrada, hora_salida, estado_contrato
    FROM empleado.contrato_laboral;
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
    SELECT id_contrato_laboral, codigo_empleado, id_tipo_contrato, id_puesto, id_departamento, id_beneficio, numero_contrato, fecha_inicio, fecha_finalizacion, salario, hora_entrada, hora_salida, estado_contrato
    FROM empleado.contrato_laboral
    WHERE id_contrato_laboral = _id_contrato_laboral;
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
    id_numero_periodo INT,
    numero_periodo INT
)
RETURNS VOID AS $$
BEGIN
    UPDATE proyecto.numero_periodo 
    SET numero_periodo = numero_periodo 
    WHERE id_numero_periodo = id_numero_periodo;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_numero_periodo (
    id_numero_periodo INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proyecto.numero_periodo 
    WHERE id_numero_periodo = id_numero_periodo;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_numeros_periodos ()
RETURNS TABLE (
    id_numero_periodo INT, 
    numero_periodo INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_numero_periodo, numero_periodo 
    FROM proyecto.numero_periodo;
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
    SELECT id_numero_periodo, numero_periodo 
    FROM proyecto.numero_periodo
    WHERE id_numero_periodo = _id_numero_periodo;
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
    id_periodo_academico INT,
    id_numero_periodo INT,
    anio INT
)
RETURNS VOID AS $$
BEGIN
    UPDATE proyecto.periodo_academico 
    SET id_numero_periodo = id_numero_periodo, anio = anio
    WHERE id_periodo_academico = id_periodo_academico;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_periodo_academico (
    id_periodo_academico INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proyecto.periodo_academico 
    WHERE id_periodo_academico = id_periodo_academico;
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
    SELECT id_periodo_academico, id_numero_periodo, anio 
    FROM proyecto.periodo_academico;
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
    SELECT id_periodo_academico, id_numero_periodo, anio 
    FROM proyecto.periodo_academico
    WHERE id_periodo_academico = _id_periodo_academico;
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

-- Funcion almacenada de actualizar
CREATE FUNCTION actualizar_cambio_horario (
    id_cambio_horario INT,
    id_contrato_laboral INT,
    id_periodo_academico INT,
    nueva_hora_entrada TIME,
    nueva_hora_salida TIME,
    nota VARCHAR(350),
    fecha_cambio DATE
)
RETURNS VOID AS $$
BEGIN
    UPDATE empleado.cambio_horario 
    SET id_contrato_laboral = id_contrato_laboral, id_periodo_academico = id_periodo_academico, nueva_hora_entrada = nueva_hora_entrada, nueva_hora_salida = nueva_hora_salida, nota = nota, fecha_cambio = fecha_cambio
    WHERE id_cambio_horario = id_cambio_horario;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_cambio_horario (
    id_cambio_horario INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM empleado.cambio_horario 
    WHERE id_cambio_horario = id_cambio_horario;
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
    SELECT id_cambio_horario, id_contrato_laboral, id_periodo_academico, nueva_hora_entrada, nueva_hora_salida, nota, fecha_cambio
    FROM empleado.cambio_horario;
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
    SELECT id_cambio_horario, id_contrato_laboral, id_periodo_academico, nueva_hora_entrada, nueva_hora_salida, nota, fecha_cambio
    FROM empleado.cambio_horario
    WHERE id_cambio_horario = _id_cambio_horario;
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
CREATE FUNCTION actualizar_dimension (
    id_dimension INT,
    nombre_dimension VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    UPDATE proyecto.dimension 
    SET nombre_dimension = nombre_dimension 
    WHERE id_dimension = id_dimension;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_dimension (
    id_dimension INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proyecto.dimension 
    WHERE id_dimension = id_dimension;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar todos
CREATE FUNCTION consultar_dimensiones ()
RETURNS TABLE (
    id_dimension INT, 
    nombre_dimension VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_dimension, nombre_dimension 
    FROM proyecto.dimension;
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
    SELECT id_dimension, nombre_dimension 
    FROM proyecto.dimension
    WHERE id_dimension = _id_dimension;
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
    id_tipo_proyecto INT,
    nombre_tipo_proyecto VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    UPDATE proyecto.tipo_proyecto 
    SET nombre_tipo_proyecto = nombre_tipo_proyecto 
    WHERE id_tipo_proyecto = id_tipo_proyecto;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_tipo_proyecto (
    id_tipo_proyecto INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proyecto.tipo_proyecto 
    WHERE id_tipo_proyecto = id_tipo_proyecto;
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
    SELECT id_tipo_proyecto, nombre_tipo_proyecto 
    FROM proyecto.tipo_proyecto;
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
    SELECT id_tipo_proyecto, nombre_tipo_proyecto 
    FROM proyecto.tipo_proyecto
    WHERE id_tipo_proyecto = _id_tipo_proyecto;
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
    id_estado INT,
    nombre_estado VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    UPDATE proyecto.estado 
    SET nombre_estado = nombre_estado 
    WHERE id_estado = id_estado;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_estado (
    id_estado INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proyecto.estado 
    WHERE id_estado = id_estado;
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
    SELECT id_estado, nombre_estado 
    FROM proyecto.estado;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_estado_por_id (
    _id_estado INT
)
RETURNS TABLE (
    id_estado INT, 
    nombre_estado VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_estado, nombre_estado 
    FROM proyecto.estado
    WHERE id_estado = _id_estado;
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
    id_proyecto INT,
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
    UPDATE proyecto.proyecto 
    SET id_tipo_proyecto = id_tipo_proyecto, id_periodo_academico = id_periodo_academico, id_departamento = id_departamento, id_dimension = id_dimension, id_estado = id_estado, nombre_proyecto = nombre_proyecto, fecha_inicio = fecha_inicio, fecha_fin = fecha_fin
    WHERE id_proyecto = id_proyecto;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_proyecto (
    id_proyecto INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proyecto.proyecto 
    WHERE id_proyecto = id_proyecto;
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
    SELECT id_proyecto, id_tipo_proyecto, id_periodo_academico, id_departamento, id_dimension, id_estado, nombre_proyecto, fecha_inicio, fecha_fin
    FROM proyecto.proyecto;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_proyecto_por_id (
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
    SELECT id_proyecto, id_tipo_proyecto, id_periodo_academico, id_departamento, id_dimension, id_estado, nombre_proyecto, fecha_inicio, fecha_fin
    FROM proyecto.proyecto
    WHERE id_proyecto = _id_proyecto;
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
    id_actividad INT,
    id_proyecto INT,
    nombre_actividad VARCHAR(70),
    fecha_actividad DATE
)
RETURNS VOID AS $$
BEGIN
    UPDATE proyecto.actividad 
    SET id_proyecto = id_proyecto, nombre_actividad = nombre_actividad, fecha_actividad = fecha_actividad
    WHERE id_actividad = id_actividad;
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
    SELECT id_actividad, id_proyecto, nombre_actividad, fecha_actividad
    FROM proyecto.actividad;
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
    SELECT id_actividad, id_proyecto, nombre_actividad, fecha_actividad
    FROM proyecto.actividad
    WHERE id_actividad = _id_actividad;
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
    id_rol_proyecto INT,
    nombre_rol VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    UPDATE proyecto.rol_proyecto 
    SET nombre_rol = nombre_rol 
    WHERE id_rol_proyecto = id_rol_proyecto;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_rol_proyecto (
    id_rol_proyecto INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proyecto.rol_proyecto 
    WHERE id_rol_proyecto = id_rol_proyecto;
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
    SELECT id_rol_proyecto, nombre_rol 
    FROM proyecto.rol_proyecto;
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
    SELECT id_rol_proyecto, nombre_rol 
    FROM proyecto.rol_proyecto
    WHERE id_rol_proyecto = _id_rol_proyecto;
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
    id_empleado_proyecto INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proyecto.empleado_proyecto 
    WHERE id_empleado_proyecto = id_empleado_proyecto;
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
    SELECT id_empleado_proyecto, codigo_empleado, id_proyecto, id_rol_proyecto
    FROM proyecto.empleado_proyecto;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_empleado_proyecto_por_id (
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
    SELECT id_empleado_proyecto, codigo_empleado, id_proyecto, id_rol_proyecto
    FROM proyecto.empleado_proyecto
    WHERE id_empleado_proyecto = _id_empleado_proyecto;
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
    id_actividad_empleado_proyecto INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proyecto.actividad_empleado_proyecto 
    WHERE id_actividad_empleado_proyecto = id_actividad_empleado_proyecto;
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
    SELECT id_actividad_empleado_proyecto, id_actividad, id_empleado_proyecto, id_estado, horas_trabajadas, dias_compensatorios, medio_verificacion
    FROM proyecto.actividad_empleado_proyecto;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_actividad_empleado_proyecto_por_id (
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
    SELECT id_actividad_empleado_proyecto, id_actividad, id_empleado_proyecto, id_estado, horas_trabajadas, dias_compensatorios, medio_verificacion
    FROM proyecto.actividad_empleado_proyecto
    WHERE id_actividad_empleado_proyecto = _id_actividad_empleado_proyecto;
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
    id_nombre_prueba INT,
    nombre_prueba VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE proceso.nombre_prueba 
    SET nombre_prueba = nombre_prueba 
    WHERE id_nombre_prueba = id_nombre_prueba;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_nombre_prueba (
    id_nombre_prueba INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proceso.nombre_prueba 
    WHERE id_nombre_prueba = id_nombre_prueba;
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
    SELECT id_nombre_prueba, nombre_prueba 
    FROM proceso.nombre_prueba;
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
    SELECT id_nombre_prueba, nombre_prueba 
    FROM proceso.nombre_prueba
    WHERE id_nombre_prueba = _id_nombre_prueba;
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
    id_rol_proceso INT,
    descripcion_rol VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    UPDATE proceso.rol_proceso 
    SET descripcion_rol = descripcion_rol 
    WHERE id_rol_proceso = id_rol_proceso;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_rol_proceso (
    id_rol_proceso INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proceso.rol_proceso 
    WHERE id_rol_proceso = id_rol_proceso;
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
    SELECT id_rol_proceso, descripcion_rol 
    FROM proceso.rol_proceso;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_rol_proceso_por_id (
    _id_rol_proceso INT
)
RETURNS TABLE (
    id_rol_proceso INT, 
    descripcion_rol VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_rol_proceso, descripcion_rol 
    FROM proceso.rol_proceso
    WHERE id_rol_proceso = _id_rol_proceso;
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
    id_descripcion INT,
    nombre_proceso VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE proceso.descripcion 
    SET nombre_proceso = nombre_proceso 
    WHERE id_descripcion = id_descripcion;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_descripcion (
    id_descripcion INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proceso.descripcion 
    WHERE id_descripcion = id_descripcion;
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
    SELECT id_descripcion, nombre_proceso 
    FROM proceso.descripcion;
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
    SELECT id_descripcion, nombre_proceso 
    FROM proceso.descripcion
    WHERE id_descripcion = _id_descripcion;
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
    id_estado_proceso INT,
    nombre_estado_proceso VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE proceso.estado_proceso 
    SET nombre_estado_proceso = nombre_estado_proceso 
    WHERE id_estado_proceso = id_estado_proceso;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_estado_proceso (
    id_estado_proceso INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proceso.estado_proceso 
    WHERE id_estado_proceso = id_estado_proceso;
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
    SELECT id_estado_proceso, nombre_estado_proceso 
    FROM proceso.estado_proceso;
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
    SELECT id_estado_proceso, nombre_estado_proceso 
    FROM proceso.estado_proceso
    WHERE id_estado_proceso = _id_estado_proceso;
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
    id_proceso INT,
    id_descripcion INT,
    id_estado_proceso INT,
    fecha DATE,
    cantidad_compensatoria INT
)
RETURNS VOID AS $$
BEGIN
    UPDATE proceso.proceso 
    SET id_descripcion = id_descripcion, id_estado_proceso = id_estado_proceso, fecha = fecha, cantidad_compensatoria = cantidad_compensatoria
    WHERE id_proceso = id_proceso;
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
    SELECT id_proceso, id_descripcion, id_estado_proceso, fecha, cantidad_compensatoria
    FROM proceso.proceso;
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
    SELECT id_proceso, id_descripcion, id_estado_proceso, fecha, cantidad_compensatoria
    FROM proceso.proceso
    WHERE id_proceso = _id_proceso;
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
    id_empleado_proceso INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proceso.empleado_proceso 
    WHERE id_empleado_proceso = id_empleado_proceso;
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
    SELECT id_empleado_proceso, codigo_empleado, id_rol_proceso, id_proceso
    FROM proceso.empleado_proceso;
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
    SELECT id_empleado_proceso, codigo_empleado, id_rol_proceso, id_proceso
    FROM proceso.empleado_proceso
    WHERE id_empleado_proceso = _id_empleado_proceso;
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
    id_empleado_proceso INT,
    id_nombre_prueba INT,
    estado BOOLEAN
)
RETURNS VOID AS $$
BEGIN
    UPDATE proceso.asistencia 
    SET estado = estado
    WHERE id_empleado_proceso = id_empleado_proceso AND id_nombre_prueba = id_nombre_prueba;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_asistencia (
    id_empleado_proceso INT,
    id_nombre_prueba INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM proceso.asistencia 
    WHERE id_empleado_proceso = id_empleado_proceso AND id_nombre_prueba = id_nombre_prueba;
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
    SELECT id_empleado_proceso, id_nombre_prueba, estado
    FROM proceso.asistencia;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_asistencia_por_id (
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
    SELECT id_empleado_proceso, id_nombre_prueba, estado
    FROM proceso.asistencia
    WHERE id_empleado_proceso = _id_empleado_proceso AND id_nombre_prueba = _id_nombre_prueba;
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
    id_tipo_permiso INT,
    nombre_tipo_permiso VARCHAR(30)
)
RETURNS VOID AS $$
BEGIN
    UPDATE permiso.tipo_permiso 
    SET nombre_tipo_permiso = nombre_tipo_permiso 
    WHERE id_tipo_permiso = id_tipo_permiso;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_tipo_permiso (
    id_tipo_permiso INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM permiso.tipo_permiso 
    WHERE id_tipo_permiso = id_tipo_permiso;
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
    SELECT id_tipo_permiso, nombre_tipo_permiso 
    FROM permiso.tipo_permiso;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_tipo_permiso_por_id (
    _id_tipo_permiso INT
)
RETURNS TABLE (
    id_tipo_permiso INT, 
    nombre_tipo_permiso VARCHAR(30)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_tipo_permiso, nombre_tipo_permiso 
    FROM permiso.tipo_permiso
    WHERE id_tipo_permiso = _id_tipo_permiso;
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
)
RETURNS VOID AS $$
BEGIN
    UPDATE permiso.permiso 
    SET codigo_empleado = codigo_empleado, id_tipo_permiso = id_tipo_permiso, hora_recibido = hora_recibido, fecha_ingreso = fecha_ingreso, fecha_inicio = fecha_inicio, fecha_final = fecha_final, descripcion = descripcion, dias = dias, horas = horas, minutos = minutos, observacion = observacion, respaldo = respaldo, recibido_por = recibido_por
    WHERE id_permiso = id_permiso;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_permiso (
    id_permiso INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM permiso.permiso 
    WHERE id_permiso = id_permiso;
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
    SELECT id_permiso, codigo_empleado, id_tipo_permiso, hora_recibido, fecha_ingreso, fecha_inicio, fecha_final, descripcion, dias, horas, minutos, observacion, respaldo, recibido_por
    FROM permiso.permiso;
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
    SELECT id_permiso, codigo_empleado, id_tipo_permiso, hora_recibido, fecha_ingreso, fecha_inicio, fecha_final, descripcion, dias, horas, minutos, observacion, respaldo, recibido_por
    FROM permiso.permiso
    WHERE id_permiso = _id_permiso;
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
    id_permiso INT,
    id_proceso INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM permiso.permiso_compensatorio_proceso 
    WHERE id_permiso = id_permiso AND id_proceso = id_proceso;
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
    SELECT id_permiso, id_proceso
    FROM permiso.permiso_compensatorio_proceso;
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
    SELECT id_permiso, id_proceso
    FROM permiso.permiso_compensatorio_proceso
    WHERE id_permiso = _id_permiso AND id_proceso = _id_proceso;
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

-- Funcion almacenada de eliminar
CREATE FUNCTION eliminar_permiso_compensatorio_proyecto (
    id_permiso INT,
    id_actividad_empleado_proyecto INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM permiso.permiso_compensatorio_proyecto 
    WHERE id_permiso = id_permiso AND id_actividad_empleado_proyecto = id_actividad_empleado_proyecto;
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
    SELECT id_permiso, id_actividad_empleado_proyecto
    FROM permiso.permiso_compensatorio_proyecto;
END;
$$ LANGUAGE plpgsql;

-- Funcion almacenada de consultar por id
CREATE FUNCTION consultar_permiso_compensatorio_proyecto_por_id (
    _id_permiso INT,
    _id_actividad_empleado_proyecto INT
)
RETURNS TABLE (
    id_permiso INT, 
    id_actividad_empleado_proyecto INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT id_permiso, id_actividad_empleado_proyecto
    FROM permiso.permiso_compensatorio_proyecto
    WHERE id_permiso = _id_permiso AND id_actividad_empleado_proyecto = _id_actividad_empleado_proyecto;
END;
$$ LANGUAGE plpgsql;