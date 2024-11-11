-- SEMELHANTE AO RIGHT JOIN, TRAZ TODOS OS DADOS DA TABELA DA ESQUERDA, E APENAS OS QUE CORRESPONDE  
-- NA TABELA DA DIREITA
-- ex: QUAIS CLIENTES NAO POSSUEM VENDAS NO MES DE OUTUBRO
-- seleciona todos os clientes a esquerda do left join, e a direita apenas aqueles que correspondem
SELECT c.nome, x.id ,x.idcliente
FROM clientes c 
LEFT JOIN 
      (SELECT p.id, p.idcliente
       from pedidos p 
       WHERE strftime('%m', p.datahorapedido) = '10') x

ON c.id = x.idcliente
WHERE x.idcliente ISNULL

