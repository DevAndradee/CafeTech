CREATE DATABASE sprint1;
USE sprint1;

CREATE TABLE produtor (
    id_produtor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

INSERT INTO produtor (nome, email, telefone) VALUES
('João da Silva', 'joao@email.com', '11987654321'),
('Carlos Oliveira', 'carlos@email.com', '11976543210'),
('Marcos Santos', 'marcos@email.com', '11965432109'),
('André Souza', 'andre@email.com', '11954321098');

CREATE TABLE plantacao (
    id_plantacao INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    area_hectares DECIMAL(6,2) NOT NULL,
    tipo_cafe VARCHAR(50) NOT NULL,
    localizacao VARCHAR(150),
    id_produtor INT,
    CHECK (area_hectares > 0)
);

INSERT INTO plantacao 
(nome, area_hectares, tipo_cafe, localizacao, id_produtor) VALUES
('Fazenda Boa Vista', 20.00, 'Café Arábica', 'Minas Gerais', 1),
('Fazenda São José', 15.50, 'Café Arábica', 'São Paulo', 2),
('Fazenda Esperança', 32.75, 'Café Arábica', 'Minas Gerais', 3),
('Sítio do Café', 8.50, 'Café Arábica', 'Espírito Santo', 4);

CREATE TABLE sensor (
    id_sensor INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(50) NOT NULL,
    profundidade_cm INT NOT NULL,
    estado_sensor VARCHAR(20) NOT NULL,
    id_plantacao INT,
    CHECK (profundidade_cm = 20),
    CHECK (estado_sensor IN ('ATIVO', 'INATIVO', 'MANUTENCAO'))
);

INSERT INTO sensor 
(modelo, profundidade_cm, estado_sensor, id_plantacao) VALUES
('Sensor FDR de Umidade do Solo', 20, 'ATIVO', 1),
('Sensor FDR de Umidade do Solo', 20, 'ATIVO', 1),
('Sensor FDR de Umidade do Solo', 20, 'ATIVO', 1),
('Sensor FDR de Umidade do Solo', 20, 'ATIVO', 2),
('Sensor FDR de Umidade do Solo', 20, 'MANUTENCAO', 2),
('Sensor FDR de Umidade do Solo', 20, 'INATIVO', 3),
('Sensor FDR de Umidade do Solo', 20, 'ATIVO', 4);

CREATE TABLE leitura_sensor (
    id_leitura INT PRIMARY KEY AUTO_INCREMENT,
    umidade DECIMAL(5,2) NOT NULL,
    data_hora DATETIME NOT NULL,
    id_sensor INT,
    CHECK (umidade >= 0 AND umidade <= 100)
);

INSERT INTO leitura_sensor 
(umidade, data_hora, id_sensor) VALUES
(72.50, '2026-09-06 08:00:00', 1),
(68.30, '2026-09-06 10:00:00', 1),
(55.80, '2026-09-06 12:00:00', 1),
(48.20, '2026-09-06 14:00:00', 1),
(75.40, '2026-09-06 08:00:00', 2),
(63.70, '2026-09-06 10:00:00', 2),
(81.20, '2026-09-06 08:00:00', 3),
(77.90, '2026-09-06 10:00:00', 3),
(45.60, '2026-09-06 08:00:00', 4),
(52.30, '2026-09-06 10:00:00', 4),
(38.70, '2026-09-06 08:00:00', 5),
(35.20, '2026-09-06 08:00:00', 6),
(69.80, '2026-09-06 08:00:00', 7);

SELECT * 
FROM produtor;

SELECT nome, email
FROM produtor;

SELECT *
FROM plantacao
WHERE area_hectares > 20;

SELECT *
FROM sensor
WHERE status = 'ATIVO';

SELECT *
FROM sensor
WHERE profundidade_cm = 20;

SELECT *
FROM plantacao
ORDER BY area_hectares DESC;

SELECT *
FROM leitura_sensor
WHERE umidade < 50;

SELECT *
FROM leitura_sensor
WHERE umidade BETWEEN 50 AND 80;

SELECT 
    CONCAT('Sensor ', modelo, ' - ', profundidade_cm, ' cm') AS identificacao
FROM sensor;

SELECT 
    umidade,
    CASE
        WHEN umidade < 40 THEN 'UMIDADE BAIXA'
        WHEN umidade <= 70 THEN 'UMIDADE IDEAL'
        ELSE 'UMIDADE ALTA'
    END AS estado
FROM leitura_sensor;

SELECT 
    CONCAT('Sensor ', modelo) AS sensor,
    profundidade_cm,
    status
FROM sensor
WHERE status = 'ATIVO'
ORDER BY profundidade_cm;

SELECT 
    CONCAT(
        'Sensor: ', modelo,
        ' | Profundidade: ', profundidade_cm, ' cm',
        ' | Status: ',
        CASE
            WHEN status = 'ATIVO' THEN 'Funcionando normalmente'
            WHEN status = 'INATIVO' THEN 'Sensor desligado'
            ELSE 'Necessita de manutenção'
        END
    ) AS informacao_sensor
FROM sensor;

SELECT 
    CONCAT(
        'Sensor ', id_sensor,
        ' | Umidade: ', umidade, '%',
        ' | Situação: ',
        CASE
            WHEN umidade < 40 THEN 'ALERTA - Umidade baixa'
            WHEN umidade <= 70 THEN 'Umidade ideal'
            ELSE 'Umidade alta'
        END
    ) AS status_umidade
FROM leitura_sensor;
