SELECT 
art.nome AS 'artista',
alb.album_name AS 'album'
FROM artista AS art
JOIN album AS alb ON art.artist_id = alb.artist_id
WHERE art.nome = 'Walter Phoenix'
ORDER BY alb.album_name;