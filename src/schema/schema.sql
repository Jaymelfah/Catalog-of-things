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
CREATE TABLE books (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  publisher VARCHAR(150) NOT NULL,
  cover_state VARCHAR(150) NOT NULL,
  genre_id INT NULL REFERENCES genres(id) ON DELETE CASCADE,
  author_id INT NULL REFERENCES authors(id) ON DELETE CASCADE,
  label_id INT NULL REFERENCES labels(id) ON DELETE CASCADE,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

-- Music-Album


-- Games



-- Performance indexing
