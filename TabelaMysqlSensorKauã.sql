CREATE DATABASE monitoramento_cafe;

USE monitoramento_cafe;


CREATE TABLE empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    cnpj CHAR(14)
);


CREATE TABLE endereco (
    idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado CHAR(2),
    cep CHAR(8)
);


CREATE TABLE sensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(10) NOT NULL,
    umidade DECIMAL(5,2),
    estadoSensor VARCHAR(35),

    CONSTRAINT chkStatus
        CHECK (status IN ('ativo', 'inativo')),

    CONSTRAINT chkEstadoSensor
        CHECK (
            estadoSensor IN (
                'Umidade ideal',
                'Umidade em estado de alerta',
                'Umidade em estado grave'
            )
        )
);