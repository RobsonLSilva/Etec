DROP DATABASE biblioteca;

CREATE DATABASE biblioteca; 

\c biblioteca;

CREATE TABLE tb_livro (
    id_livro                SERIAL PRIMARY KEY,
    descricao_livro         VARCHAR(100) NOT NULL,
    data_lancamento         DATE
);

CREATE TABLE tb_endereco (
	id_endereco             SERIAL PRIMARY KEY,
	descricao               VARCHAR(256) NOT NULL,
	cep                     VARCHAR(9) NOT NULL
);

CREATE TABLE tb_usuario (
	id_usuario              SERIAL PRIMARY KEY,
    	cod_endereco            INTEGER,
	nome                    VARCHAR(256) NOT NULL,
	idade					INTEGER,
    	cpf                     VARCHAR(11) NOT NULL,
	email                   VARCHAR(256) NOT NULL,
    CONSTRAINT enderecos_fk FOREIGN KEY (cod_endereco) REFERENCES tb_endereco (id_endereco)
);

CREATE TABLE tb_emprestimo(
    id_emp                  SERIAL PRIMARY KEY,
    dataEmprestimo_emp      DATE NOT NULL,
    dataDevolucao_emp       DATE,
    id_livro                INTEGER NOT NULL UNIQUE,
    id_usuario              INTEGER NOT NULL,
    CONSTRAINT livro_fk FOREIGN KEY (id_livro) REFERENCES tb_livro (id_livro),
    CONSTRAINT usuario_fk FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id_usuario)
);

CREATE TABLE hist_emprestimo (
	id_log 					SERIAL PRIMARY KEY,
	id_emp 					INTEGER NOT NULL,
	id_livro 				INTEGER NOT NULL,
	id_usuario 				INTEGER NOT NULL,
	datalog 				DATE NOT NULL
);
CREATE OR REPLACE FUNCTION  log_emprestimo_hist()
returns trigger AS $$
begin 
	insert into hist_emprestimo
	(id_emp, id_livro, id_usuario, datalog)
	values
	(old.id_emp, old.id_livro, old.id_usuario, current_date);
	return new;
end;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION  del_emprestimo_finalizado()
returns trigger AS $$
begin 
	
	DELETE FROM tb_emprestimo
	WHERE id_livro = old.id_livro;
	return new;
end;
$$ language plpgsql;

CREATE OR REPLACE TRIGGER hist_emprestimo
after update on tb_emprestimo
for each row 
execute procedure log_emprestimo_hist();

create or replace trigger del_emprestimo
after update on tb_emprestimo
for each row 
execute procedure del_emprestimo_finalizado();


INSERT INTO tb_endereco (descricao, cep) 
VALUES 
	('Rua Hum, 123', '08000-000'), 
	('Rua Cinco, 321', '08000-001'),
	('Rua Dez, 253', '08000-008'),
	('Rua Dezenove, 321', '08000-100');

INSERT INTO tb_usuario (cod_endereco, nome, idade, cpf, email) 
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

INSERT INTO tb_livro(descricao_livro, data_lancamento) 
VALUES
	('BANCO DE DADOS PARA WEB',TO_DATE('01/12/2009', 'DD/MM/YYYY')), 
	('PROGRAMANDO EM LINGUAGEM JAVA', TO_DATE('27/12/2009', 'DD/MM/YYYY')),
	('PROGRAMANDO EM LINGUAGEM C++', TO_DATE(NULL, 'DD/MM/YYYY')), 
	('BANCO DE DADOS PARA BIOINFORMATICA', TO_DATE('12/12/2012', 'DD/MM/YYYY')),
	('REDES DE COMPUTADORES', TO_DATE('27/05/2008', 'DD/MM/YYYY')),
	('PROGRAMANDO EM LINGUAGEM PYTHON', TO_DATE('27/05/2008', 'DD/MM/YYYY')),
	('ANALISE DE DADOS COM PYTHON', TO_DATE('01/10/2008', 'DD/MM/YYYY')),
	('CORDOVA PARA INICIANTES', TO_DATE('23/05/2018', 'DD/MM/YYYY')),
	('CONCEITOS BASICOS DE API', TO_DATE('27/05/2020', 'DD/MM/YYYY')),
	('ARQUITETURA DE SOFTWARE', TO_DATE('03/03/2012', 'DD/MM/YYYY'));

INSERT INTO tb_emprestimo(dataEmprestimo_emp, dataDevolucao_emp, id_livro, id_usuario)
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

select * 
from tb_emprestimo te 
inner join tb_usuario tu on te.id_usuario = tu.id_usuario;

select * 
from tb_emprestimo te 
inner join tb_usuario tu on te.id_usuario = tu.id_usuario
where tu.idade < 18;

select te.id_emp, te.dataemprestimo_emp, te.id_livro, tl.descricao_livro, tu.nome, te2.descricao 
from tb_emprestimo te 
inner join tb_usuario tu on te.id_usuario = tu.id_usuario
inner join tb_livro tl on te.id_livro = tl.id_livro 
inner join tb_endereco te2 on te2.id_endereco = tu.cod_endereco
where te.dataemprestimo_emp between '2022-04-01' and '2022-04-30';

select te.id_emp, te.dataemprestimo_emp, te.id_livro, tl.descricao_livro, tu.nome, te2.descricao 
from tb_emprestimo te 
inner join tb_usuario tu on te.id_usuario = tu.id_usuario
inner join tb_livro tl on te.id_livro = tl.id_livro 
inner join tb_endereco te2 on te2.id_endereco = tu.cod_endereco
where tl.descricao_livro like '%BANCO DE DADOS%';

update tb_emprestimo set datadevolucao_emp = current_date where id_usuario = 2;

select * from tb_emprestimo where id_usuario = 2;
select * from hist_emprestimo;
