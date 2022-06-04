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

CREATE TABLE tb_amigo (
	id_amigo                SERIAL PRIMARY KEY,
    cod_endereco            INTEGER,
	nome_amigo              VARCHAR(256) NOT NULL,
	idade_amigo  			INTEGER,
    cpf_amigo               VARCHAR(11) NOT NULL,
	email_amigo             VARCHAR(256) NOT NULL,
    CONSTRAINT endereco_fk FOREIGN KEY (cod_endereco) REFERENCES tb_endereco (id_endereco)
);
CREATE TABLE tb_estoque (
	id_estoque             SERIAL PRIMARY KEY,
	id_livro               VARCHAR(256) NOT NULL UNIQUE,
	qtd_livro              VARCHAR(9) NOT NULL
    CONSTRAINT estoque_fk FOREIGN KEY (id_livro) REFERENCES tb_livro (id_livro)
);


CREATE TABLE tb_emprestimo(
    id_emp                  SERIAL PRIMARY KEY,
    dataEmprestimo_emp      DATE NOT NULL,
    dataDevolucao_emp       DATE,
    id_livro                INTEGER NOT NULL,
    id_usuario              INTEGER NOT NULL,
    CONSTRAINT livro_fk FOREIGN KEY (id_livro) REFERENCES tb_livro (id_livro),
    CONSTRAINT usuario_fk FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id_usuario)
);