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





