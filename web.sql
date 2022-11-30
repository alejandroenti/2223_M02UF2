CREATE DATABASE web;
USE web;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
	id_user INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(48) NOT NULL,
	username VARCHAR(16) NOT NULL,
	email VARCHAR(24) NOT NULL,
	birthdate DATE NOT NULL,
	registered DATETIME NOT NULL DEFAULT NOW()
);

CREATE TABLE comments (
	id_comment INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	comment TEXT NOT NULL,
	inserted DATETIME NOT NULL DEFAULT NOW(),
	id_user INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_user) REFERENCES users(id_user)
);


INSERT INTO users (name, username, email, birthdate) VALUES ("Paquito", "paquito75", "paquito@arriba.es", "1982-12-04");
INSERT INTO users (name, username, email, birthdate) VALUES ("Marco", "polo18", "marco@polo.it", "2022-02-01");
INSERT INTO users (name, username, email, birthdate) VALUES ("Adolf", "nais39", "adolf@nais.ss", "1904-07-19");

INSERT INTO comments (comment, id_user) VALUES ("Salgo en la tele mama", 2), ("Hay un exterminio por hacer", 3), ("Comprame esta!", 2);

CREATE USER 'webeditor'@'localhost' IDENTIFIED BY 'enti';
GRANT SELECT, INSERT ON web.users TO 'webeditor'@'localhost';

CREATE USER 'webadmin'@'localhost' IDENTIFIED BY 'enti';
GRANT ALL ON web.* TO 'webadmin'@'localhost';

CREATE USER 'webcomments'@'localhost' IDENTIFIED BY 'enti';
GRANT SELECT, INSERT, UPDATE ON web.comments TO 'webcomments'@'localhost';

# Query  que nos devuelve el id, nombre de usuario, comentario y hora del comentario
SELECT users.id_user, users.username, comments.comment, comments.inserted 
FROM users 
	RIGHT JOIN comments ON users.id_user = comments.id_user;

# Generamos la View de la anterior query
CREATE VIEW webcomments AS
	SELECT users.id_user, users.username, comments.comment, comments.inserted 
	FROM users  
		RIGHT JOIN comments ON users.id_user = comments.id_user;

