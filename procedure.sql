DELIMITER $$
CREATE PROCEDURE getSetCompradores()
BEGIN
    -- Criação da tabela temporária
    CREATE TEMPORARY TABLE temp_compradores AS
    SELECT p.idCliente, c.nome AS nome_cliente, p.idPedido, p.periodo
    FROM tbPedido p
    JOIN tbCadastroCliente c ON p.idCliente = c.idCliente;
    SELECT * FROM temp_compradores;
END$$
DELIMITER ;
-- DROP PROCEDURE getSetCompradores;