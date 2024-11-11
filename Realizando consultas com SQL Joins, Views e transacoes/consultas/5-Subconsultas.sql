--Retorna o nome e o telefone (Tabela clientes) daquele que fez o primeiro pedido (Tabela pedidos)
SELECT nome, telefone 
FROM clientes 
WHERE ID = (
    SELECT idcliente 
    FROM pedidos 
    WHERE datahorapedido = '2023-01-02 08:15:00')



-- Retorna o nome dos clientes (Tabela cliente), onde fizeram pedidos (Tabela pedidos) no mês de janeiro
SELECT nome
from clientes
where id in (
  SELECT idcliente
  from pedidos
  where strftime('%m', datahorapedido) = '01')
  

---Retornar quais produtos que possuem o seu preço maior que a média de todos os produtos

select nome_produto, preco_produto 
from produtos 
GROUP by nome_produto, preco_produto 
HAVING preco_produto > (SELECT AVG(preco_produto) FROM Produtos)