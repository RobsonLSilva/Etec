CREATE DATABASE teste;
USE teste;
CREATE TABLE teste_php(
id 					bigint AUTO_INCREMENT primary key,
senha				varchar(100) NOT NULL,
senha_original		varchar(100) NOT NULL,
tipo_cript			varchar(50)
);

CREATE TABLE tbAlunos(
id 					bigint AUTO_INCREMENT primary key,
nome				varchar(250) NOT NULL
);

INSERT INTO tbAlunos (nome) VALUES ("Luiz Roberto"), ("Luiz Gustavo"), ("Almir Luiz"), ("Robson Luiz");

DELIMITER $$
CREATE PROCEDURE teste.Selecionar_Alunos(IN _id VARCHAR(250))
BEGIN
SELECT * FROM teste.tbAlunos WHERE nome LIKE CONCAT("%", _id, "%");
END $$
DELIMITER ;

CALL Selecionar_alunos("luiz");
select * from teste_php;