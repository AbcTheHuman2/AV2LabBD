CREATE DATABASE Atletismo
GO
USE Atletismo

CREATE TABLE Atleta (
    codigo int identity(1,1) not null,
    nome varchar(255),
    masculino bit not null,
    pais_codigo char(3) not null,
    primary key (codigo),
    foreign key (pais_codigo) references Pais(codigo)
)

CREATE TABLE Pais (
    codigo char(3) not null,
    nome varchar(255) not null
    primary key (codigo)
)

CREATE TABLE Prova (
    id int not null,
    nome varchar(255) not null,
    sexo bit,
    primary key (id)
)

CREATE TABLE Bateria (
    id int not null,
    prova_id int not null,
    primary key (id),
    foreign key (prova_id) references Prova(id)
)

CREATE TABLE Atleta_Bateria (
    atleta_codigo int not null,
    bateria_id int not null,
    desempenho numeric(9),
    desempenho_2 numeric(9),
    desempenho_3 numeric(9),
    desempenho_4 numeric(9),
    desempenho_5 numeric(9),
    desempenho_6 numeric(9),
    primary key (atleta_codigo, bateria_id),
    foreign key (atleta_codigo) references Atleta(codigo),
    foreign key (bateria_id) references Bateria(id)
)

CREATE TABLE Recorde (
    prova_id int not null,
    mundial bit not null,
    atleta_codigo int,
    bateria_id int,
    primary key (prova_id, mundial),
    foreign key (prova_id) references Prova(id)
)

INSERT INTO Prova
VALUES
(0, 'Lançamento do Dardo', 0),
(1, 'Salto em Distância', 1),
(2, 'Salto com Vara', 1),
(3, '400 m com barreiras', 1),
(4, '100 m', 0),
(5, 'Arremesso do Peso', 0),
(6, '100 m', 1),
(7, '3000 m', 1),
(8, 'Lançamento do Disco', 1),
(9, '3000 m com obstáculos', 0),
(10, 'Salto Triplo', 0),
(11, '400 m', 1),
(12, '800 m', 0),
(13, '800 m', 1),
(14, '200 m', 0),
(15, '200 m', 1)

SET IDENTITY_INSERT dbo.Atleta ON

INSERT INTO Atleta
VALUES
(0, 'Capitão América', 0, 'AFG')

INSERT INTO Pais
VALUES
('AFG', 'Afeganistão'),
('ALB', 'Albânia'),
('ALG', 'Argélia'),
('AND', 'Andorra'),
('ANG', 'Angola'),
('ANT', 'Antígua e Barbuda'),
('ASA', 'Samoa Americana'),
('ARG', 'Argentina'),
('ARM', 'Armênia'),
('ARU', 'Aruba'),
('AUS', 'Austrália'),
('AUT', 'Áustria'),
('AZE', 'Azerbaijão'),
('BAH', 'Bahamas'),
('BAN', 'Bangladesh'),
('BAR', 'Barbados'),
('BDI', 'Burundi'),
('BEL', 'Bélgica'),
('BEN', 'Benim'),
('BER', 'Bermudas'),
('BHU', 'Butão'),
('BIH', 'Bósnia e Herzegovina'),
('BIZ', 'Belize'),
('BLR', 'Bielorrúsia'),
('BOL', 'Bolívia'),
('BOT', 'Botswana'),
('BRA', 'Brasil'),
('BRN', 'Bahrein'),
('BRU', 'Brunei'),
('BUL', 'Bulgária'),
('BUR', 'Burkina Faso'),
('CAF', 'República Centro-Africana'),
('CAM', 'Camboja'),
('CAN', 'Canadá'),
('CAY', 'Ilhas Cayman'),
('CGO', 'República do Congo'),
('CHA', 'Chade'),
('CHI', 'Chile'),
('CHN', 'China'),
('CIV', 'Costa do Marfim'),
('CMR', 'Camarões'),
('COD', 'República Democrática do Congo'),
('COK', 'Ilhas Cook'),
('COL', 'Colômbia'),
('COM', 'Comores'),
('CPV', 'Cabo Verde'),
('CRC', 'Costa Rica'),
('CRO', 'Croácia'),
('CUB', 'Cuba'),
('CYP', 'Chipre'),
('CZE', 'República Checa'),
('DEN', 'Dinamarca'),
('DJI', 'Djibouti'),
('DMA', 'Dominica'),
('DOM', 'República Dominicana'),
('ECU', 'Equador'),
('EGY', 'Egito'),
('ERI', 'Eritreia'),
('ESA', 'El Salvador'),
('ESP', 'Espanha'),
('EST', 'Estónia'),
('ETH', 'Etiópia'),
('FIJ', 'Fiji'),
('FIN', 'Finlândia'),
('FRA', 'França'),
('FSM', 'Estados Federados da Micronésia')

create trigger t_verificarDesCorrida
on Atleta_Bateria
for insert
as
begin
	declare @desempenho_maior numeric(9),
			@desempenho numeric(9)
	set @desempenho_maior = 0
	set @desempenho = (select desempenho from inserted)
    if (@desempenho > @desempenho_maior)
    begin
        set @desempenho_maior = @desempenho
    end
    select * from Recorde where prova_id = @prova_id AND mundial = 1
end

create trigger t_verificarDesSalto
on Atleta_Bateria
for insert
as
begin
    declare @desempenho_maior numeric(9),
            @des_1 numeric(9),
            @des_2 numeric(9),
            @des_3 numeric(9),
            @des_4 numeric(9),
            @des_5 numeric(9),
            @des_6 numeric(9)
    set @desempenho_maior = 0
    set @des_1 = (select desempenho from inserted)
    set @des_2 = (select desempenho_2 from inserted)
    set @des_3 = (select desempenho_3 from inserted)
    set @des_4 = (select desempenho_4 from inserted)
    set @des_5 = (select desempenho_5 from inserted)
    set @des_6 = (select desempenho_6 from inserted)
    if (@des_1 > @desempenho_maior)
    begin
        set @desempenho_maior = @des_1
    end
    if (@des_2 > @desempenho_maior)
    begin
        set @desempenho_maior = @des_2
    end
    if (@des_3 > @desempenho_maior)
    begin
        set @desempenho_maior = @des_3
    end
    if (@des_4 > @desempenho_maior)
    begin
        set @desempenho_maior = @des_4
    end
    if (@des_5 > @desempenho_maior)
    begin
        set @desempenho_maior = @des_5
    end
    if (@des_6 > @desempenho_maior)
    begin
        set @desempenho_maior = @des_6
    end
    select * from Recorde where prova_id = @prova_id AND mundial = 1
end

create trigger t_verificapais
on Pais
after delete
as begin
	rollback transaction
	raiserror('Não é possível excluir País', 16,1)
end

create trigger t_verificaatleta
on Atleta
after delete
as begin
	rollback transaction
	raiserror('Não é possível excluir Atleta', 16,1)
end

INSERT INTO Pais
VALUES
('ARG', 'Argentina'),
('BRA', 'Brasil'),
('CAN', 'Canadá'),
('CHN', 'China'),
('ESP', 'Espanha'),
('FRA', 'França')

INSERT INTO Atleta (nome, masculino, pais_codigo)
VALUES
('Joseph', 1, 'CAN'),
('August', 1, 'ARG'),
('Natalie', 0, 'ARG'),
('Nassier', 1, 'FRA'),
('Yang', 0, 'CHN'),
('Wan', 1, 'CHN'),
('Karrina', 0, 'ESP'),
('Maria', 0, 'BRA'),
('Julio', 1, 'BRA'),
('Yuli', 0, 'CAN'),
('Brutus', 1, 'ESP'),
('Leticia', 0, 'FRA')

create function fn_resultadosAtletas(@prova_codigo int)
returns
@prova_resultados table (
    atleta_nome varchar(255),
    pais_nome varchar(255),
    desempenho numeric(9)
)
as
begin
    insert into @prova_resultados (atleta_nome)
    select nome from Atleta
    update @prova_resultados
    set pais_nome from Pais
    update @prova_resultados
    set desempenho from Atleta_Bateria
end