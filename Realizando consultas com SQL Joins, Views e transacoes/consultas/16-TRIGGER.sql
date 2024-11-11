--Atualizar automaticamente o faturamento diario, dentro da tabela Faturamentodiario
--Após ser inserido um novo pedido na tabela itenspedidos

CREATE TABLE Faturamentodiario (
  Dia DATE,
  FaturamentoTotal DECIMAL(10,2)
);

SELECT * FROM itenspedidos

CREATE TRIGGER CalculaFaturamentoDiario
AFTER INSERT ON itenspedidos
FOR EACH ROW
BEGIN
  INSERT OR REPLACE INTO Faturamentodiario(dia, FaturamentoTotal)
  SELECT DATE(datahorapedido) AS Dia, SUM(ip.precounitario) AS FaturamentoDiario
  FROM pedidos p
  JOIN itenspedidos ip
  ON p.id = ip.idpedido
  GROUP BY Dia;
END;
