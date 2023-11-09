USE [GD2C2023]
GO

-- DROP FK
IF OBJECT_ID('BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIPO_OPERACION', 'U') IS NOT NULL
    DROP TABLE BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIPO_OPERACION
GO

IF OBJECT_ID('BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_BARRIO', 'U') IS NOT NULL
    DROP TABLE BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_BARRIO
GO

IF OBJECT_ID('BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_AMBIENTES', 'U') IS NOT NULL
    DROP TABLE BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_AMBIENTES
GO

IF OBJECT_ID('BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO', 'U') IS NOT NULL
    DROP TABLE BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO
GO

IF OBJECT_ID('BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_ANUNCIO_FECHA_ALTA', 'U') IS NOT NULL
    DROP TABLE BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_ANUNCIO_FECHA_ALTA
GO

IF OBJECT_ID('BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_ANUNCIO_FECHA_BAJA', 'U') IS NOT NULL
    DROP TABLE BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_ANUNCIO_FECHA_BAJA
GO

IF OBJECT_ID('BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_HECHO_ANUNCIO', 'U') IS NOT NULL
    DROP TABLE BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_HECHO_ANUNCIO
GO

----DROP FUNCTIONS
IF OBJECT_ID('BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.FX_OBTENER_CUATRIMESTRE') IS NOT NULL
	DROP FUNCTION BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.FX_OBTENER_CUATRIMESTRE
GO

--DROP VIEWS
IF OBJECT_ID('BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.DURACION_PROMEDIO_ANUNCIOS', 'V') IS NOT NULL
	DROP VIEW BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.DURACION_PROMEDIO_ANUNCIOS
GO

--DROP ESQUEMA
IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO')
  DROP SCHEMA BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO
GO

-- CREO ESQUEMA
CREATE SCHEMA BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO
GO

CREATE TABLE BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIPO_OPERACION(
	id INT IDENTITY(1,1) NOT NULL,
    descripcion NVARCHAR(100)
);
GO

CREATE TABLE BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_BARRIO(
	id INT IDENTITY(1,1) NOT NULL,
	descripcion NVARCHAR(255)
);
GO

CREATE TABLE BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_AMBIENTES(
	id INT IDENTITY(1,1) NOT NULL,
	descripcion NVARCHAR(100)
);
GO

CREATE TABLE BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO(
	id INT IDENTITY(1,1) NOT NULL,
	anio INT,
    cuatrimestre INT
);
GO

CREATE TABLE BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_ANUNCIO_FECHA_ALTA(
	id INT IDENTITY(1,1) NOT NULL,
    descripcion DATETIME
);
GO

CREATE TABLE BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_ANUNCIO_FECHA_BAJA(
	id INT IDENTITY(1,1) NOT NULL,
    descripcion DATETIME
);
GO

CREATE TABLE BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_HECHO_ANUNCIO(
    anuncio_id INT,
	tipo_operacion_id INT,
    barrio_id INT,
    ambientes_id INT,
    tiempo_id INT,
    fecha_alta_id INT,
    fecha_baja_id INT,
    promedio_dias INT
);
GO

CREATE FUNCTION BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.FX_OBTENER_CUATRIMESTRE(@FECHA DATETIME)
    RETURNS INT
AS
BEGIN
    DECLARE @RESULTADO INT = 1

    IF MONTH(@FECHA) > 4
        SET @RESULTADO = 2
    ELSE IF MONTH(@FECHA) > 8
        SET @RESULTADO = 3

    RETURN @RESULTADO
END
GO

--------DIM_TIEMPO----------
INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO (anio, cuatrimestre)
VALUES (2021,01)

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO (anio, cuatrimestre)
VALUES (2021,02)

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO (anio, cuatrimestre)
VALUES (2021,03)

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO (anio, cuatrimestre)
VALUES (2022,01)

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO (anio, cuatrimestre)
VALUES (2022,02)

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO (anio, cuatrimestre)
VALUES (2022,03)

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO (anio, cuatrimestre)
VALUES (2023,01)

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO (ANIO, cuatrimestre)
VALUES (2023,02)

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO (ANIO, cuatrimestre)
VALUES (2023,03)

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO (anio, cuatrimestre)
VALUES (2024,01)

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO (ANIO, cuatrimestre)
VALUES (2024,02)

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO (ANIO, cuatrimestre)
VALUES (2024,03)

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO (anio, cuatrimestre)
VALUES (2027,01)

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO (ANIO, cuatrimestre)
VALUES (2027,02)

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO (ANIO, cuatrimestre)
VALUES (2027,03)

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_AMBIENTES(descripcion)
SELECT * FROM LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.AMBIENTES

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_BARRIO(descripcion)
SELECT b.descripcion FROM LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BARRIO b

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_ANUNCIO_FECHA_ALTA(descripcion)
SELECT DISTINCT a.fecha_publicacion FROM LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.ANUNCIO a

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_ANUNCIO_FECHA_BAJA(descripcion)
SELECT DISTINCT a.fecha_finalizacion FROM LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.ANUNCIO a

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIPO_OPERACION(descripcion)
SELECT DISTINCT a.tipo_operacion FROM LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.ANUNCIO a

INSERT INTO BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_HECHO_ANUNCIO(anuncio_id, tipo_operacion_id, barrio_id, ambientes_id, tiempo_id, fecha_alta_id, fecha_baja_id, promedio_dias)
SELECT 
    an.codigo as [codigo anuncio],
    op.id as [operacionId],
    barrio_id as [barrioId],
    dim_amb.id as [ambienteId], 
    dim_t.id as [tiempoId], 
    fa.id as [fechaAltaId],
    fb.id as [fechaBajaId],
    DATEDIFF(DAY,an.fecha_publicacion, an.fecha_finalizacion) as [promedioDiasAnuncio]
FROM LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.ANUNCIO an
left join LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.INMUEBLE i 
ON an.inmueble_id = i.codigo
left join LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BARRIO b 
ON i.barrio_id = b.id 
left join BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIPO_OPERACION op 
ON an.tipo_operacion = op.descripcion  
left join BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_AMBIENTES dim_amb 
ON i.ambientes = dim_amb.descripcion 
right join BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_ANUNCIO_FECHA_ALTA fa 
ON fa.descripcion = an.fecha_publicacion
right join BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_ANUNCIO_FECHA_BAJA fb 
ON fb.descripcion = an.fecha_finalizacion
join BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO dim_t 
ON dim_t.anio = YEAR(an.fecha_publicacion) 
AND dim_t.cuatrimestre = BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.FX_OBTENER_CUATRIMESTRE(an.fecha_publicacion)

--Cantidad de registros que deben tener cuatrimestre distinto de 1
/*
select 
    month(an.fecha_publicacion),
    count(*)
from LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.ANUNCIO an
group by month(an.fecha_publicacion)
having month(an.fecha_publicacion) > 4

select * from BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_HECHO_ANUNCIO
where tiempo_id not in (10,11,13) -- todos los registros caen en 10(año 2024, cuatrimestre 1), 11 (2024	2), 12 (2027 1)
select * from BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO
select * from BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_ANUNCIO_FECHA_ALTA
*/
/********************
    EJERCICIO 01
*********************/

CREATE VIEW BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.DURACION_PROMEDIO_ANUNCIOS
AS
	select 
        t.anio, 
        t.cuatrimestre,
        tipo.descripcion as tipoOperacion,
        b.descripcion as barrio,
        a.descripcion as ambientes,
        CEILING(SUM(an.promedio_dias)/COUNT(an.anuncio_id)) as promedioEnDias,
        SUM(an.promedio_dias) as diasTotales,
        COUNT(an.anuncio_id) as cantidadAnuncios
    from BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_HECHO_ANUNCIO an
    join BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIPO_OPERACION tipo on tipo.id = an.tipo_operacion_id
    join BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_BARRIO b on b.id = an.barrio_id
    join BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_AMBIENTES a on a.id = an.ambientes_id
    join BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO t on t.id = an.tiempo_id
    --where b.descripcion='Balvanera'
    group by t.anio, t.cuatrimestre, b.descripcion, a.descripcion, tipo.descripcion
    order by barrio,tipoOperacion

GO

/*
select * from BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.DURACION_PROMEDIO_ANUNCIOS
where promedio_dias = 10

select * from BI_LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.BI_TIEMPO

select COUNT(*) from LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.ANUNCIO a
where a.fecha_finalizacion is null
group by a.fecha_finalizacion
order by 1 desc
*/
