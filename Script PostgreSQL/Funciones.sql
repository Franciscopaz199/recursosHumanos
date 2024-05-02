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