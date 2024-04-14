use adsb;
create table empresa(
idEmpresa int primary key auto_increment,
nome varchar(45),
responsavel varchar(45));

insert into empresa values
(default, 'stefanini', 'daniela'),
(default, 'c6bank', 'vanessa');

select * from empresa;

create table aluno (
ra char(8) primary key,
nome varchar(45),
bairro varchar(45),
fkEmpresa int,
constraint fkAlunoEmpresa foreign key (fkEmpresa)
	references empresa(idEmpresa));

/*
alter table aluno add column fkEmpresa int not null,
	add constraint fkAlunoEmpresa foreign key (fkEmpresa)
		references empresa(idEmpresa); 
*/

alter table aluno modify column fkEmpresa int not null;

insert into aluno values
('01241045', 'will', 'consolação', 1),
('01241123', 'wall', 'trianon masp', 1),
('01241092', 'well', 'paraiso', 2);

select * from aluno;

-- EXIBIR AS EMPRESAS E SEUS RESPECTIVOS INTERESSADOS

select * from empresa join aluno
	on idEmpresa = fkEmpresa;
    
select responsavel, bairro from empresa join aluno
	on idEmpresa = fkEmpresa where bairro = 'paraiso';
    
select empresa.nome, aluno.nome from empresa join aluno
	on idEmpresa = fkEmpresa;
    
select a.nome as 'Nome do Aluno', e.nome as 'Nome da Empresa' from empresa as e join aluno as a on a.fkEmpresa = e.idEmpresa;
    
    

