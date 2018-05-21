CREATE DATABASE Olimpiadas
GO
USE Olimpiadas

CREATE TABLE Pais (
	codigo char(3) not null,
	nome varchar(255)
	primary key (codigo)
)

CREATE TABLE Atleta (
	codigo int identity(1,1) not null,
	nome varchar(255),
	sexo bit not null,
	pais_codigo char(3) not null,
	primary key (codigo),
	foreign key (pais_codigo) references Pais(codigo)
)

CREATE TABLE Prova (
	id int not null,
	nome varchar(255) not null,
	sexo bit not null,
	tipo_desempenho bit not null,
	primary key (id)
)

CREATE TABLE Bateria (
	id int not null,
	prova_id int not null,
	final bit not null,
	primary key (id),
	foreign key (prova_id) references Prova(id)
)

CREATE TABLE Atleta_Bateria (
	atleta_codigo int not null,
	bateria_id int not null,
	desempenho numeric(9) not null,
	desempenho_2 numeric(9),
	desempenho_3 numeric(9),
	desempenho_4 numeric(9),
	desempenho_5 numeric(9),
	desempenho_6 numeric(9),
	melhor_desempenho numeric(9),
	primary key (atleta_codigo, bateria_id),
	foreign key (atleta_codigo) references Atleta(codigo),
	foreign key (bateria_id) references Bateria(id)
)

CREATE TABLE Recorde (
	prova_id int not null,
	mundial bit not null,
	atleta_codigo int not null,
	bateria_id int not null,
	primary key (prova_id, mundial),
	foreign key (prova_id) references Prova(id)
)
GO

CREATE TRIGGER t_melhorDesempenho
ON Atleta_Bateria
FOR INSERT
AS
BEGIN
    declare @melhor_desempenho numeric(9) = 0,
            @des_1 numeric(9),
            @des_2 numeric(9),
            @des_3 numeric(9),
            @des_4 numeric(9),
            @des_5 numeric(9),
            @des_6 numeric(9)

    set @des_1 = (select desempenho from inserted)
    set @des_2 = (select desempenho_2 from inserted)
    set @des_3 = (select desempenho_3 from inserted)
    set @des_4 = (select desempenho_4 from inserted)
    set @des_5 = (select desempenho_5 from inserted)
    set @des_6 = (select desempenho_6 from inserted)

    set @melhor_desempenho = @des_1

    if (@des_2 > @melhor_desempenho)
        set @melhor_desempenho = @des_2
    if (@des_3 > @melhor_desempenho)
        set @melhor_desempenho = @des_3
    if (@des_4 > @melhor_desempenho)
        set @melhor_desempenho = @des_4
    if (@des_5 > @melhor_desempenho)
        set @melhor_desempenho = @des_5
    if (@des_6 > @melhor_desempenho)
        set @melhor_desempenho = @des_6

    UPDATE Atleta_Bateria
    SET melhor_desempenho = @melhor_desempenho
    WHERE (atleta_codigo = (SELECT atleta_codigo FROM INSERTED) AND bateria_id = (SELECT bateria_id FROM INSERTED))
END
GO

CREATE TRIGGER t_manterPais
ON Pais
INSTEAD OF UPDATE, DELETE
AS
BEGIN
	RAISERROR('Não é possível alterar ou excluir países', 16, 1)
END
GO

CREATE TRIGGER t_manterAtleta
ON Atleta
INSTEAD OF UPDATE, DELETE
AS
BEGIN
	RAISERROR('Não é possível alterar ou excluir atletas', 16, 1)
END
GO

CREATE FUNCTION fn_inserirDesempenho
ON Atleta_Bateria
FOR INSERT
AS
BEGIN
	declare @atleta_codigo int,
			@bateria_id int
	set @atleta_codigo = (select atleta_codigo from Atleta_Bateria)
	set @bateria_id = (select id from Bateria)
	if (COUNT(@atleta_codigo) = 8)
	begin
		insert into Atleta_Bateria(bateria_id)
		values(@atleta_codigo)
	end
END
GO

CREATE FUNCTION fn_resultadosProva(@prova_id int)
RETURNS
@prova_resultados TABLE(
    atleta_nome varchar(255),
    pais_nome varchar(255),
    desempenho numeric(9)
)
AS
BEGIN
    INSERT INTO @prova_resultados
    SELECT Atleta.nome as 'Nome do Atleta', Pais.nome as 'País de Origem', Atleta_Bateria.desempenho as 'Desempenho'
        FROM Pais
        INNER JOIN Atleta ON Pais.codigo = Atleta.pais_codigo
        INNER JOIN Atleta_Bateria ON Atleta.codigo = Atleta_Bateria.atleta_codigo
        INNER JOIN Bateria ON Atleta_Bateria.bateria_id = Bateria.id
        INNER JOIN Prova ON Bateria.prova_id = @prova_id

    RETURN
END
GO

SELECT * FROM fn_resultadosProva(1)

INSERT INTO Prova
VALUES
(0, 'Lançamento do Dardo', 'FALSE', 0),
(1, 'Salto em Distância', 'TRUE', 0),
(2, 'Salto com Vara', 'TRUE', 0),
(3, '400 m com barreiras', 'TRUE', 1),
(4, '100 m', 'FALSE', 1),
(5, 'Arremesso do Peso', 'FALSE', 0),
(6, '100 m', 'TRUE', 1),
(7, '3000 m', 'TRUE', 1),
(8, 'Lançamento do Disco', 'TRUE', 0),
(9, '3000 m com obstáculos', 'FALSE', 1),
(10, 'Salto Triplo', 'FALSE', 0),
(11, '400 m', 'TRUE', 1),
(12, '800 m', 'FALSE', 1),
(13, '800 m', 'TRUE', 1),
(14, '200 m', 'FALSE', 1),
(15, '200 m', 'TRUE', 1)

INSERT INTO Pais
VALUES
('ARG', 'Argentina'),
('BRA', 'Brasil'),
('CAN', 'Canadá'),
('CHN', 'China'),
('ESP', 'Espanha'),
('FRA', 'França')

INSERT INTO Atleta (nome, sexo, pais_codigo)
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

--Dropping Tables
DROP TABLE Recorde
DROP TABLE Atleta_Bateria
DROP TABLE Bateria
DROP TABLE Prova
DROP TABLE Atleta
DROP TABLE Pais

--Selects
SELECT * FROM Atleta
SELECT * FROM Pais
SELECT * FROM Prova
SELECT * FROM Bateria
SELECT * FROM Atleta_Bateria
SELECT * FROM Recorde

INSERT INTO Atleta_Bateria (atleta_codigo, desempenho)
VALUES
(1, 111111111)