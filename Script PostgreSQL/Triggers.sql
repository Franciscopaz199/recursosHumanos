
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
        VALUES (NEW.id_proyecto, 1, NEW.codigo_empleado, row_to_json(NEW));
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
-- auditoria a la tabla permiso.permiso_compesatorio_proceso
CREATE TABLE auditoria_permiso_compesatorio_proceso (
    id_registro SERIAL PRIMARY KEY,
    id_permiso INT,
    id_proceso INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    CONSTRAINT fk_auditoria_permiso_compesatorio_proceso_tipo_cambio FOREIGN KEY (id_tipo_cambio) 
        REFERENCES tipo_cambio (id_tipo_cambio),
    CONSTRAINT fk_auditoria_permiso_compesatorio_proceso_permiso FOREIGN KEY (id_permiso)
        REFERENCES permiso.permiso (id_permiso),
    CONSTRAINT fk_auditoria_permiso_compesatorio_proceso_proceso FOREIGN KEY (id_proceso)
        REFERENCES proceso.proceso (id_proceso)
);

-- TRIGGER PARA AUDITORIA DE LA TABLA permiso.permiso_compesatorio_proceso
CREATE OR REPLACE FUNCTION auditoria_permiso_compesatorio_proceso()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO auditoria_permiso_compesatorio_proceso (id_permiso, id_proceso, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.id_permiso, NEW.id_proceso, 1, row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO auditoria_permiso_compesatorio_proceso (id_permiso, id_proceso, id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (NEW.id_permiso, NEW.id_proceso, 2, row_to_json(OLD), row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO auditoria_permiso_compesatorio_proceso (id_permiso, id_proceso, id_tipo_cambio, valores_anteriores)
        VALUES (OLD.id_permiso, OLD.id_proceso, 3, row_to_json(OLD));
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_auditoria_permiso_compesatorio_proceso
AFTER INSERT OR UPDATE OR DELETE ON permiso.permiso_compesatorio_proceso
FOR EACH ROW
EXECUTE FUNCTION auditoria_permiso_compesatorio_proceso();

------------------------------------------------------------------------------------------------------------------
-- auditoria a la tabla permiso.permiso_compesatorio_proyecto
CREATE TABLE auditoria_permiso_compesatorio_proyecto (
    id_registro SERIAL PRIMARY KEY,
    id_permiso INT,
    id_actividad_empleado_proyecto INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_cambio INT,
    valores_anteriores JSONB,
    valores_nuevos JSONB,
    CONSTRAINT fk_auditoria_permiso_compesatorio_proyecto_tipo_cambio FOREIGN KEY (id_tipo_cambio) 
        REFERENCES tipo_cambio (id_tipo_cambio),
    CONSTRAINT fk_auditoria_permiso_compesatorio_proyecto_permiso FOREIGN KEY (id_permiso)
        REFERENCES permiso.permiso (id_permiso),
    CONSTRAINT fk_auditoria_permiso_compesatorio_proyecto_actividad_empleado_proyecto FOREIGN KEY (id_actividad_empleado_proyecto)
        REFERENCES proyecto.actividad_empleado_proyecto (id_actividad_empleado_proyecto)
);

-- TRIGGER PARA AUDITORIA DE LA TABLA permiso.permiso_compesatorio_proyecto
CREATE OR REPLACE FUNCTION auditoria_permiso_compesatorio_proyecto()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO auditoria_permiso_compesatorio_proyecto (id_permiso, id_actividad_empleado_proyecto, id_tipo_cambio, valores_nuevos)
        VALUES (NEW.id_permiso, NEW.id_actividad_empleado_proyecto, 1, row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO auditoria_permiso_compesatorio_proyecto (id_permiso, id_actividad_empleado_proyecto, id_tipo_cambio, valores_anteriores, valores_nuevos)
        VALUES (NEW.id_permiso, NEW.id_actividad_empleado_proyecto, 2, row_to_json(OLD), row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO auditoria_permiso_compesatorio_proyecto (id_permiso, id_actividad_empleado_proyecto, id_tipo_cambio, valores_anteriores)
        VALUES (OLD.id_permiso, OLD.id_actividad_empleado_proyecto, 3, row_to_json(OLD));
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_auditoria_permiso_compesatorio_proyecto
AFTER INSERT OR UPDATE OR DELETE ON permiso.permiso_compesatorio_proyecto
FOR EACH ROW
EXECUTE FUNCTION auditoria_permiso_compesatorio_proyecto();
