
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
VALUES (1, '99999999', 1);
INSERT INTO empleado.telefono (codigo_empleado, telefono, id_operador_telefonico)
VALUES (1, '88888888', 2);
INSERT INTO empleado.telefono (codigo_empleado, telefono, id_operador_telefonico)
VALUES (2, '77777777', 1);
INSERT INTO empleado.telefono (codigo_empleado, telefono, id_operador_telefonico)
VALUES (2, '66666666', 2);
INSERT INTO empleado.telefono (codigo_empleado, telefono, id_operador_telefonico)
VALUES (3, '55555555', 1);
INSERT INTO empleado.telefono (codigo_empleado, telefono, id_operador_telefonico)
VALUES (3, '44444444', 2);

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
VALUES (1, 1, '08:00:00', '2020-01-01', '2020-01-01', '2020-01-01', 'Descripcion', 1, 1, 1, 'Observacion', TRUE, 1);
INSERT INTO permiso.permiso (codigo_empleado, id_tipo_permiso, hora_recibido, fecha_ingreso, fecha_inicio, fecha_final, descripcion, dias, horas, minutos, observacion, respaldo, recibido_por)
VALUES (2, 2, '08:00:00', '2020-01-01', '2020-01-01', '2020-01-01', 'Descripcion', 1, 1, 1, 'Observacion', TRUE, 2);
INSERT INTO permiso.permiso (codigo_empleado, id_tipo_permiso, hora_recibido, fecha_ingreso, fecha_inicio, fecha_final, descripcion, dias, horas, minutos, observacion, respaldo, recibido_por)
VALUES (3, 3, '08:00:00', '2020-01-01', '2020-01-01', '2020-01-01', 'Descripcion', 1, 1, 1, 'Observacion', TRUE, 3);

-- 1 Insert por cada permiso.permiso en la tabla permiso.permiso_compesatorio_proceso
INSERT INTO permiso.permiso_compesatorio_proceso (id_permiso, id_proceso)
VALUES (1, 1);
INSERT INTO permiso.permiso_compesatorio_proceso (id_permiso, id_proceso)
VALUES (2, 2);
INSERT INTO permiso.permiso_compesatorio_proceso (id_permiso, id_proceso)
VALUES (3, 3);

-- 1 Insert por cada permiso.permiso en la tabla permiso.permiso_compesatorio_proyecto
INSERT INTO permiso.permiso_compesatorio_proyecto (id_permiso, id_actividad_empleado_proyecto)
VALUES (1, 1);
INSERT INTO permiso.permiso_compesatorio_proyecto (id_permiso, id_actividad_empleado_proyecto)
VALUES (2, 2);
INSERT INTO permiso.permiso_compesatorio_proyecto (id_permiso, id_actividad_empleado_proyecto)
VALUES (3, 3);
