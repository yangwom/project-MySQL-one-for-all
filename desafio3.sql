SELECT
  n.nome AS 'usuario',
  COUNT(n.usuario_id) AS 'qtde_musicas_ouvidas',
  ROUND(SUM(mu.duracao) / 60, 2)  AS 'total_minutos'
FROM
  users AS n
  JOIN reproducoes AS re
  ON re.usuario_id = n.usuario_id
  JOIN musicas AS mu 
  ON mu.id_music = re.id_music
  GROUP BY n.nome;