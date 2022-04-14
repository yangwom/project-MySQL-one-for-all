DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.assinatura(
  id_assinatura INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  plano VARCHAR(45) NOT NULL,
  preço DECIMAL(5,2)
)ENGINE = innoDB;

INSERT INTO SpotifyClone.assinatura(plano, preço) VALUES 
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99),
('pessoal', 6.99 );
CREATE TABLE SpotifyClone.users(
  usuario_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_assinatura INT NOT NULL,
  nome VARCHAR(45),
  data_assinatura DATE,
  idade INT,
  FOREIGN KEY (id_assinatura) REFERENCES assinatura (id_assinatura)
)ENGINE = innoDB;

INSERT INTO SpotifyClone.users(id_assinatura, nome, idade, data_assinatura) VALUES 
(1,'Thati', 23, '2019-10-20'),
(2,'Cintia', 45, '2017-12-30'),
(3,'Bill', 20, '2019-06-05'),
(4,'Roger', 45, '2020-05-13'),
(4,'Norman', 58, '2017-02-17'),
(2,'Patrick', 33, '2017-01-06'),
(3,'Vivian', 26, '2018-01-05'),
(3,'Carol', 19, '2018-02-14'),
(2,'Angelina', 42, '2018-04-29'),
(2,'Paul', 46, '2017-01-17');

CREATE TABLE SpotifyClone.artista(
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45)
)ENGINE = innoDB;

INSERT INTO SpotifyClone.artista(nome) VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon'),
('Tyler Isle'),
('Fog');


CREATE TABLE SpotifyClone.artistas_favorito(
  artist_id INT,
  usuario_id INT,
  FOREIGN KEY (usuario_id) REFERENCES users (usuario_id),
  FOREIGN KEY (artist_id) REFERENCES artista (artist_id),
  CONSTRAINT PRIMARY KEY(artist_id, usuario_id)
)ENGINE = innoDB;

INSERT INTO SpotifyClone.artistas_favorito(usuario_id, artist_id) VALUES
(1,	1),
(1,	3),
(1,	4),
(2,	1),
(2,	3),
(3,	2),
(3,	1),
(4,	4),
(5,	5),
(5,	6),
(6,	1),
(6,	3),
(6,	6),
(7,	2),
(7,	5),
(8,	1),
(8,	5),
(9,	6),
(9,	4),
(9,	3),
(10,	2),
(10,	6);

CREATE TABLE SpotifyClone.album(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  artist_id INT NOT NULL,
  album_name VARCHAR(100),
  FOREIGN KEY (artist_id) REFERENCES artista (artist_id)
)ENGINE = innoDB;

INSERT INTO SpotifyClone.album(album_id,	album_name,	artist_id) VALUES
(1,	'Envious', 1),
(2,	'Exuberant',	1),
(3,	'Hallowed Steam',	2),
(4,	'Incandescent',	3),
(5,	'Temporary Culture',	4),
(6,	'Library of liberty',	4),
(7,	'Chained Down',	5),
(8,	'Cabinet of fools',	5),
(9,	'No guarantees',	5),
(10,	'Apparatus',	6);

CREATE TABLE SpotifyClone.musicas(
  id_music INT PRIMARY KEY AUTO_INCREMENT,
  album_id INT NOT NULL,
  cancoes VARCHAR(100),
  duracao INT,
  ano_de_lancamento INT,
  FOREIGN KEY (album_id) REFERENCES album (album_id)
)ENGINE = innoDB;

INSERT INTO SpotifyClone.musicas(album_id, cancoes, duracao, ano_de_lancamento ) VALUES
    (1, 'Soul For Us', 200, 1990),
    (1, 'Reflections Of Magic', 163, 1990),
    (1, 'Dance With Her Own', 116, 1990),
    (2, 'Troubles Of My Inner Fire', 203, 1993),
    (2, 'Time Fireworks', 152, 1993),
    (3, 'Magic Circus', 105, 1995),
    (3, 'Honey, So Do I', 207, 1995),
    (3, "Sweetie, Let's Go Wild", 139, 1995),
    (3, 'She Knows', 244, 1995),
    (4, 'Fantasy For Me', 100, 1998),
    (4, 'Celebration Of More', 146, 1998),
    (4, 'Rock His Everything', 223, 1998),
    (4, 'Home Forever', 231, 1998),
    (4, 'Diamond Power', 241, 1998),
    (4, "Let's Be Silly", 132, 1998),
    (5, 'Thang Of Thunder', 240, 2001),
    (5, 'Words Of Her Life', 185, 2001),
    (5, 'Without My Streets', 176, 2001),
    (6, 'Need Of The Evening', 190, 2003),
    (6, 'History Of My Roses', 222, 2003),
    (6, 'Without My Love', 111, 2003),
    (6, 'Walking And Game', 123, 2003),
    (6, 'Young And Father', 197, 2003),
    (7, 'Finding My Traditions', 179, 2007),
    (7, 'Walking And Man', '229', 2007),
    (7, 'Hard And Time', '135', 2007),
    (7, "Honey, I'm A Lone Wolf", 150, 2007),
    (8, "She Thinks I Won't Stay Tonight", 166, 2012),
    (8, "He Heard You're Bad For Me", 154, 2012),
    (8, "He Hopes We Can't Stay", 210, 2012),
    (8, 'I Know I Know', 117, 2012),
    (9, "He's Walking Away", 159, 2015),
    (9, "He's Trouble", 138, 2015),
    (9, ' Heard I Want To Bo Alone', 120, 2015),
    (9, 'I Ride Alone', 151, 2015),
    (10, 'Honey', 79, 2015),
    (10, 'You Cheated On Me', 95, 2015),
    (10, "Wouldn't It Be Nice", 213, 2015),
    (10, 'Baby', 136, 2015),
    (10, 'You Make Me Feel So..', 83, 2015);

    CREATE TABLE SpotifyClone.reproducoes(
  usuario_id INT,
  id_music INT,
  data_de_reproducao DATETIME,
  FOREIGN KEY (usuario_id) REFERENCES users (usuario_id),
  FOREIGN KEY (id_music) REFERENCES musicas (id_music),
  CONSTRAINT PRIMARY KEY (usuario_id, id_music)
)ENGINE = innoDB;

INSERT INTO SpotifyClone.reproducoes(usuario_id, id_music, data_de_reproducao) VALUES
  (1, 36, '2020-02-28 10:45:55'),
  (1, 25, '2020-05-02 05:30:35'),
  (1, 23, '2020-03-06 11:22:33'),
  (1, 14, '2020-08-05 08:05:17'),
  (1, 15, '2020-09-14 16:32:22'),
  (2, 34, '2020-01-02 07:40:33'),
  (2, 24, '2020-05-16 06:16:22'),
  (2, 21, '2020-10-09 12:27:48'),
  (2, 39, '2020-09-21 13:14:46'),
  (3, 6,  '2020-11-13 16:55:13'),
  (3, 3, '2020-12-05 18:38:30'),
  (3, 26, '2020-07-30 10:00:00'),
  (4, 2, '2021-08-15 17:10:10'),
  (4, 35, '2021-07-10 15:20:30'),
  (4, 27, '2021-01-09 01:44:33'),
  (5, 7, '2020-07-03 19:33:28'),
  (5, 12, '2017-02-24 21:14:22'),
  (5, 14, '2020-08-06 15:23:43'),
  (5, 1, '2020-11-10 13:52:27'),
  (6, 38, '2019-02-07 20:33:48'),
  (6, 29, '2017-01-24 00:31:17'),
  (6, 30, '2017-10-12 12:35:20'),
  (6, 22, '2018-05-29 14:56:41'),
  (7, 5, '2018-05-09 22:30:49'),
  (7, 4, '2020-07-27 12:52:58'),
  (7, 11, '2018-01-16 18:40:43'),
  (8, 39, '2018-03-21 16:56:40'),
  (8, 40, '2020-10-18 13:38:05'),
  (8, 32, '2019-05-25 08:14:03'),
  (8, 33, '2021-08-15 21:37:09'),
  (9, 16, '2021-05-24 17:23:45'),
  (9, 17, '2018-12-07 22:48:52'),
  (9, 8, '2021-03-14 06:14:26'),
  (9, 9, '2020-04-01 03:36:00'),
  (10, 20, '2017-02-06 08:21:34'),
  (10, 21, '2017-12-04 05:33:43'),
  (10, 12, '2017-07-27 05:24:49'),
  (10, 13, '2017-12-25 01:03:57'); 