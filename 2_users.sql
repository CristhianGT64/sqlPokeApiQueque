create login PokeQueueApp with PASSWORD = 'Password123@';

create user PokeQueueApUser for login PokeQueueApp;

grant select on SCHEMA :: pokequeue to PokeQueueApUser;
grant insert on SCHEMA :: pokequeue to PokeQueueApUser;
grant update on SCHEMA :: pokequeue to PokeQueueApUser;
grant delete on SCHEMA :: pokequeue to PokeQueueApUser;
grant execute on SCHEMA :: pokequeue to PokeQueueApUser;