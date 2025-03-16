CREATE DATABASE sample_articles;
USE sample_articles;

CREATE TABLE members (
    member_id INT PRIMARY KEY,
    name VARCHAR(255),
    role VARCHAR(50),
    photo TEXT,
    description TEXT,
    social_media TEXT,
    article_id INT NOT NULL
);

CREATE TABLE articles (
    article_id INT PRIMARY KEY,
    title VARCHAR(255),
    topic_id VARCHAR(50),
    publicated_at DATE,
    author INT NOT NULL,
    editor INT NOT NULL,
    illustrator INT NOT NULL,
    tag_id INT NOT NULL
);

CREATE TABLE topics (
    topic_id INT PRIMARY KEY,
    title VARCHAR(50),
    description TEXT,
    article_id INT NOT NULL
);

CREATE TABLE tags (
    tag_id INT PRIMARY KEY,
    title VARCHAR(50),
    article_id INT NOT NULL
);

INSERT INTO members VALUES
(1, 'Examplov Example', 'author', 'img1', 'a very humorvoll scientist', 'tg_link', 1),
(2, 'Primerov Primer', 'editor', 'img2', 'funny researcher', 'vk_link', 3),
(3, 'One More Person', 'illustrator', 'img3', 'one more person bio', 'site_link', 3),
(4, 'One more example', 'author', 'img4', 'great writer', 'link', 2),
(5, 'sample Samplovich', 'illustrator', 'img5', 'PS master', 'vk_link', 1),
(6, 'Imposter Imposterov', 'editor', 'img6', 'really love spelling', 'tg_link', 1),
(7, 'Finally Last', 'editor', 'img7', 'amazing orator', 'site_link', 3),
(8, 'One more example', 'author', 'img4', 'great writer', 'link', 2),
(9, 'One more example', 'author', 'img4', 'great writer', 'link', 2);

INSERT INTO articles VALUES
(1, 'Very Interesting Article', 2, '2023-12-23', 1, 6, 5, 3),
(2, 'Less Interesting Article', 1, '2021-10-12', 4, 9, 8, 2),
(3, 'The Most Interesting Article', 3, '2019-05-31', 2, 7, 3, 1);

INSERT INTO topics VALUES
(1, 'Insects', 'Topic about these nice creatures.', 2),
(2, 'Sea Gulls', 'Pages about the best birds in the world!', 1),
(3, 'Mammals', 'Articles about friends our little', 3);

INSERT INTO tags VALUES
(1, 'Funfacts', 3),
(2, 'Research', 2),
(3, 'Interview', 1);

ALTER TABLE members DROP COLUMN photo;

ALTER TABLE tags ADD COLUMN description TEXT;
UPDATE tags SET description = 'Some interesting facts' WHERE tag_id = 1;
UPDATE tags SET description = 'Normal scientific study' WHERE tag_id = 2;
UPDATE tags SET description = 'A talk with a guest' WHERE tag_id = 3;
SELECT * FROM tags;

ALTER TABLE members ADD FOREIGN KEY (article_id) REFERENCES articles(article_id);
ALTER TABLE articles ADD FOREIGN KEY (author) REFERENCES members(member_id);
ALTER TABLE articles ADD FOREIGN KEY (editor) REFERENCES members(member_id);
ALTER TABLE articles ADD FOREIGN KEY (illustrator) REFERENCES members(member_id);
ALTER TABLE topics ADD FOREIGN KEY (article_id) REFERENCES articles(article_id);
ALTER TABLE tags ADD FOREIGN KEY (article_id) REFERENCES articles(article_id);

SELECT name, role FROM members WHERE article_id = 3;
SELECT title FROM articles WHERE illustrator = 8;
SELECT title, publicated_at FROM articles WHERE tag_id = 2 AND topic_id = 1;
