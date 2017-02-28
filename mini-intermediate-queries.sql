-- Using Chinook default database

---- Add foreign key to new table

CREATE TABLE movies (
    id INTEGER PRIMARY KEY,
    title TEXT,
    mediaTypeId INTEGER,
    FOREIGN KEY(mediaTypeId) REFERENCES MediaType(MediaTypeId)
);

INSERT INTO movies (title, mediaTypeId) VALUES ('Aladdin', 3);

SELECT * FROM movies;

---- Add foreign key to existing table

ALTER TABLE movies ADD COLUMN genreId INTEGER REFERENCES Genre(GenreId);

SELECT * FROM movies;

---- Update Rows

UPDATE movies SET genreId = 22 WHERE id = 1;

---- Use a join

SELECT a.title, ar.Name from ALBUM a JOIN ARTIST ar ON a.ArtistId = ar.ArtistId;

---- Use a nested query/sub-select statement

SELECT * FROM Track WHERE GenreId IN (SELECT GenreId from Genre WHERE Name = 'Jazz' OR Name = 'Blues');

---- Set a value to null

UPDATE Employee SET Phone = null WHERE EmployeeId = 1;

---- Query a null value

SELECT * FROM customer WHERE company is null;

---- Group by

SELECT ar.ArtistId, ar.Name, COUNT(*) FROM Artist ar JOIN ALBUM a ON ar.ArtistId = a.ArtistId GROUP BY ar.ArtistId;

------ challenge: order by album COUNT

SELECT ar.ArtistId, ar.Name, COUNT(*) FROM Artist ar JOIN ALBUM a ON ar.ArtistId = a.ArtistId GROUP BY ar.ArtistId ORDER BY COUNT(*) DESC;

---- Use Distinct

SELECT DISTINCT country FROM customer;

---- Delete Rows

SELECT * FROM customer WHERE fax IS NOT null;
DELETE FROM customer WHERE fax IS NOT null;