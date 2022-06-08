DROP DATABASE bd_biblioteca;

CREATE DATABASE bd_biblioteca; 

\c biblioteca;

CREATE TABLE tbl_livro (
    id_livro                SERIAL PRIMARY KEY,
    descricao_livro         VARCHAR(100) NOT NULL,
    data_lanc_livro         DATE,
    qtde_livro              INTEGER
);

CREATE TABLE tbl_endereco (
	id_endereco             SERIAL PRIMARY KEY,
	logradouro               VARCHAR(256) NOT NULL,
	cep                     VARCHAR(9) NOT NULL
);

CREATE TABLE tbl_amigo (
	id_amigo                SERIAL PRIMARY KEY,
    id_endereco             INTEGER,
	nome_amigo              VARCHAR(256) NOT NULL,
	idade_amigo  			INTEGER,
    cpf_amigo               VARCHAR(11) NOT NULL,
	email_amigo             VARCHAR(256) NOT NULL,
    CONSTRAINT endereco_fk FOREIGN KEY (id_endereco) REFERENCES tbl_endereco (id_endereco)
);


CREATE TABLE tbl_emprestimo(
    id_emp                  SERIAL PRIMARY KEY,
    dataEmprestimo_emp      DATE NOT NULL,
    dataDevolucao_emp       DATE,
    id_livro                INTEGER NOT NULL,
    id_amigo              INTEGER NOT NULL,
    CONSTRAINT livro_fk FOREIGN KEY (id_livro) REFERENCES tbl_livro (id_livro),
    CONSTRAINT amigo_fk FOREIGN KEY (id_amigo) REFERENCES tbl_amigo (id_amigo)
);


INSERT INTO tbl_endereco (logradouro, cep) 
VALUES 
	('Rua Hum, 123', '08000-000'), 
	('Rua Cinco, 321', '08000-001'),
	('Rua Dez, 253', '08000-008'),
	('Rua Dezenove, 321', '08000-100');

INSERT INTO tbl_amigo (id_endereco, nome_amigo, idade_amigo, cpf_amigo, email_amigo) 
VALUES 
	(1, 'Robson', 36, '12345678910', 'robson@etec.com.br'), 
	(2, 'Maria', 17, '12345678920', 'maria@etec.com.br'),
	(3, 'Jose', 55, '12345678921', 'jose@etec.com.br'),
	(4, 'Ricardo', 16, '12345678922', 'ricardo@gmail.com.br'),
	(1, 'Josefina', 71, '12345678923', 'josefina@outlook.com.br'),
	(2, 'Ciclana', 19, '12345678924', 'ciclana@etec.com.br'),
	(3, 'Fulano', 22, '12345678925', 'fulano@gmail.com.br'),
	(4, 'Pedro', 15, '12345699920', 'pedro@egmail.com.br'),
	(1, 'Josi', 18, '12345610020', 'josi@outlook.com.br'),
	(2, 'Regina', 33, '12342548920', 'regina@outlook.com.br');

INSERT INTO tbl_livro(descricao_livro, data_lanc_livro, qtde_livro) 
VALUES
	('BANCO DE DADOS PARA WEB',TO_DATE('01/12/2009', 'DD/MM/YYYY'), 10), 
	('PROGRAMANDO EM LINGUAGEM JAVA', TO_DATE('27/12/2009', 'DD/MM/YYYY'), 4),
	('PROGRAMANDO EM LINGUAGEM C++', TO_DATE(NULL, 'DD/MM/YYYY'), 4), 
	('BANCO DE DADOS PARA BIOINFORMATICA', TO_DATE('12/12/2012', 'DD/MM/YYYY'), 5),
	('REDES DE COMPUTADORES', TO_DATE('27/05/2008', 'DD/MM/YYYY'), 2),
	('PROGRAMANDO EM LINGUAGEM PYTHON', TO_DATE('27/05/2008', 'DD/MM/YYYY'), 6),
	('ANALISE DE DADOS COM PYTHON', TO_DATE('01/10/2008', 'DD/MM/YYYY'), 6),
	('CORDOVA PARA INICIANTES', TO_DATE('23/05/2018', 'DD/MM/YYYY'), 5),
	('CONCEITOS BASICOS DE API', TO_DATE('27/05/2020', 'DD/MM/YYYY'), 3),
	('ARQUITETURA DE SOFTWARE', TO_DATE('03/03/2012', 'DD/MM/YYYY'), 2);

INSERT INTO tbl_emprestimo(dataEmprestimo_emp, dataDevolucao_emp, id_livro, id_amigo)
VALUES
	(TO_DATE('01/04/2022', 'DD/MM/YYYY'), NULL, 1, 1 ),
	(TO_DATE('01/04/2022', 'DD/MM/YYYY'), NULL, 2, 2 ),
	(TO_DATE('01/04/2022', 'DD/MM/YYYY'), NULL, 3, 3 ),
	(TO_DATE('05/04/2022', 'DD/MM/YYYY'), NULL, 4, 4 ),
	(TO_DATE('06/04/2022', 'DD/MM/YYYY'), NULL, 5, 5 ),
	(TO_DATE('06/04/2022', 'DD/MM/YYYY'), NULL, 6, 6 ),
	(TO_DATE('10/03/2022', 'DD/MM/YYYY'), NULL, 7, 7 ),
	(TO_DATE('11/04/2022', 'DD/MM/YYYY'), NULL, 8, 8 ),
	(TO_DATE('15/03/2022', 'DD/MM/YYYY'), NULL, 9, 9 ),
	(TO_DATE('31/03/2022', 'DD/MM/YYYY'), NULL, 10, 10 );


select ta.nome_amigo as amigo, tl.descricao_livro as livro, te.dataemprestimo_emp as "data do emprestimo"  
from tbl_emprestimo te
inner join tbl_amigo ta on te.id_amigo = ta.id_amigo
inner join tbl_livro tl on te.id_livro = tl.id_livro
order by te.dataemprestimo_emp; 

select * from tbl_amigo ta ;
