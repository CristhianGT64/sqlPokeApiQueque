CREATE PROCEDURE pokequeue.update_poke_request(
    @id int
    , @status  NVARCHAR(255)
    , @url NVARCHAR(1000)
)
AS

SET NOCOUNT ON;

UPDATE pokequeue.requests
set id_status = ( select id from pokequeue.status where description = @status )
    , url = @url
    , updated = GETDATE()
WHERE id = @id;

select 1 as completed;