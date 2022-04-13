SELECT 
COUNT(DISTINCT m.cancoes) AS 'cancoes',
COUNT(DISTINCT a.nome) AS 'artistas',
COUNT(DISTINCT alb.album_name) AS 'albuns'
FROM musicas AS m , artista AS a, album AS alb; 