DROP TABLE IF EXISTS public.films;
CREATE TABLE films (title varchar(255), "year" integer, genre varchar(100));

INSERT INTO films(title, "year", genre) VALUES ('Die Hard', 1988, 'action');
INSERT INTO films(title, "year", genre) VALUES ('Casablanca', 1942, 'drama');
INSERT INTO films(title, "year", genre) VALUES ('The Conversation', 1974, 'thriller');

ALTER TABLE films
  ADD COLUMN director text,
  ADD COLUMN duration integer;

UPDATE films
  SET (director, duration) = ('John McTiernan', 132)
  WHERE title = 'Die Hard';

UPDATE films
  SET (director, duration) = ('Michael Curtiz', 102)
  WHERE title = 'Casablanca';

UPDATE films
  SET (director, duration) = ('Francis Ford Coppola', 113)
  WHERE title = 'The Conversation';

INSERT INTO films
      VALUES('1984', 1956, 'scifi', 'Michael Anderson', 90),
            ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127),
            ('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);

SELECT title, extract("year" from CURRENT_DATE) - year AS age FROM films
ORDER BY age;

SELECT title, duration FROM films WHERE duration > 120
ORDER BY duration DESC;

SELECT title FROM films
ORDER BY duration DESC
LIMIT 1;
