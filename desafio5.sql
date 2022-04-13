SELECT 
c.cancoes AS 'cancao',
COUNT(c.id_music) AS 'reproducoes'
FROM reproducoes AS re
JOIN musicas AS c 
ON c.id_music = re.id_music
GROUP BY c.cancoes
ORDER BY reproducoes DESC
LIMIT 2;