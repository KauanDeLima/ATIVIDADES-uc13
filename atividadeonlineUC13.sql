--DDL

create database rpgonlineBD
 
 use rpgonlineBD 

 create table usuarios(
	UsuarioID INT PRIMARY KEY IDENTITY
	,Email VARCHAR(100) UNIQUE  NOT NULL
	,Senha VARCHAR(255) NOT NULL
 )

CREATE TABLE Classes(
	ClasseID INT PRIMARY KEY IDENTITY
	,Nome VARCHAR(50) UNIQUE NOT NULL
	,descricao  VARCHAR(255)
)

CREATE TABLE Personagens(
	PersonagemID	INT PRIMARY KEY IDENTITY
	,NomePersonagem VARCHAR(15) UNIQUE NOT NULL
	,UsuarioID INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioID)
    ,ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID)
)	

CREATE TABLE Habilidades(
	HabilidadeID INT PRIMARY KEY IDENTITY
	,Nome VARCHAR(100)
)

CREATE TABLE ClasseHabilidade(
	ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID)
	,Habilidade INT FOREIGN KEY REFERENCES Habilidades(HabilidadeID)
)

--DML - colocar dados
INSERT INTO Usuarios VALUES ('kauan@kauan.com', '123456')
INSERT INTO Classes VALUES ('Barbaro','Ele é realmente Barbaro')
INSERT INTO Habilidades VALUES ('muquetada na costela'), ('dedo molhado no ouvido'), ('cuecão') ,('pedala robinho')
INSERT INTO Personagens (NomePersonagem,UsuarioID,ClasseID) VALUES ('Klebin',1,2)
INSERT INTO ClasseHabilidade (ClasseID,Habilidade) VALUES (2,3) ,(2, 2), (2,1)


UPDATE usuarios
SET Senha = '987456321'
WHERE UsuarioID = 1





--DQL - consultas

SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidade 

SELECT * FROM Personagens
INNER JOIN Classes
on Personagens.ClasseID = Classes.ClasseID