-- RETORNAR ID PEDIDO, NOME CLIENTE, E VALOR TOTAL DO PEDIDO (preco unitario)

select p.id, c.nome, SUM(ip.precounitario) AS 'Soma Total do pedido'
FROM clientes c 
JOIN pedidos p ON c.id = p.idcliente
join itenspedidos ip ON p.id = ip.idpedido
group by p.id, c.nome

