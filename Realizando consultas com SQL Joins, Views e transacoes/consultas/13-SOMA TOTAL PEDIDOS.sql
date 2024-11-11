-- NOME CLIENTE (c.cliente), E TOTAL DE PEDIDOS POR CADA CLIENTE 
SELECT c.nome, SUM(ip.quantidade) AS 'Quantidade Comprada'
FROM clientes c
INNER JOIN pedidos p ON c.id = p.idcliente
INNER JOIN itenspedidos ip ON p.id = ip.idpedido
GROUP BY c.nome

