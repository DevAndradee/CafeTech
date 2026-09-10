CREATE DATABASE monitoramento_cafe;
USE monitoramento_cafe;


CREATE TABLE produtor (
    idProdutor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    empresa VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);


CREATE TABLE irrigador (
    idIrrigador INT PRIMARY KEY AUTO_INCREMENT,
    areaHectares DECIMAL(5,2) NOT NULL,
    quantidadeSensores INT NOT NULL,
    CONSTRAINT chk_area
    CHECK (areaHectares > 0 AND areaHectares <= 20),
    CONSTRAINT chk_sensor
    CHECK (quantidadeSensores > 0)
);


CREATE TABLE leitura_umidade (
    idLeitura INT PRIMARY KEY AUTO_INCREMENT,
    umidade DECIMAL(5,2) NOT NULL,
    dataHora DATETIME NOT NULL,
    irrigador INT NOT NULL,
    CONSTRAINT chk_umidade
    CHECK (umidade >= 0 AND umidade <= 100)
);


INSERT INTO produtor VALUES
(default, 'João da Silva', 'Fazenda Boa Vista', 'joao@gmail.com', '11999999999'),
(default, 'Maria Oliveira', 'Fazenda São José', 'maria@gmail.com', '11988888888'),
(default, 'Eduardo Brasil', 'Fazenda Brasil', 'eduardo@gmail.com', '11987877777'),
(default, 'Mariana Soares', 'Fazenda Bonita', 'mariana@gmail.com', '11922222222');


INSERT INTO irrigador VALUES
(default, 20.00, 1),
(default, 15.50, 1),
(default, 18.00, 1),
(default, 16.00, 1);


INSERT INTO leitura_umidade VALUES
(default, 65.50, '2026-09-07 08:00:00', 1),
(default, 48.20, '2026-09-07 10:00:00', 1),
(default, 72.80, '2026-09-07 12:00:00', 2),
(default, 35.40, '2026-09-07 14:00:00', 3);


SELECT * FROM produtor;

SELECT * FROM irrigador;

SELECT * FROM leitura_umidade;

ALTER TABLE produtor ADD COLUMN cidade VARCHAR(50);

UPDATE produtor SET cidade = 'São Paulo' WHERE idProdutor = 1;
