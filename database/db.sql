DROP TABLE pepe; --delete pepe table
 
CREATE DATABASE db_topng;

USE db_topng;

-- TABLE USER
-- all pasword wil be encrypted using SHA1
CREATE TABLE users (
  id INT(11) NOT NULL,
  username VARCHAR(16) NOT NULL,
  password VARCHAR(60) NOT NULL,
  fullname VARCHAR(100) NOT NULL
);

ALTER TABLE users
  ADD PRIMARY KEY (id);

ALTER TABLE users
  MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 2;

DESCRIBE users;

INSERT INTO users (id, username, password, fullname) 
  VALUES (1, 'topNewGameOrg', 'TopNew425929', 'El Cha N cho R');

SELECT * FROM users;

-- POSTS TABLE

CREATE TABLE posts (
  id INT(11) NOT NULL,
  user_id INT(11) NOT NULL,
  url_android VARCHAR(255) NOT NULL,
  url_ios VARCHAR(255) NOT NULL,
  tittle_w1 VARCHAR(255),
  desciption_w1 VARCHAR(255),
  tittle_w2 VARCHAR(255),
  desciption_w2 VARCHAR(255),
  tittle_w3 VARCHAR(255),
  desciption_w3 VARCHAR(255),
  tittle_w4 VARCHAR(255),
  desciption_w4 VARCHAR(255),
  tittle_w5 VARCHAR(255),
  desciption_w5 VARCHAR(255)
);

ALTER TABLE posts
  ADD PRIMARY KEY (id);

ALTER TABLE posts
  MODIFY id INT(11) NOT NULL AUTO_INCREMENT;

DESCRIBE posts;

-- SELECTED GAMES TABLE

CREATE TABLE selected (
  id INT(11) NOT NULL,
  id_post INT(11) NOT NULL,
  id_game INT(11) NOT NULL
);

ALTER TABLE selected
  ADD PRIMARY KEY (id);

ALTER TABLE selected
  MODIFY id INT(11) NOT NULL AUTO_INCREMENT;

DESCRIBE selected;

-- POSTS TABLE
CREATE TABLE games (
  id INT(11) NOT NULL,
  title_android_w1 TEXT ,
  title_ios_w1 TEXT ,
  desc_w1 TEXT ,
  desc_w2 TEXT ,
  desc_w3 TEXT ,
  desc_w4 TEXT ,
  desc_w5 TEXT ,
  url_android VARCHAR(255) NOT NULL,
  url_ios VARCHAR(255) NOT NULL,
  youtube_android VARCHAR(255) NOT NULL,
  youtube_ios VARCHAR(255) NOT NULL,
  created_year VARCHAR(150) NOT NULL,
  tags VARCHAR(150) NOT NULL,
  genre VARCHAR(150) NOT NULL
);

INSERT INTO games (url_android, url_ios, youtube_android, youtube_ios, created_year, tags, genre) 
  VALUES ('https://play.google.com/store/apps/details?id=com.caxstudio.caxs.smokebubble', 'https://play.google.com/store/apps/details?id=com.caxstudio.caxs.smokebubble', 'https://www.youtube.com/watch?v=qrAwiEGjv-Q', 'https://www.youtube.com/watch?v=qrAwiEGjv-Q', "2019", "action, puzzle, plataform", "puzzle");

ALTER TABLE games
  ADD PRIMARY KEY (id);

ALTER TABLE games
  MODIFY id INT(11) NOT NULL AUTO_INCREMENT;

DESCRIBE games;

