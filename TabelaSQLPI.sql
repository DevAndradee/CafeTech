CREATE DATABASE sprint1;

USE sprint1;

CREATE TABLE produtor (
    id_produtor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(200)
);

CREATE TABLE plantacao (
    id_plantacao INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    hectares DECIMAL(10,2),
    tipo_cafe VARCHAR(50)
);

CREATE TABLE sensor (
    id_sensor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    localizacao VARCHAR(100),
    umidade DECIMAL(10,2),
    status VARCHAR(30)
);

INSERT INTO produtor (nome, email, telefone, endereco)
VALUES
('João da Silva', 'joao@email.com', '11999999999', 'Rua das fazendas, 100');

INSERT INTO plantacao (nome, hectares, tipo_cafe)
VALUES
('Fazenda São José', 15, 'Café Arábica');

INSERT INTO sensor (nome, localizacao, umidade, status)
VALUES
('Sensor 1', 'Plantação 1', 65.50, 'Normal'),
('Sensor 2', 'Plantação 2', 42.30, 'Baixa'),
('Sensor 3', 'Plantação 3', 90.20, 'Alta');

SELECT * FROM produtor;

SELECT * FROM plantacao;

SELECT * FROM sensor;