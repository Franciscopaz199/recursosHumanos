
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