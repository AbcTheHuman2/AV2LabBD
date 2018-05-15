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
(0, 'Lan�amento do Dardo', 0),
(1, 'Salto em Dist�ncia', 1),
(2, 'Salto com Vara', 1),
(3, '400 m com barreiras', 1),
(4, '100 m', 0),
(5, 'Arremesso do Peso', 0),
(6, '100 m', 1),
(7, '3000 m', 1),
(8, 'Lan�amento do Disco', 1),
(9, '3000 m com obst�culos', 0),
(10, 'Salto Triplo', 0),
(11, '400 m', 1),
(12, '800 m', 0),
(13, '800 m', 1),
(14, '200 m', 0),
(15, '200 m', 1)

SET IDENTITY_INSERT dbo.Atleta ON

INSERT INTO Atleta
VALUES
(0, 'Capit�o Am�rica', 0, 'AFG')

INSERT INTO Pais
VALUES
('AFG', 'Afeganist�o'),
('ALB', 'Alb�nia'),
('ALG', 'Arg�lia'),
('AND', 'Andorra'),
('ANG', 'Angola'),
('ANT', 'Ant�gua e Barbuda'),
('ASA', 'Samoa Americana'),
('ARG', 'Argentina'),
('ARM', 'Arm�nia'),
('ARU', 'Aruba'),
('AUS', 'Austr�lia'),
('AUT', '�ustria'),
('AZE', 'Azerbaij�o'),
('BAH', 'Bahamas'),
('BAN', 'Bangladesh'),
('BAR', 'Barbados'),
('BDI', 'Burundi'),
('BEL', 'B�lgica'),
('BEN', 'Benim'),
('BER', 'Bermudas'),
('BHU', 'But�o'),
('BIH', 'B�snia e Herzegovina'),
('BIZ', 'Belize'),
('BLR', 'Bielorr�sia'),
('BOL', 'Bol�via'),
('BOT', 'Botswana'),
('BRA', 'Brasil'),
('BRN', 'Bahrein'),
('BRU', 'Brunei'),
('BUL', 'Bulg�ria'),
('BUR', 'Burkina Faso'),
('CAF', 'Rep�blica Centro-Africana'),
('CAM', 'Camboja'),
('CAN', 'Canad�'),
('CAY', 'Ilhas Cayman'),
('CGO', 'Rep�blica do Congo'),
('CHA', 'Chade'),
('CHI', 'Chile'),
('CHN', 'China'),
('CIV', 'Costa do Marfim'),
('CMR', 'Camar�es'),
('COD', 'Rep�blica Democr�tica do Congo'),
('COK', 'Ilhas Cook'),
('COL', 'Col�mbia'),
('COM', 'Comores'),
('CPV', 'Cabo Verde'),
('CRC', 'Costa Rica'),
('CRO', 'Cro�cia'),
('CUB', 'Cuba'),
('CYP', 'Chipre'),
('CZE', 'Rep�blica Checa'),
('DEN', 'Dinamarca'),
('DJI', 'Djibouti'),
('DMA', 'Dominica'),
('DOM', 'Rep�blica Dominicana'),
('ECU', 'Equador'),
('EGY', 'Egito'),
('ERI', 'Eritreia'),
('ESA', 'El Salvador'),
('ESP', 'Espanha'),
('EST', 'Est�nia'),
('ETH', 'Eti�pia'),
('FIJ', 'Fiji'),
('FIN', 'Finl�ndia'),
('FRA', 'Fran�a'),
('FSM', 'Estados Federados da Micron�sia')

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
	raiserror('N�o � poss�vel excluir Pa�s', 16,1)
end

create trigger t_verificaatleta
on Atleta
after delete
as begin
	rollback transaction
	raiserror('N�o � poss�vel excluir Atleta', 16,1)
end

INSERT INTO Pais
VALUES
('ARG', 'Argentina'),
('BRA', 'Brasil'),
('CAN', 'Canad�'),
('CHN', 'China'),
('ESP', 'Espanha'),
('FRA', 'Fran�a')

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