CREATE OR ALTER PROCEDURE  pokequeue.sp_EliminarReportePorId
    @id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    DELETE FROM pokequeue.requests
    WHERE id = @id;
END;

EXECUTE pokequeue.sp_EliminarReportePorId @id = 13;

SELECT * FROM pokequeue.requests WHERE id = 13;