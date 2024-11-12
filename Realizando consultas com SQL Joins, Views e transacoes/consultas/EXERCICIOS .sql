--Traga todos os dados da cliente Maria Silva.
SELECT * FROM pedidos
SELECT * FROM clientes WHERE nome = 'Maria Silva'

--Busque o ID do pedido e o ID do cliente dos pedidos onde o status esteja como entregue.
SELECT p.id, p.idcliente, p.status
FROM pedidos p 
WHERE p.status = 'Entregue'

--Retorne todos os produtos onde o preço seja maior que 10 e menor que 15.
SELECT nome_produto FROM Produtos WHERE preco_produto > 10 and preco_produto <15

--Busque o nome e cargo dos colaboradores que foram contratados entre 2022-01-01 e 2022-06-31.
SELECT nome, cargo, datacontratacao FROM colaboradores WHERE datacontratacao BETWEEN '2022-01-01' and '2022-06-31'

--Recupere o nome do cliente que fez o primeiro pedido.
select c.nome, x.datahorapedido
FROM clientes c
INNER JOIN (SELECT datahorapedido, idcliente FROM pedidos ASC LIMIT 1) x
ON c.id = x.idcliente


--Liste os produtos que nunca foram pedidos.
SELECT pr.nome_produto
FROM Produtos pr 
full JOIN itenspedidos ip
on pr.ID_produtos = ip.idproduto
where idpedido ISNULL

INSERT INTO Produtos (id_produtos, nome_produto, descricao_produto, preco_produto, categoria_produto)
VALUES (32, 'Bife a Rolê', 'Bife suculento', 20, 'Almoço')

--Liste os nomes dos clientes que fizeram pedidos entre 2023-01-01 e 2023-12-31.
SELECT c.nome
FROM clientes c 
join (SELECT idcliente, STRFTIME('%Y-%m-%d', datahorapedido) AS AnoMesDia 
      FROM pedidos where AnoMesDia BETWEEN '2023-01-01' and '2023-12-31') x
ON c.id = x.idcliente
where AnoMesDia BETWEEN '2023-01-01' and '2023-12-31'
GROUP BY c.id


--Recupere os nomes dos produtos que estão em menos de 15 pedidos
SELECT p.nome_produto, x.Contador
from Produtos p
INNER JOIN (SELECT idproduto, COUNT(*) AS Contador
            FROM itenspedidos 
            GROUP BY idproduto
            HAVING Contador <= 15) x
ON p.ID_produtos = x.idproduto



--Liste os produtos e o ID do pedido que foram realizados pelo cliente "Pedro Alves" ou pela cliente "Ana Rodrigues".

SELECT pr.nome_produto, j.IDdoPEDIDO, j.nome
from Produtos pr 
JOIN (SELECT ip.idproduto, x.IDdoPEDIDO, x.nome
      FROM itenspedidos ip
      JOIN (select p.id AS IDdoPEDIDO, z.nome
            FROM pedidos p
            RIGHT JOIN (select id, nome FROM clientes
            WHERE nome = 'Pedro Alves' OR nome = 'Ana Rodrigues') z
            on z.id = p.idcliente
           ) x ON ip.idpedido = x.IDdoPEDIDO) j
      ON pr.ID_produtos = j.idproduto



--Recupere o nome e o ID do cliente que mais comprou(valor) no Serenatto.

select c.nome, c.id, z.totalcomprado
from clientes c
JOIN (SELECT p.idcliente, x.idpedido, SUM(x.Contador) as totalcomprado
      FROM pedidos p
      JOIN (SELECT idpedido, SUM(precounitario) AS Contador FROM itenspedidos GROUP BY idpedido) x
      ON x.idpedido = p.id
      GROUP BY p.idcliente 
      ORDER BY SUM(x.Contador) DESC LIMIT 1) z
ON c.id = z.idcliente

