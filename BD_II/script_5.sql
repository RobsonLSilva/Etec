DROP DATABASE bd_lojavirtual;

CREATE DATABASE bd_lojavirtual; 

\c biblioteca;

CREATE TABLE tbl_produto (
    id              SERIAL PRIMARY KEY,
    nome            VARCHAR(200) NOT NULL
);

CREATE TABLE tbl_cliente (
    id              SERIAL PRIMARY KEY,
    nome            VARCHAR(200) NOT NULL
);

CREATE TABLE tbl_venda (
    id              SERIAL PRIMARY KEY,
    id_produto      INTEGER NOT NULL,
    id_cliente      INTEGER NOT NULL,
    CONSTRAINT VdaProd  FOREIGN KEY (id_produto) REFERENCES tbl_produto(id),
    CONSTRAINT VdaCli  FOREIGN KEY (id_cliente) REFERENCES tbl_cliente(id)
);

INSERT INTO tbl_produto (nome) VALUES ('carro'),('computador'), ('alface'), ('pet'), ('cidade');
INSERT INTO tbl_cliente (nome) VALUES ('Hug'),('Zez'), ('Lui'), ('Tio Patinhas');
INSERT INTO tbl_venda (id_produto, id_cliente ) VALUES (1,1),(2,2), (2,3), (4,1), (4,2), (4,3), (4,4);

SELECT * FROM tbl_produto;

SELECT * FROM tbl_cliente;

SELECT * FROM tbl_venda;


SELECT * FROM  tbl_venda AS vda
JOIN tbl_produto AS prod ON prod.id = vda.id_produto
JOIN tbl_cliente AS cli ON cli.id = vda.id_cliente;

SELECT * FROM  tbl_venda AS vda
RIGHT JOIN tbl_produto AS prod ON prod.id = vda.id_produto;

SELECT * FROM  tbl_venda AS vda
LEFT JOIN tbl_produto as prod ON prod.id = vda.id_produto;