DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS music_albums;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS labels;
DROP TABLE IF EXISTS authors;

-- Labels
CREATE TABLE labels (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  color VARCHAR(150) NOT NULL
);

-- Genres


-- Authors


-- Books


-- Music-Album


-- Games



-- Performance indexing
CREATE INDEX book_label_id ON books(label_id);