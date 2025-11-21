-- Procedimiento almacenado para verificar si existe un reporte por ID
CREATE PROCEDURE sp_VerificarReporteExiste
    @id INT,
    @existe INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Verifica si el reporte existe en la tabla
    IF EXISTS (SELECT 1 FROM pokequeue.requests WHERE id = @id)
        SET @existe = 1;  -- Reporte existe
    ELSE
        SET @existe = 0;  -- Reporte no existe
END;

-- ============================================
-- Alternativa: Procedimiento con más detalles
-- ============================================
CREATE PROCEDURE sp_VerificarReporteDetalles
    @id INT,
    @existe INT OUTPUT,
    @tipo NVARCHAR(255) OUTPUT,
    @url NVARCHAR(1000) OUTPUT,
    @estado INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Busca el reporte y retorna sus detalles
    SELECT TOP 1
        @existe = 1,
        @tipo = type,
        @url = url,
        @estado = id_status
    FROM pokequeue.requests
    WHERE id = @id;
    
    -- Si no encuentra nada, marca como no existe
    IF @existe IS NULL
        SET @existe = 0;
END;

-- ============================================
-- Procedimiento: Contar reportes por tipo
-- ============================================
CREATE PROCEDURE sp_ContarReportesPorTipo
    @tipo NVARCHAR(255),
    @cantidad INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT @cantidad = COUNT(*)
    FROM pokequeue.requests
    WHERE type = @tipo;
END;

-- ============================================
-- Procedimiento: Obtener todos los reportes
-- ============================================
CREATE PROCEDURE sp_ObtenerTodosReportes
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        id,
        type,
        id_status,
        url,
        created,
        updated
    FROM pokequeue.requests
    ORDER BY created DESC;
END;

-- ============================================
-- Procedimiento: Eliminar reporte por ID
-- ============================================
CREATE PROCEDURE sp_EliminarReportePorId
    @id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    DELETE FROM pokequeue.requests
    WHERE id = @id;
END;

-- ============================================
-- Procedimiento: Eliminar reporte por tipo
-- ============================================
CREATE PROCEDURE sp_EliminarReportesPorTipo
    @tipo NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;
    
    DELETE FROM pokequeue.requests
    WHERE type = @tipo;
END;

-- ============================================
-- Procedimiento: Eliminar reportes antiguos
-- ============================================
CREATE PROCEDURE sp_EliminarReportesAntiguos
    @diasAntiguedad INT = 30
AS
BEGIN
    SET NOCOUNT ON;
    
    DELETE FROM pokequeue.requests
    WHERE created < DATEADD(DAY, -@diasAntiguedad, GETDATE());
END;
