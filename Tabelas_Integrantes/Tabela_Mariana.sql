CREATE DATABASE monitoramento_cafe;
USE monitoramento_cafe;

CREATE TABLE produtor(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
propriedade VARCHAR(100),
hectares_total DECIMAL(10,2),
cidade VARCHAR(50)
);

INSERT INTO produtor VALUES
(default, 'Mariana Soares', 'Fazenda OLR', 20.00, 'Mairiporã'),
(default, 'Daniel Mattos', 'Fazenda Boiçucanga', 35.00, 'Mairiporã'),
(default, 'Maria Eduarda Andreata', 'Fazenda Tricolor', 50.00, 'Bragança Paulista'),
(default, 'Nataly Rufino', 'Fazenda Adopo', 60.00, 'Atibaia');

SELECT * FROM produtor;


CREATE TABLE irrigador(
id INT PRIMARY KEY AUTO_INCREMENT,
idProdutor INT,
hectaresAtendidos DECIMAL(10,2),
dataInstalacao DATETIME,
ativo TINYINT,
CONSTRAINT chkHectaresAtendidos CHECK (hectaresAtendidos <= 20)
);

INSERT INTO irrigador VALUES
(default, 1, 10.00, '2026-02-07 08:00:00', 1),
(default, 1, 20.00, '2026-04-08 09:30:00', 0),
(default, 2, 10.00, '2026-06-15 10:00:00', 1),
(default, 2, 15.00, '2026-08-18 14:00:00', 1),
(default, 3, 10.00, '2026-08-06 14:20:00', 0),
(default, 4, 20.00, '2026-10-29 14:40:00', 1);

SELECT * FROM irrigador;


CREATE TABLE leituraUmidade(
id INT PRIMARY KEY AUTO_INCREMENT,
idIrrigador INT,
umidadePercentual DECIMAL(5,2),
dataLeitura DATETIME,
CONSTRAINT chkUmidade CHECK (umidadePercentual BETWEEN 0 AND 100)
);

INSERT INTO leituraUmidade VALUES
(default, 1, 42.50, '2026-08-20 08:00:00'),
(default, 1, 39.80, '2026-08-20 08:08:00'),
(default, 2, 50.20, '2026-08-20 07:07:00'),
(default, 2, 28.10, '2026-08-20 09:07:00'),
(default, 3, 55.60, '2026-08-20 01:29:00'),
(default, 3, 60.00, '2026-08-20 09:02:00'),
(default, 4, 30.40, '2026-08-20 10:08:00'),
(default, 4, 47.90, '2026-08-20 12:20:00');

SELECT * FROM leituraUmidade;
