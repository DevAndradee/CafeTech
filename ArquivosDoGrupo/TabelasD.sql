-- tabela pi
create database cafe;
use cafe;
create table cliente (
    id_cliente int auto_increment primary key,
    nome_empresa varchar(100) not null,
    nome_produtor varchar(100) not null,
    cnpj char(18) unique not null,
    email varchar(100) unique not null,
    celular char(15),
    telefone varchar(14) default 'Sem telefone',
    data_cadastro date,	
    contato_pref varchar(10),
    constraint chk_contato_pref check (contato_pref in ('WhatsApp', 'E-mail', 'SMS')),
    status_cliente varchar(15) default 'Ativo' not null,
    constraint chk_status_cliente check (status_cliente in ('Ativo', 'Inativo', 'Suspenso'))
);

create table propriedade (
    id_propriedade int auto_increment primary key,
    nome_fazenda varchar(100) not null,
    hectares decimal(8,2) not null,
    cidade varchar(50) not null,
    estado char(2) not null,
    cep char(9) not null,
    tipo_solo varchar(50)
);
create table leiturasensor (
    id_leitura int auto_increment primary key,
    umidade decimal(4,1) not null,
    data_hora datetime default current_timestamp,
    constraint chk_umidade check (umidade between 0 and 100)
);

alter table cliente
add constraint chk_email check (email like '%@%');


insert into cliente (nome_empresa, nome_produtor, cnpj, email, celular, telefone, data_cadastro, contato_pref, status_cliente) values
('agro silva', 'carlos silva', '12.345.678/0001-99', 'carlos@email.com', '(11) 98888-7777', '(11) 3333-4444', '2026-01-15', 'WhatsApp', 'Ativo'),
('cafezal ltda', 'mariana souza', '98.765.432/0001-11', 'mariana@email.com', null, default, '2026-02-20', 'E-mail', 'Ativo'),
('sítio boa vista', 'roberto alves', '11.122.233/0001-44', 'roberto@email.com', '(16) 97777-6666', '(16) 3333-2222', '2026-03-10', 'SMS', 'Inativo'),
('fazendas alvarenga', 'mariana junqueira', '44.455.566/0001-22', 'mariana.j@email.com', '(16) 99123-5566', default, '2026-04-05', 'WhatsApp', 'Ativo'),
('agrocafé brasil', 'joão da silva', '55.566.677/0001-33', 'joao.silva@email.com', '(35) 98765-4321', '(35) 3211-1000', '2026-05-12', 'E-mail', 'Suspenso'),
('cafealegre ltda', 'lucas ferreira', '66.677.788/0001-55', 'lucas@email.com', '(31) 99876-1234', default, '2026-06-01', 'WhatsApp', 'Ativo');


insert into propriedade (nome_fazenda, hectares, cidade, estado, cep, tipo_solo) values
('fazenda vista alegre', 50.50, 'varginha', 'MG', '37000-000', 'argiloso'),
('sítio alto do cafezal', 25.00, 'patrocínio', 'MG', '38700-000', 'arenoso'),
('fazenda santa luzia', 100.00, 'franca', 'SP', '14400-000', 'misto'),
('fazenda boa esperança', 75.20, 'manhuaçu', 'MG', '36900-000', 'argiloso'),
('sítio recanto do café', 20.00, 'venda nova do imigrante', 'ES', '29375-000', 'humífero'),
('fazenda monte verde', 120.00, 'poços de caldas', 'MG', '37700-000', 'misto');

insert into leiturasensor (umidade, data_hora) values
(70.5, '2026-09-06 08:00:00'),
(35.2, '2026-09-06 09:00:00'),
(92.0, '2026-09-06 10:00:00'),
(62.4, '2026-09-06 11:00:00'),
(28.0, '2026-09-06 12:00:00'),
(81.3, '2026-09-06 13:00:00');

-- Mudança de telefone de usuário
update cliente set telefone = '1140028922'
where id_cliente = 2;

select * from cliente;
select * from propriedade;
select * from leiturasensor;



-- Filtrar clientes mais lucrativos (ordenados pelos hectares)
select * from propriedade
where hectares > 70
order by hectares desc;

-- Alteração e exclusão de extruturas
-- Renomear tabela
rename table cliente to usuário;

-- Deletar coluna (Decidimos que celular será suficiente para contato)
alter table usuário drop column telefone;

-- renomear coluna (decidimos renomear a coluna umidade, porque como é usado %, é mais lógico
-- chamar a coluna de "umidade_relativa"
-- (primeiro deletar a constraint para poder mudar)
alter table leiturasensor drop constraint chk_umidade;
alter table leiturasensor rename column umidade to umidade_relativa;
alter table leiturasensor add constraint chk_umidade check (umidade_relativa between 0 and 100);

-- SELECTS DEFINITIVOS PARA AS 3 TABELAS:
select 
    id_cliente as "id",
    nome_empresa as "empresa / sítio",
    nome_produtor as "nome do produtor",
    cnpj as "cnpj",
    email as "e-mail",
    ifnull(celular, 'Sem celular') as "Celular",
    date_format(data_cadastro, '%d/%m/%Y') as 'data do cadastro',
    contato_pref as "contato preferencial",
    status_cliente as "status do cliente"
from usuário;

select 
    id_propriedade as "id",
    nome_fazenda as "nome da propriedade",
    concat(hectares, ' ha') as "tamanho da área",
    cidade,
    upper(estado) as "UF",
    cep as "CEP",
    tipo_solo as "tipo de solo"
from propriedade;

select 
    id_leitura as "id leitura",
    concat(umidade_relativa, '%') as "umidade do solo",
    date_format(data_hora, '%d/%m/%Y %H:%i:%s') as 'data do cadastro',
    case 
        when umidade_relativa < 40.0 then 'Solo seco'
        when umidade_relativa between 40.0 and 80.0 then 'Solo ideal'
        else 'Solo encharcado'
    end as "condição do solo"
from leiturasensor;
