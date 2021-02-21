CREATE TABLE language
(
    id          number(7) NOT NULL PRIMARY KEY,
    cd          CHAR(2)   NOT NULL,
    description varchar2(50)
);

CREATE TABLE author
(
    id            number(7)    NOT NULL PRIMARY KEY,
    first_name    varchar2(50),
    last_name     varchar2(50) NOT NULL,
    date_of_birth DATE,
    year_of_birth number(7),
    distinguished number(1)
);

CREATE TABLE book
(
    id           number(7)     NOT NULL PRIMARY KEY,
    author_id    number(7)     NOT NULL,
    title        varchar2(400) NOT NULL,
    published_in number(7)     NOT NULL,
    language_id  number(7)     NOT NULL,

    CONSTRAINT fk_book_author FOREIGN KEY (author_id) REFERENCES author (id),
    CONSTRAINT fk_book_language FOREIGN KEY (language_id) REFERENCES language (id)
);

CREATE TABLE book_store
(
    name varchar2(400) NOT NULL UNIQUE
);

CREATE TABLE book_to_book_store
(
    name    varchar2(400) NOT NULL,
    book_id INTEGER       NOT NULL,
    stock   INTEGER,

    PRIMARY KEY (name, book_id),
    CONSTRAINT fk_b2bs_book_store FOREIGN KEY (name) REFERENCES book_store (name) ON DELETE CASCADE,
    CONSTRAINT fk_b2bs_book FOREIGN KEY (book_id) REFERENCES book (id) ON DELETE CASCADE
);