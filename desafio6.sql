SELECT 
MIN(f.preço) AS 'faturamento_minimo',
MAX(f.preço) AS 'faturamento_maximo',
ROUND(AVG(f.preço), 2) AS 'faturamento_medio',
SUM(f.preço) AS 'faturamento_total'
FROM assinatura AS f
JOIN users AS u
ON u.id_assinatura = f.id_assinatura;