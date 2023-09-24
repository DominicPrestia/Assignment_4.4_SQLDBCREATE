CREATE DATABASE assignment_4_LearningSQL;

CREATE TABLE users (
    id SERIAL NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE countries (
    id SERIAL NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE addresses(
    id SERIAL NOT NULL,
    user_id INT NOT NULL,
    countries_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)
        REFERENCES users(id),
    FOREIGN KEY (countries_id)
        REFERENCES countries(id)
);

INSERT INTO users (
    username,
    password,
    email,
    firstname,
    lastname
    ) 
        VALUES (
            'dprestia',
            'coolpass',
            'dominicprestia0@gmail.com',
            'Dominic',
            'Prestia'
        ),
        (
            'bbarker',
            'lpass',
            'barker@gmail.com',
            'Bob',
            'Barker'
        );

INSERT INTO countries(
    name
)
    VALUES('USA'),('NEW ZEALAND'),('CHINA');

INSERT INTO addresses (user_id, countries_id)
VALUES('1','1'),('2','1'),('2','3');

SELECT * FROM countries;

SELECT email FROM users;

SELECT * FROM users
WHERE firstname LIKE '%b%';

SELECT a.id,a.user_id, a.countries_id, c.countryname 
From addresses a
JOIN countries c
ON a.countries_id = c.id
WHERE a.user_id = '2';

ALTER TABLE countries RENAME COLUMN name TO countryname;
