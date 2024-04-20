-- Criando Banco de Dados no Padrão UTF8
CREATE DATABASE db_mariosPizzaria CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Criando Tabelas e Definindo Chaves Primarias
CREATE TABLE tbCadastroCliente(
idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(200) NOT NULL,
CPF VARCHAR(20) NOT NULL,
endereco1 VARCHAR(150),
endereco2 VARCHAR(150),
CEP VARCHAR(20),
telefone VARCHAR(20),
email VARCHAR(200)
);

CREATE TABLE tbPizzaCardapio(
idPizza INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
valor FLOAT
);

-- Pequena modificação para valor e acrescentando nome
ALTER TABLE tbPizzaCardapio
MODIFY COLUMN valor DECIMAL(10,2);
ALTER TABLE tbPizzaCardapio
ADD COLUMN nome VARCHAR(150);

CREATE TABLE tbControlePizza(
idControle INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
idPizza INT NOT NULL,
periodo DATE NOT NULL,
quantidade INT NOT NULL,
situacao BOOLEAN NOT NULL,
horarioInicio TIME NOT NULL,
horarioFim TIME NOT NULL
);

CREATE TABLE tbReceita(
idReceita INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
idPizza INT NOT NULL,
idEstoque INT NOT NULL,
quantidade DOUBLE
);

CREATE TABLE tbEstoque(
idEstoque INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ingrediente VARCHAR(150) NOT NULL,
descricao VARCHAR(150),
quantidade DOUBLE,
insumo BOOLEAN
);

CREATE TABLE tbUsuario(
idUsuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(150) NOT NULL,
usuarioLogin VARCHAR(100),
senha VARCHAR(50),
cargo VARCHAR(100),
ativo BOOLEAN,
CPF VARCHAR(20),
endereco1 VARCHAR(150),
endereco2 VARCHAR(150),
CEP VARCHAR(20),
telefone VARCHAR(20),
email VARCHAR(150)
);

CREATE TABLE tbPedido(
idPedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
idCliente INT NOT NULL,
idFormaPgto INT NOT NULL,
idUsuario INT NOT NULL,
subtotal DECIMAL(10,2),
observacao VARCHAR(100)
);

CREATE TABLE tbVenda(
idVenda INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
idPedido INT NOT NULL,
idEstoque INT NOT NULL,
quantidade INT,
valor DECIMAL(10,2)
);

CREATE TABLE tbFormaPagamento(
idFormaPgto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR(50) NOT NULL,
observacao VARCHAR(100)
);

-- Acrescentando Chave Estrangeira 
ALTER TABLE tbVenda ADD FOREIGN KEY (idEstoque) REFERENCES tbEstoque (idEstoque);
ALTER TABLE tbVenda ADD FOREIGN KEY (idPedido) REFERENCES tbPedido (idPedido);
ALTER TABLE tbPedido ADD FOREIGN KEY (idCliente) REFERENCES tbCadastroCliente (idCliente);
ALTER TABLE tbPedido ADD FOREIGN KEY (idFormaPgto) REFERENCES tbFormaPagamento (idFormaPgto);
ALTER TABLE tbPedido ADD FOREIGN KEY (idUsuario) REFERENCES tbUsuario (idUsuario);
ALTER TABLE tbControlePizza ADD FOREIGN KEY (idPizza) REFERENCES tbPizzaCardapio (idPizza);
ALTER TABLE tbReceita ADD FOREIGN KEY (idPizza) REFERENCES tbPizzaCardapio (idPizza);
ALTER TABLE tbReceita ADD FOREIGN KEY (idEstoque) REFERENCES tbEstoque (idEstoque);

-- Adicionando campos data e hora em pedido
ALTER TABLE tbPedido ADD COLUMN periodo DATE, ADD COLUMN horario TIME;