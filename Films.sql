CREATE TABLE film (
	id INT IDENTITY NOT NULL PRIMARY KEY,
	title NVARCHAR(20) NOT NULL,
	publishYear INT NOT NULL,
	plot NVARCHAR(300) NOT NULL,
	rutime INT NOT NULL,
	poster NVARCHAR(150) NOT NULL,
)

CREATE TABLE actors (
	id INT IDENTITY NOT NULL PRIMARY KEY,
	firstName NVARCHAR(10) NOT NULL,
	lastname NVARCHAR(10) NOT NULL
)

CREATE TABLE language (
	id INT IDENTITY NOT NULL PRIMARY KEY,
	name NVARCHAR(20) NOT NULL
)

CREATE TABLE genre (
	id INT IDENTITY NOT NULL PRIMARY KEY,
	name NVARCHAR(10) NOT NULL,
)

CREATE TABLE film_language (
	id_film INT NOT NULL UNIQUE, 
	id_language INT NOT NULL
)

CREATE TABLE film_genre (
	id_film INT NOT NULL UNIQUE, 
	id_genre INT NOT NULL 
)

CREATE TABLE film_actor (
	id_film INT NOT NULL,
	id_actor INT NOT NULL,
)

ALTER TABLE dbo.film_language ADD CONSTRAINT fk_film FOREIGN KEY(id_film) REFERENCES film(id)
ALTER TABLE dbo.film_language ADD CONSTRAINT fk_language FOREIGN KEY(id_language) REFERENCES language(id)

ALTER TABLE dbo.film_genre ADD CONSTRAINT fk_film2 FOREIGN KEY(id_film) REFERENCES film(id)
ALTER TABLE dbo.film_genre ADD CONSTRAINT fk_genre FOREIGN KEY(id_genre) REFERENCES genre(id)

ALTER TABLE dbo.film_actor ADD CONSTRAINT fk_film3 FOREIGN KEY(id_film) REFERENCES film(id)
ALTER TABLE dbo.film_actor ADD CONSTRAINT fk_actor FOREIGN KEY(id_actor) REFERENCES actors(id)

ALTER TABLE dbo.film_actor ADD CONSTRAINT actor_unique UNIQUE (id_film, id_actor)