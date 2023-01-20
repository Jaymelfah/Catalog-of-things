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
CREATE TABLE genre(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


-- Authors
CREATE TABLE author(
  id SERIAL NOT NULL PRIMARY KEY,
  first_name VARCHAR
  last_name VARCHAR
);


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
CREATE TABLE music_album(
    id SERIAL PRIMARY KEY,
    genre_id INTEGER,
    author_id INTEGER,
    label_id INTEGER,
    publish_date DATE,
    archived BOOLEAN,
    on_spotify BOOLEAN,
    FOREIGN KEY (genre_id) REFERENCES genre(id),
    FOREIGN KEY (author_id) REFERENCES author(id),
    FOREIGN KEY (label_id) REFERENCES label(id),
);

-- Games
CREATE TABLE game(
  id SERIAL NOT NULL PRIMARY KEY,
  multiplayer BOOLEAN,
  last_played_at DATE,
  publish_date DATE,
  archived BOOLEAN,
  author_id INTEGER REFERENCES author (id) 
)



-- Performance indexing
CREATE INDEX book_label_id ON books(label_id);





