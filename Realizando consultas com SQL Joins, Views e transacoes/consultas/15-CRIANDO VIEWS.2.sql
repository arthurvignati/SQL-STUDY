CREATE VIEW ViewSomaTotalPreco AS
select p.id, c.nome, SUM(ip.precounitario) AS SomaTotalDoPedido
FROM clientes c 
JOIN pedidos p ON c.id = p.idcliente
join itenspedidos ip ON p.id = ip.idpedido
group by p.id, c.nome

select * from ViewSomaTotalPreco
where SomaTotalDoPedido > 10 AND SomaTotalDoPedido < 25