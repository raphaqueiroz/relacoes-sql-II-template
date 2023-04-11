-- Active: 1681236054087@@127.0.0.1@3306

-- Práticas

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT(DATETIME('now', 'localtime')) --Função padrão que se define automaticamente;
);

INSERT INTO users (id, name, email, password) VALUES ("u01", "Ana Paula", "anapaula@email.com", "654321"),
("u02", "Marcos", "marcos@email.com", "123456"),
("u03", "Xaninha", "xaninha@email.com", "321612");

SELECT * FROM users;

CREATE TABLE follows (
    id_follower TEXT NOT NULL,
    id_followed TEXT NOT NULL,
    FOREIGN KEY (id_follower) REFERENCES users(id),
    FOREIGN KEY (id_followed) REFERENCES users(id)
 );

 INSERT INTO follows (id_follower, id_followed) 
 VALUES 
 ("u01", "u02"), 
 ("u01", "u03"), 
 ("u02", "u01");

-- mostra somente os usuários que se relacionam entre tabelas, quem não se relaciona não é mostrado;
SELECT * FROM users INNER JOIN follows ON follows.id_follower = users.id;


-- Mostra todos que estão inseridos na tabela independente de condição. E mostra a relação entre elas;
SELECT * FROM users LEFT JOIN follows ON follows.id_follower = users.id;


-- mostrando o "id" do seguidor e também da pessoa seguida, utilizando um segundo LEFT JOIN;
SELECT * FROM users 
LEFT JOIN follows 
ON follows.id_follower = users.id
LEFT JOIN users AS userFollower
ON userFollower.id = follows.id_followed;

