ALTER TABLE pokequeue.requests
ADD sample_size INT NULL;

SELECT * FROM pokequeue.requests;

ALTER TABLE pokequeue.requests
DROP COLUMN SampleSize;