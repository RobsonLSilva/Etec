DROP DATABASE eteczl;

CREATE DATABASE eteczl; 


\c eteczl; 



CREATE TABLE tb_editora (
    id_editora              SERIAL PRIMARY KEY,
    nome                    VARCHAR(80) NOT NULL
);

CREATE TABLE tb_assunto (
    id_assunto              SERIAL PRIMARY KEY,
    nome                    VARCHAR(100) NOT NULL
);

CREATE TABLE tb_livro (
    id_livro                SERIAL PRIMARY KEY,
    nome                    VARCHAR(100) NOT NULL,
    preco                   DECIMAL,
    data_lancamento         DATE,
    id_editora              INTEGER,
    id_assunto              INTEGER,
    CONSTRAINT fk_editora FOREIGN KEY (id_editora) REFERENCES tb_editora(id_editora),
    CONSTRAINT fk_assunto FOREIGN KEY (id_assunto) REFERENCES tb_assunto(id_assunto)
);

CREATE TABLE tb_endereco (
	id_endereco             SERIAL PRIMARY KEY,
	descricao               VARCHAR(256) NOT NULL,
	cep                     VARCHAR(9) NOT NULL
);

CREATE TABLE tb_cliente (
	id_cliente              SERIAL PRIMARY KEY,
    cod_endereco            INTEGER,
	nome                    VARCHAR(256) NOT NULL,
    cpf                     VARCHAR(11) NOT NULL,
	email                   VARCHAR(256) NOT NULL,
    CONSTRAINT enderecos_fk FOREIGN KEY (cod_endereco) REFERENCES tb_endereco (id_endereco)
);

CREATE TABLE tb_cargo(
    id_cargo                SERIAL PRIMARY KEY,
    descricao               VARCHAR(256) NOT NULL
);

CREATE TABLE tb_funcionario (
	id_funcionario          SERIAL PRIMARY KEY,
    cod_endereco            INTEGER,
    cod_cargo               INTEGER,
	nome                    VARCHAR(256) NOT NULL,
    cpf                     VARCHAR(11) NOT NULL,
	email                   VARCHAR(256) NOT NULL,
    CONSTRAINT enderecos_fk FOREIGN KEY (cod_endereco) REFERENCES tb_endereco (id_endereco),
    CONSTRAINT cargo_fk FOREIGN KEY (cod_cargo) REFERENCES tb_cargo (id_cargo)
);


INSERT INTO tb_endereco (descricao, cep) VALUES ('Rua Hum, 123', '08000-000'), ('Rua Cinco, 321', '08000-001');

INSERT INTO tb_cliente (cod_endereco, nome, cpf, email) VALUES (1, 'Robson', '12345678910', 'robson@etec.com.br'), (2, 'Maria', '12345678920', 'maria@etec.com.br');

INSERT INTO tb_editora(id_editora, nome) VALUES (1, 'MIRANDELA EDITORA'), (2, 'EDITORA NORTE'), (3, 'ABC EDITORA'), (4, 'EDITORA PORTO ALEGRE');

INSERT INTO tb_assunto(id_assunto, nome) VALUES (1, 'BANCO DE DADOS'), (2, 'PROGRAMACAO'), (3, 'REDES'), (4, 'SISTEMAS OPERACIONAIS');

INSERT INTO tb_livro(id_livro, nome, preco, data_lancamento, id_editora, id_assunto) 
VALUES
(1, 'BANCO DE DADOS PARA WEB', TO_NUMBER('29.90', '9G999.99'),TO_DATE('01/12/2009', 'DD/MM/YYYY'), 1, 1), 
(2, 'PROGRAMANDO EM LINGUAGEM JAVA', TO_NUMBER('45.50', '9G999.99'),TO_DATE('27/12/2009', 'DD/MM/YYYY'),3,2),
(3, 'PROGRAMANDO EM C++', TO_NUMBER('70.22', '9G999.99'),TO_DATE(NULL, 'DD/MM/YYYY'),4,2), 
(4, 'BANCO DE DADOS PARA BIOINFORMATICA', TO_NUMBER('140.00', '9G999.99'),TO_DATE('12/12/2012', 'DD/MM/YYYY'),3,1),
(5, 'REDES DE COMPUTADORES', TO_NUMBER('89.90', '9G999.99'),TO_DATE('27/05/2008', 'DD/MM/YYYY'),2,2);

INSERT INTO tb_cargo(descricao) VALUES ('OPERADOR DE CAIXA'), ('GERENTE'), ('TECNICO DE TI'), ('AUXILIAR DE SERVICOS GERAIS');
INSERT INTO tb_funcionario (cod_endereco, cod_cargo, nome, cpf, email) VALUES (1, 1, 'Joao', '12345678610', 'joao@etec.com.br'), (2, 2, 'joaquina', '12345678990', 'joaquina@etec.com.br');




select * from tb_livro;
select * from tb_funcionario;

