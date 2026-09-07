-- Tabela 1:
create database dado;
use dado;

create table cliente (
	id int auto_increment primary key,
    nome varchar (80) not null,
    produtor varchar (100) not null,
    cnpj char (14),
    telefone varchar (20) not null,
    celular varchar (20) not null,
    email varchar (100),
    status_cliente varchar (15),
    constraint chk_status check (status_cliente in ('Ativo', 'Suspenso', 'Inadimplente'))
    );
    
create table leitura (
    id_leitura int auto_increment primary key,
    umidade decimal (4,1) not null,
    umidade relativa decimal (4,1) not null,
    data_hora datetime default current_timestamp
);

create table propriedade (
	id_propriedade int auto_increment primary key,
    nome varchar (100) not null,
    hectares decimal (8,2) not null,
    tipo_solo varchar (40) not null,
    cidade varchar (50) not null,
    estado char (2) not null,
    coordenada_gps varchar (50)
    );


-- insert cliente
INSERT INTO cliente (nome, produtor, cnpj, telefone, celular, email, status_cliente) VALUES
('Agro Silva', 'Carlos Silva', '12345678000199', '1133334444', '11988887777', 'carlos@email.com', 'Ativo'),
('Cafezal Ltda', 'Mariana Souza', '98765432000111', '3532221111', '35999998888', 'mariana@email.com', 'Ativo'),
('Sítio Boa Vista', 'Roberto Alves', '11122233000144', '1633332222', '16977776666', 'roberto@email.com', 'Inadimplente');

-- insert leitura
INSERT INTO leitura (umidade, temperatura, data_hora) VALUES
(65.5, 22.0, '2026-09-06 08:00:00'),
(40.2, 26.5, '2026-09-06 09:00:00'),
(78.0, 19.8, '2026-09-06 10:00:00');

-- insert propriedade
INSERT INTO propriedade (nome, hectares, tipo_solo, cidade, estado, coordenada_gps) VALUES
('Fazenda Vista Alegre', 50.50, 'Argiloso', 'Varginha', 'MG', '-21.55, -45.43'),
('Sítio Alto do Cafezal', 25.00, 'Arenoso', 'Patrocínio', 'MG', '-18.94, -46.99'),
('Fazenda Santa Luzia', 100.00, 'Misto', 'Franca', 'SP', '-20.53, -47.40');

Select * from cliente;
Select * from leitura;
Select * from propriedade;
    
    
