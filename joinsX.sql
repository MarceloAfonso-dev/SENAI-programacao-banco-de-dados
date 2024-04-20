-- 1º - Valor das Vendas (Por Meio de Pagamento e a Quantidade)
SELECT tbFormaPagamento.descricao AS "Forma de Pagamento",
SUM(tbPedido.subtotal) AS "Soma",
COUNT(*) AS "Quantidade"
FROM tbPedido JOIN tbFormaPagamento
ON tbPedido.idFormaPgto = tbFormaPagamento.idFormaPgto
GROUP BY tbFormaPagamento.descricao;


-- Quantidade total de pizzas vendidas
SELECT tbEstoque.ingrediente as "Nome",
SUM(tbControlePizza.quantidade) AS "Quantidade"
FROM tbEstoque JOIN tbControlePizza
ON tbEstoque.idEstoque = tbControlePizza.idPizza
GROUP BY tbEstoque.ingrediente
ORDER BY "Quantidade";


-- 2º A Pizza Mais Vendida
SELECT estoque.nome_est AS "Nome",
SUM(controle_pizza.qtd_cont) AS "Quantidade"
FROM Estoque JOIN Controle_Pizza
ON estoque.id_est = controle_pizza.id_pizza
GROUP BY estoque.nome_est
ORDER BY "Quantidade" DESC
FETCH FIRST 1 ROWS ONLY;

-- 3º A Pizza Menos Vendida
SELECT estoque.nome_est AS "Nome",
SUM(controle_pizza.qtd_cont) AS "Quantidade"
FROM Estoque JOIN Controle_Pizza
ON Estoque.id_est = controle_pizza.id_pizza
GROUP BY estoque.nome_est
ORDER BY "Quantidade" ASC
FETCH FIRST 1 ROWS ONLY;

-- 4º A Média de Pizzas Vendidas por Dia por Data
SELECT controle_pizza.data_cont as "Data",
TRUNC(AVG(controle_pizza.qtd_cont),2) AS "Quantidade"
FROM Estoque JOIN Controle_Pizza
ON Estoque.id_est = controle_pizza.id_pizza
GROUP BY controle_pizza.data_cont
ORDER BY "Data";

-- 5º Quantas Pizzas Vendidas por dia
SELECT controle_pizza.data_cont AS "Data",
SUM(controle_pizza.qtd_cont) AS "Total"
FROM Estoque JOIN Controle_Pizza
ON Estoque.id_est = controle_pizza.id_pizza
GROUP BY controle_pizza.data_cont
ORDER BY "Data";

-- 6º Quantidade de pizza produzidas por sabor
SELECT pizza.nome_pizza AS "Pizza",
SUM(controle_pizza.qtd_cont) AS "Quantidade"
FROM pizza JOIN controle_pizza
ON pizza.id_pizza = controle_pizza.id_pizza
GROUP BY pizza.nome_pizza
ORDER BY "Quantidade" DESC;