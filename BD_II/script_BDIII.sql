CREATE TABLE IF NOT EXISTS pacientes(
	id 			SERIAL PRIMARY KEY,
	nome			VARCHAR(40) NOT NULL,
	sexo			VARCHAR(1),
	obito			BOOLEAN);


CREATE TABLE IF NOT EXISTS profissionais(
	id 			SERIAL PRIMARY KEY,
	nome			VARCHAR(50),
	insertedAt		TIMESTAMP NOT NULL DEFAULT NOW());


CREATE TABLE IF NOT EXISTS especialidades(
	id 			SERIAL PRIMARY KEY,
	nome			VARCHAR(50),
	insertedAt		TIMESTAMP NOT NULL DEFAULT NOW());


CREATE TABLE IF NOT EXISTS consultas(
	id 			SERIAL PRIMARY KEY,
	especialidades_id	INTEGER,
	pac_id			INTEGER,
	profiss_id		INTEGER,
	insertedAt		TIMESTAMP NOT NULL DEFAULT NOW());



CREATE TABLE IF NOT EXISTS obitos(
	id 			SERIAL PRIMARY KEY,
	obs			text);

ALTER TABLE consultas
ADD CONSTRAINT FkEspecialidadeDaConsulta FOREIGN KEY
	(especialidades_id)
REFERENCES
	especialidades(id);

ALTER TABLE consultas
ADD CONSTRAINT FkProfissionalDaConsulta FOREIGN KEY
	(profiss_id)
REFERENCES
	profissionais(id);
	

insert into especialidades(nome)
values
('urologista'), ('ginecologista'), ('clinica geral');

insert into profissionais(nome)
values
('DrFeelGoodUro'), ('DrJekyllGineco'), ('DrRay');

insert into pacientes(nome, sexo, obito)
values
('Ada Lovelace', 'f', 'f'), ('Donald Knuth', 'm', 'f'), ('Grace Hopper', 'f', 'f'), ('Dennis Ritchie', 'm', 'f');

insert into consultas(especialidades_id, pac_id, profiss_id )
values 
(1, 1, 1);

select * from especialidades;
select * from profissionais;
select * from pacientes;
select * from consultas;



