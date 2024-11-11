-- RETORNA TODAS AS INFORMAÇÕES DESDE QUE HAJA CORRESPONDENCIA NAS DUAS TABELAS 
-- RETORNA COMO NULO TANTO AQUELES PEDIDOS QUE NAO POSSUEM CLIENTES (NOME_CLIENTE = NULL)
--QUANTO CLIENTES QUE NÃO FIZERAM PEDIDOS (ID_PRODUTOS = NULL)

select c.nome AS  'nome cliente', p.id AS 'Id pedido'
FROM pedidos p
FULL JOIN clientes c
ON p.idcliente = c.id
WHERE c.nome ISNULL OR p.id ISNULL