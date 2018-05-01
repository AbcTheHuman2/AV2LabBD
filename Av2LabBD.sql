CREATE DATABASE Atletismo
GO
USE Atletismo

CREATE TABLE Atleta (
    codigo int identity(1,1) not null,
    nome varchar(255),
    sexo bit,
    pais_codigo char(3),
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