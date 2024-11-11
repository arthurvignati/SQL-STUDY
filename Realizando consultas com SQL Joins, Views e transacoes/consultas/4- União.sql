--Exemplo de união
SELECT nome || ' (colaborador)' AS Nome, rua, bairro, cidade, estado FROM colaboradores
UNION ALL
SELECT nome || ' (fornecedor)' AS Fornecedor, rua, bairro, cidade, estado FROM fornecedores