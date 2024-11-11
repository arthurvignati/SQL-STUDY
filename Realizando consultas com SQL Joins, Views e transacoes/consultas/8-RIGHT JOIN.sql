--identificar quais produtos foram ou não vendidos
--QUEREMOS SABER TODOS OS PRODUTOS, MAS AQUELES OS QUE FORAM VENDIDOS, POR ISSO
--UTILIZAMOS A CLAUSULA RIGHT JOIN, POIS TRAREMOS TODOS OS REGISTROS DA TABELA DIREITA
-- E APENAS AQUELES CORRESPONDIDOS DA TABELA ESQUERDA (o que nao tiver esta marcado como NULL)

SELECT p.nome_produto, ip.idproduto, ip.idpedido
FROM itenspedidos ip
RIGHT JOIN Produtos p
ON p.ID_produtos = ip.idproduto


