USE [GD2C2023]
GO

-- Inicio Configurar reglas de nombre de objetos
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET CONCAT_NULL_YIELDS_NULL ON
GO
-- Fin Configurar reglas de nombre de objetos

-- Inicio DROP FKs

-- Fin DROP FKs

-- Inicio DROP tablas

-- Fin DROP tablas

-- Inicio DROP Funciones

-- Fin DROP Funciones

-- Inicio DROP Procedimientos
IF OBJECT_ID('LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.MIGRAR_EJEMPLO_SP') IS NOT NULL
  DROP PROCEDURE LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.MIGRAR_EJEMPLO_SP
GO
-- Fin DROP Procedimientos

-- Inicio crear schema de la aplicación
IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO')
    DROP SCHEMA LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO
GO

CREATE SCHEMA LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO
GO
-- Fin crear schema de la aplicación

-- Inicio crear tablas

-- Fin crear tablas

-- Inicio crear FKs

-- Fin crear FKs

-- Inicio crear Funciones

-- Fin crear Funciones

-- Inicio crear Procedimientos
CREATE PROCEDURE LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.MIGRAR_EJEMPLO_SP
AS
BEGIN
    -- Cuerpo
    SELECT 1
END
GO
-- Fin crear Procedimientos

-- Inicio Invocaciones de procedimientos
EXEC LOS_HEREDEROS_DE_MONTIEL_Y_EL_DATO_PERSISTIDO.MIGRAR_EJEMPLO_SP
GO
-- Fin Invocaciones de procedimientos
