DROP DATABASE eteczl;

CREATE DATABASE eteczl;

\c eteczl;

CREATE TABLE tb_enderecos (
	id SERIAL PRIMARY KEY,
	descricao VARCHAR(256) NOT NULL,
	cep VARCHAR(9) NOT NULL
);

CREATE TABLE tb_usuarios (
	id SERIAL PRIMARY KEY,
    cod_endereco INTEGER,
	nome VARCHAR(256) NOT NULL,
	email VARCHAR(256) NOT NULL,
    CONSTRAINT enderecos_fk FOREIGN KEY (cod_endereco) REFERENCES tb_enderecos (id)
);

INSERT INTO tb_enderecos (descricao, cep) 
VALUES 
('Rua Hum, 123', '08000-000'), 
('Rua Cinco, 321', '08000-001');

INSERT INTO tb_usuarios (cod_endereco, nome, email)
VALUES
(1, 'Robson', 'robson@code.com.br'), 
(2, 'Maria', 'maria@code.com.br');


SELECT * FROM tb_enderecos;
SELECT * FROM tb_usuarios;