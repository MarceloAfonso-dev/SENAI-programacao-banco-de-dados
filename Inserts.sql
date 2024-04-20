-- Inserção de Dados
INSERT INTO tbCadastroCliente (nome, CPF, endereco1, endereco2, CEP, telefone, email) VALUES
('Maria Silva', '123.456.789-00', 'Rua Principal, 123', 'Bairro do Centro', '12345-678', '(12) 3456-7890', 'maria@email.com'),
('João Oliveira', '987.654.321-00', 'Avenida das Flores, 456', 'Bairro da Praia', '98765-432', '(98) 7654-3210', 'joao@email.com'),
('Ana Santos', '456.789.123-00', 'Rua das Pedras, 789', 'Bairro do Campo', '45678-912', '(45) 6789-1234', 'ana@email.com'),
('Pedro Souza', '321.654.987-00', 'Travessa das Oliveiras, 789', 'Bairro da Montanha', '32165-498', '(32) 1654-9876', 'pedro@email.com'),
('Carla Almeida', '654.321.987-00', 'Alameda das Árvores, 654', 'Bairro do Lago', '65432-198', '(65) 4321-9876', 'carla@email.com'),
('Marcos Pereira', '789.123.456-00', 'Praça da Paz, 321', 'Bairro da Serra', '78912-345', '(78) 9123-4567', 'marcos@email.com'),
('Juliana Costa', '456.321.789-00', 'Avenida dos Sonhos, 987', 'Bairro da Floresta', '45632-178', '(45) 6321-7890', 'juliana@email.com'),
('Rafael Lima', '789.456.123-00', 'Estrada do Sol, 456', 'Bairro da Lua', '78945-612', '(78) 9456-1234', 'rafael@email.com'),
('Fernanda Oliveira', '123.789.456-00', 'Rua das Estrelas, 159', 'Bairro do Mar', '12378-945', '(12) 3789-4561', 'fernanda@email.com'),
('Gustavo Pereira', '987.123.789-00', 'Avenida das Cores, 357', 'Bairro da Praia', '98712-378', '(98) 7123-7890', 'gustavo@email.com');

INSERT INTO tbUsuario (nome, usuarioLogin, senha, cargo, ativo, CPF, endereco1, endereco2, CEP, telefone, email) VALUES
('Admin', 'admin', 'admin', 'Administrador', true, '123.456.789-00', 'Rua Principal, 123', 'Bairro do Centro', '12345-678', '(12) 3456-7890', 'admin@email.com'),
('Joana Silva', 'joana.silva', 'joana123', 'Atendente', true, '987.654.321-00', 'Rua dos Atendentes, 456', 'Bairro do Atendimento', '98765-432', '(98) 7654-3210', 'joana@email.com'),
('Paulo Oliveira', 'paulo.oliveira', 'paulo123', 'Chef de Cozinha', true, '456.789.123-00', 'Rua dos Chefs, 789', 'Bairro da Cozinha', '45678-912', '(45) 6789-1234', 'paulo@email.com'),
('Mariana Souza', 'mariana.souza', 'mariana123', 'Gerente', true, '321.654.987-00', 'Rua das Entregas, 789', 'Bairro da Entrega', '32165-498', '(32) 1654-9876', 'mariana@email.com'),
('Lucas Almeida', 'lucas.almeida', 'lucas123', 'Atendente', true, '654.321.987-00', 'Rua dos Atendentes, 654', 'Bairro do Atendimento', '65432-198', '(65) 4321-9876', 'lucas@email.com');

INSERT INTO tbPizzaCardapio (valor, nome) VALUES 
(49.00,'MUSSARELA'),
(54.00,'MARGUERITA'),
(50.00,'ATUM'),
(59.00,'BACON'),
(58.00,'CAIPIRA (SERRANA)');

INSERT INTO tbEstoque (ingrediente, descricao, quantidade, insumo) VALUES
('Peito de Frango Desfiado','Grama',5000,TRUE),
('Milho','Grama',1000,TRUE),
('Catupiry','Grama',2000,TRUE),
('Mussarela','Grama',4000,TRUE),
('Tomate','Grama',3000,TRUE),
('Parmesão','Grama',4000,TRUE),
('Manjericão','Grama',1000,TRUE),
('Caixa de Pizza','Unidade',50,TRUE),
('Azeitona','Grama',1500,TRUE),
('Molho de Tomate','Mililitro',6000,TRUE),
('Bacon','Grama',5000,TRUE),
('Ovo','Unidade',22,TRUE),
('Atum','Grama',2500,TRUE),
('Cebola','Grama',2000,TRUE),
('Massa de Pizza','Grama',10000,TRUE);

INSERT INTO tbReceita (idPizza, idEstoque, quantidade) VALUES
(3,8,1),
(3,15,250),
(3,10,200),
(3,13,200),
(3,14,100),
(4,8,1),
(4,15,250),
(4,11,200),
(4,12,3),
(4,4,250),
(5,8,1),
(5,15,250),
(5,1,200),
(5,3,150),
(5,2,100),
(1,8,1),
(1,15,250),
(1,4,250),
(1,10,100),
(1,9,100),
(2,8,1),
(2,15,250),
(2,4,200),
(2,5,100),
(2,6,30),
(2,7,10);

INSERT INTO tbFormaPagamento (descricao, observacao) VALUES
('PIX','A vista'),
('Debito',''),
('Crédito','Parcela Max. 3x'),
('Dinheiro',''),
('Vale-refeição',''),
('Vale-alimentação','');

INSERT INTO tbControlePizza (idPizza, periodo, quantidade, situacao, horarioInicio, horarioFim) VALUES
(1,'2024-04-15',2,1,'18:00:00','18:30:00'),
(5,'2024-04-15',1,1,'19:00:00','19:16:00'),
(2,'2024-04-20',3,1,'17:30:00','18:20:00'),
(4,'2024-04-20',1,0,'18:30:00','');

INSERT INTO tbPedido (idCliente, idFormaPgto, idUsuario, subtotal, observacao) VALUES
(6,1,5,58.00,''),
(1,2,5,54.00,'Sem Manjericão');

-- Inserindo Pizza do Controle ao Estoque
INSERT INTO tbEstoque (ingrediente, descricao, quantidade, insumo) VALUES
('Pizza Mussarela','',2,0),
('Pizza Caipira (Serrana)','',1,0),
('Pizza Marguerita','',3,0);

INSERT INTO tbVenda (idPedido, idEstoque, quantidade, valor) VALUES
(1,16,1,49.00),
(1,16,1,49.00),
(2,18,1,54.00);