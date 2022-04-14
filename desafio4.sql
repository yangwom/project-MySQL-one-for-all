SELECT usr.nome AS 'usuario', 
IF(max(re.data_de_reproducao) LIKE '2021%', 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM users AS usr
JOIN reproducoes AS re
ON usr.usuario_id = re.usuario_id
GROUP BY usr.usuario_id add
ORDER BY usr.nome;

-- SELECT max(data_de_reproducao) FROM reproducoes WHERE data_de_reproducao LIKE '2021%';