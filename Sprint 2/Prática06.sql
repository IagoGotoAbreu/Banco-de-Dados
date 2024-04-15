                                        -- Exercício 01 --

create database AlunoProjeto;
drop database AlunoProjeto;
use AlunoProjeto;

create table projeto (
idProjeto int primary key auto_increment,
nome varchar(45),
descricao varchar(45));

insert into projeto values
(default, 'Estufas de Morangos', 'controla a temp e umidade dos morangos'),
(default, 'Maturacao dos vinhos', 'controla a temp e umidade dos vinhos');

create table aluno (
ra int,
fkProjeto int,
constraint pkComposta primary key (ra, fkProjeto),
nome varchar(45),
telefone varchar(20),
fkRepresentante int,
constraint fkAlunoProjeto foreign key (fkProjeto)
	references projeto(idProjeto),
constraint fkAlunoRepresentante foreign key (fkRepresentante)
	references aluno(ra));
    
insert into aluno values
(1,1, 'iago', '(11)91234-5678', null),
(2,1, 'viviane', '(11)91234-5678', null),
(3,1, 'paulo', '(11)91234-5678', null),
(4,2, 'bella', '(11)91234-5678', null),
(5,2, 'millena', '(11)91234-5678', null);

update aluno set fkRepresentante = 1 where ra = 2;
update aluno set fkRepresentante = 1 where ra = 3;
update aluno set fkRepresentante = 4 where ra = 5;

create table acompanhante (
idAcompanhante int,
fkAluno int,
constraint pkCompsota primary key (idAcompanhante, fkAluno),
nome varchar(45),
relacao varchar(45),
constraint fkAcompanhanteAluno foreign key (fkAluno)
	references aluno(ra));

insert into acompanhante values
(1,1, 'eduardo', 'primo'),
(2,1, 'bianca', 'filha'),
(3,3, 'roberto', 'tio'),
(4,4, 'flavia', 'sobrinha');

select * from aluno;
select * from projeto;
select * from acompanhante;

select * from aluno join projeto on fkProjeto = idProjeto;

select * from aluno join acompanhante on fkAluno = ra;

select a.nome as 'Aluno',
r.nome as 'Aluno Representante'
from aluno as a
join aluno as r
on a.fkRepresentante = r.ra;

select * from aluno join projeto on fkProjeto = idProjeto where projeto.nome = 'estufas de morangos';

select a.nome as 'Aluno',
r.nome as 'Aluno Representante',
p.nome as 'Projeto',
a.telefone as 'telefone do aluno',
r.telefone as 'telefone do representante',
p.descricao as descrição
from aluno as a
join aluno as r
on a.FkRepresentante = r.ra
join projeto as p
on a.fkProjeto = p.idProjeto;


                                        -- Exercício 02 --


create database campanha;
drop database campanha;
use campanha;

create table organizador (
idOrganizador int primary key auto_increment,
nome varchar(45),
rua varchar(45),
bairro varchar(45),
email varchar(45),
fkExperiente int,
constraint fkOrganizadorExperiente foreign key (fkExperiente)
	references organizador(idOrganizador)
) auto_increment = 30;

insert into organizador values 
(default, 'iago', 'rua diogenes', 'jardim dumont', 'email@gmail.com', null),
(default, 'millena', 'rua diogenes', 'jardim dumont', 'email@gmail.com', null),
(default, 'tiago', 'rua diogenes', 'jardim dumont', 'email@gmail.com', null);

update organizador set fkExperiente = 30 where idOrganizador = 31;
update organizador set fkExperiente = 30 where idOrganizador = 32;

select * from organizador;

create table campanha (
idCampanha int,
fkOrganizador int,
constraint pkComposta primary key (idCampanha, fkOrganizador),
categoria varchar(45),
instituicao1 varchar(45),
instituicao2 varchar(45),
dtFinal date,
constraint fkCampanhaOrganizador foreign key (fkOrganizador)
	references organizador(idOrganizador)
) auto_increment = 500;

insert into campanha values
(500, 30, 'Roupas', 'ABC', null, '2024-04-15'),
(501, 30, 'Comidas', 'DEF', null, '2024-04-15'),
(502, 31, 'Higiene', 'HIJ', null, '2024-04-15'),
(503, 32, 'Brinquedos', 'KLM', null, '2024-04-15');

select * from organizador;
select * from campanha;

select * from organizador join campanha on fkOrganizador = idOrganizador;

select * from organizador join campanha on fkOrganizador = idOrganizador where organizador.nome = 'iago';

select o.nome as 'Nome do Organizador',
e.nome as 'Nome do Organizador Experiente'
from organizador as o 
join organizador as e
on o.fkExperiente = e.idOrganizador;

select o.nome as 'Nome do Organizador',
e.nome as 'Nome do Organizador Experiente'
from organizador as o 
join organizador as e
on o.fkExperiente = e.idOrganizador 
where e.nome = 'iago';

select o.nome as 'Nome do Organizador',
e.nome as 'Nome do Organizador Experiente',
c.instituicao1 as 'Nome da Campanha'
from organizador as o
join organizador as e
on o.FkExperiente = e.idOrganizador
join campanha as c
on c.fkOrganizador = o.idOrganizador;

select o.nome as 'Nome do Organizador',
e.nome as 'Nome do Organizador Experiente',
c.instituicao1 as 'Nome da Campanha'
from organizador as o
join organizador as e
on o.FkExperiente = e.idOrganizador
join campanha as c
on c.fkOrganizador = o.idOrganizador
where o.nome = 'millena';







