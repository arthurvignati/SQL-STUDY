
SELECT c.nome AS nome_cliente, p.id AS id_produto, p.datahorapedido AS datahora_produto
FROM clientes c 
INNER join pedidos p 
ON c.id = p.idcliente  -- DEVE-SE TER CONEXÃO ENTRE CHAVES ESTRANGEIRAS PARA REALIZAR INNER JOIN NECESSARIAMENTE