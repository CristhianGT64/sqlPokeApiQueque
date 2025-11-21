CREATE OR ALTER PROCEDURE pokequeue.create_poke_request(
    @type NVARCHAR(255),
    @size INT NULL
)
AS 

SET NOCOUNT ON;

insert into pokequeue.requests(
    [type],
    [sample_size] /* Aunque sale error no da error en la consulta */
    , [url]
    , id_status
) values(
    @type,
    @size
    , ''
    , ( select id from pokequeue.status where description = 'sent' )
)

select max(id) as id from pokequeue.requests;
