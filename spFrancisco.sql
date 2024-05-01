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


