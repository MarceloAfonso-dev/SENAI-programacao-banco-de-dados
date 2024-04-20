SELECT 
    (SELECT nome FROM tbPizzaCardapio WHERE idPizza = 2) AS nome, 
    ingrediente 
FROM tbEstoque 
WHERE idEstoque IN (
    SELECT idEstoque 
    FROM tbReceita
    WHERE idPizza = 2
);

-- Clientes que fizeram pedidos (Union) 
SELECT idCliente FROM tbCadastroCliente INTERSECT SELECT idCliente FROM tbPedido;
-- Clientes que não fizeram pedidos
SELECT idCliente FROM tbCadastroCliente EXCEPT SELECT idCliente FROM tbPedido;
-- Unindo todos os dados de clientes em específico
SELECT * FROM tbCadastroCliente WHERE idCliente = 1 UNION SELECT * FROM tbCadastroCliente WHERE idCliente = 6;
-- Clientes que não fizeram pedido
SELECT idCliente FROM tbCadastroCliente EXCEPT SELECT idCliente FROM tbPedido;
-- Conta números de clientes
SELECT COUNT(idCliente) AS TOTAL FROM tbCadastroCliente;
-- Conta todos os clientes que não compraram
SELECT COUNT(idCliente) FROM tbCadastroCliente WHERE idCliente IN (SELECT idCliente FROM tbCadastroCliente EXCEPT SELECT idCliente FROM tbPedido);

-- Dados de quem comprou por pedido
SELECT p.idCliente, c.nome AS nome_cliente, p.idPedido, p.periodo
FROM tbPedido p
JOIN tbCadastroCliente c ON p.idCliente = c.idCliente;

CALL getClientes();
CALL getCompradores();
CALL getSetCompradores();
DROP TABLE temp_compradores;
SELECT * FROM temp_compradores;

DELIMITER $$
CREATE PROCEDURE Verificar(OUT quantidade INT)
BEGIN
SELECT COUNT(*) INTO quantidade FROM tbCadastroCliente;
END$$
DELIMITER ;

CALL Verificar(@tot);
SELECT @tot;

DELIMITER $$
CREATE PROCEDURE Elevar(INOUT numero INT)
BEGIN
SET numero = numero * numero;
END $$
DELIMITER ;

SET @valor = 5;
CALL Elevar(@valor);
SELECT @valor;

DELIMITER //
CREATE FUNCTION hi(nome VARCHAR(100))
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
	RETURN CONCAT('Ola meu amigo, ',nome,'!');
END; //
DELIMITER ;

SELECT hi("Marcelo") ;

DELIMITER //
CREATE FUNCTION valtotal(valor int, qtde int)
RETURNS int DETERMINISTIC
BEGIN
	DECLARE total int;
    SET total = valor*qtde;
    RETURN total;
END; //
DELIMITER ;

SELECT *, valtotal(valor,quantidade) AS RESULTADO FROM tbVenda;