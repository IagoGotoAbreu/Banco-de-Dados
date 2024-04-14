create database sprint01;
use sprint01;


                                  -- EXERCÍCIO 01 --


create table professor (
idProfessor int primary key auto_increment,
nome varchar(50),
sobrenome varchar(30),
especialidade1 varchar(40),
especialidade2 varchar(40));

insert into professor values
(default, 'Joao', 'Paula', 'Algoritimos', 'BD'),
(default, 'Vivian', 'Silva', 'BD', 'Arq Comp'),
(default, 'Fernanda', 'Caramico', 'P.I', 'Algoritimos'),
(default, 'Marcos', 'Souza', 'T.I', 'Arq Comp'),
(default, 'Marise', 'Machine', 'Arq Comp', 'S.O'),
(default, 'Marcio', 'Abreu', 'S.O', 'T.I');

create table disciplina (
idDisc int primary key auto_increment,
nomeDisc varchar(45));

insert into disciplina values
(default, 'Algoritimos'),
(default, 'Banco de Dados'),
(default, 'Arquetetura Computacional');

alter table professor add column fkDisciplina int,
	add constraint fkProfessorDisciplina foreign key (fkDisciplina)
		references disciplina(idDisc);
        
update professor set fkDisciplina = 1 where idProfessor = 1;
update professor set fkDisciplina = 2 where idProfessor = 2;
update professor set fkDisciplina = 3 where idProfessor = 3;
update professor set fkDisciplina = 1 where idProfessor = 4;
update professor set fkDisciplina = 2 where idProfessor = 6;
update professor set fkDisciplina = 3 where idProfessor = 5;

alter table professor modify column fkDisciplina int not null;
describe disciplina;

select * from professor join disciplina
	on idDisc = fkDisciplina;
    
select professor.nome, disciplina.nomeDisc from professor join disciplina
	on idDisc = fkDisciplina;
    
select * from professor join disciplina
	on idDisc = fkDisciplina where sobrenome = 'Silva';
    
select professor.especialidade1, disciplina.nomeDisc from professor join disciplina
 on idDisc = fkDisciplina where nome = 'Vivian' order by especialidade1;


                                 -- EXERCÍCIO 02 --

create database sprint2;
use sprint2;
drop database sprint2;

create table curso (
idCurso int primary key auto_increment,
nome varchar(50),
sigla varchar(3),
coordenador varchar(45));

insert into curso values
(default, 'Python', 'PTH', 'Joao'),
(default, 'JavaScript', 'JS', 'Felipe'),
(default, 'Csharp', 'C#', 'Maria');

create table professor (
idProfessor int primary key auto_increment,
nome varchar(45));

insert into professor values
(default, 'Iago'),
(default, 'Julia'),
(default, 'Thiago'),
(default, 'Guilherme');

alter table professor add column fkCurso int,
	add constraint fkProfessorCurso foreign key (fkCurso)
		references curso(idCurso);
        
update professor set fkCurso = 1 where idProfessor = 1;
update professor set fkCurso = 1 where idProfessor = 3;
update professor set fkCurso = 2 where idProfessor = 2;
update professor set fkCurso = 3 where idProfessor = 4;

select * from professor join curso 
	on fkCurso = idCurso;
    
select * from professor join curso 
	on fkCurso = idCurso where coordenador like '%i%';
    
alter table curso add constraint chkNome
check (nome in('Python', 'Csharp', 'JavaScript'));

 
                 -- DESAFIO 01 --
                 
create table notebook (
idNote int primary key auto_increment,
modelo varchar(45),
marca varchar(45),
preco decimal (10,2));

insert into notebook values
(default, 'Pavilion', 'HP', 1800),
(default, 'Aspire', 'Acer', 2400),
(default, 'Galax book', 'Samsung', 2200);

create table loja (
idLoja int primary key auto_increment,
nome varchar(45));

insert into loja values
(default, 'Americanas'),
(default, 'FastShop'),
(default, 'Amazon'),
(default, 'Casas Bahia');

alter table loja add column fkNotebook int,
	add constraint fkLojaNotebook foreign key (fkNotebook)
		references notebook(idNote);

update loja set fkNotebook = 1 where idLoja = 2;
update loja set fkNotebook = 2 where idLoja = 3;
update loja set fkNotebook = 1 where idLoja = 1;
update loja set fkNotebook = 3 where idLoja = 4;

select * from loja join notebook on fkNotebook = idNote;


                                        -- DESAFIO 02 --


create table carro (
idCarro int primary key auto_increment,
modelo varchar(45),
marca varchar(45),
preco decimal(10,2));

insert into carro values 
(default, 'HB20', 'hyundai', 45000),
(default, 'Spin', 'Chevrolet', 34000),
(default, 'fox', 'volkswagen', 58000);

create table dono(
idDono int primary key auto_increment,
nome varchar(45));

insert into dono values
(default, 'iago'),
(default, 'vivian'),
(default, 'tiago');

alter table carro add column fkDono int,
	add constraint fkCarroDono foreign key (fkDono)
		references dono(idDono);
        
update carro set fkDono = 1 where idCarro = 1;
update carro set fkDono = 2 where idCarro = 2;
update carro set fkDono = 3 where idCarro = 3;

select * from carro join dono on fkDono = idDono;







