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

CREATE TABLE genre(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);