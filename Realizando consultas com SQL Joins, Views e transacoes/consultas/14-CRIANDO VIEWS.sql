CREATE VIEW ViewSomaTotalPedidos AS 
SELECT c.nome, SUM(ip.quantidade) AS 'Quantidade Comprada'
FROM clientes c
INNER JOIN pedidos p ON c.id = p.idcliente
INNER JOIN itenspedidos ip ON p.id = ip.idpedido
GROUP BY c.nome

SELECT * from ViewSomaTotalPedidos

