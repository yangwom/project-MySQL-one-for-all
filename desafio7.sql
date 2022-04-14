SELECT *  FROM artista;
SELECT * FROM users;

SELECT * FROM artistas_favorito;
SELECT 
art.nome AS 'artista',
alb.album_name AS 'album',
COUNT(seg.artist_id) AS 'seguidores'
FROM artista AS art
JOIN album AS alb ON alb.artist_id = art.artist_id
JOIN artistas_favorito AS seg ON seg.artist_id = alb.artist_id
GROUP BY alb.album_name, art.nome
ORDER BY seguidores DESC;