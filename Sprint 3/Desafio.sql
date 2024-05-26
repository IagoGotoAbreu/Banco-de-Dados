create database Exercicio11;

use Exercicio11;

create table Departamento (
idDepto int primary key,
nomeDepto varchar(45),
fkGerente int, 
dataInicioGer DATE
);

create table Funcionario (
idFunc int primary key,
nomeFunc varchar(30),
salario float,
sexo varchar(45),
fkSupervisor int,
dataNasc date,
fkDepto int,
foreign key (fkDepto) references Departamento(idDepto)
);

create table Projeto (
idProj int primary key, 
nomeProj varchar(45), 
localProj varchar(45),
fkDepto int,
foreign key (fkDepto) references Departamento(idDepto)
);

create table FuncProj (
fkFunc int, 
fkProj int,
horas decimal(3,1),
primary key (fkFunc, fkProj),
foreign key (fkFunc) references Funcionario(idFunc),
foreign key (fkProj) references Projeto(idProj)
);

insert into Departamento values 
(105, 'Pesquisa', 2, '2008-05-22'),
(104, 'Administração', 7, '2015-01-01'),
(101, 'Matriz', 8, '2001-06-19');

insert into Funcionario values 
(1, 'João Silva', 3500, 'm', 2, '1985-01-09', 105),
(2, 'Fernando Wong', 4500, 'm', 8, '1975-12-08', 105),
(3, 'Alice Sousa', 2500, 'f', 7, '1988-01-19', 104),
(4, 'Janice Morais', 4300, 'f', 8, '1970-06-20', 104),
(5, 'Ronaldo Lima', 3800, 'm', 1, '1982-09-15', 105),
(6, 'Joice Leite', 2500, 'f', 1, '1992-07-31', 105),
(7, 'Antonio Pereira', 2500, 'm', 4, '1989-03-29', 104),
(8, 'Juliano Brito', 5500, 'm', NULL, '1957-11-10', 101);

INSERT INTO Projeto VALUES 
(1, 'Produto X', 'Santo André', 105),
(2, 'Produto Y', 'Itu', 105),
(3, 'Produto Z', 'São Paulo', 105),
(10, 'Informatização', 'Mauá', 104),
(20, 'Reorganização', 'São Paulo', 101),
(30, 'Benefícios', 'Mauá', 104);


INSERT INTO FuncProj VALUES 
(1, 1, 32.5),
(1, 2, 7.5),
(5, 3, 40.0),
(6, 1, 20.0),
(6, 2, 20.0),
(2, 2, 10.0),
(2, 3, 10.0),
(2, 10, 10.0),
(2, 20, 10.0),
(3, 30, 30.0),
(3, 10, 10.0),
(7, 10, 35.0),
(7, 30, 5.0),
(4, 30, 20.0),
(4, 20, 15.0),
(8, 20, NULL);

alter table Departamento modify column fkGerente int, add constraint fkGerente foreign key (fkGerente) references Funcionario (idFunc); 

alter table Funcionario modify column fkSupervisor int, add constraint fkSupervisorFunc foreign key (fkSupervisor) references Funcionario (idFunc); 

select * from Departamento;

select * from Funcionario;

select * from Projeto;

select * from FuncProj;

insert into funcionario values
(null, 'Cecília Ribeiro', 2800, 'F', null, '1980-04-05', 104);
-- Não, pois o campo idFunc é uma primary key, não podendo ser um campo com valor nulo.

INSERT INTO Funcionario VALUES 
(3, 'Alice Sousa', 2800, 'f', 4, '1980-04-05', 104);
-- Não, pois o campo idFunc está se repetindo, o que é poribido para uma primary key.

INSERT INTO Funcionario VALUES 
(9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 107);
-- Não, pois o número 107 na fkDepto não referencia nenhum departamento.

INSERT INTO Funcionario VALUES 
(9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 104);
-- Sim, pois o id é um número único, as fks estão referenciando Ids existente e as aspas e vírgulas estão inseridas corretamente.

-- Excluir a tupla (registro) da tabela FuncProj, em que fkFunc=3 e fkProj = 10.  Conseguiu excluir? Por que?
delete from  FuncProj where fkFunc = 3 and fkProj = 10;
-- Sim, pois existe uma tupla que contém a fkFunc = 3 e fkProj = 10.

-- Excluir a tupla da tabela Funcionário, em que idFunc=2. Conseguiu excluir? Por que?
delete from Funcionario where idFunc = 4;
-- Não, Por que ela está sendo referenciada em outras tabelas como uma fk.

-- Excluir a tupla da tabela Funcionário, em que idFunc=2. Conseguiu excluir? Por que?
delete from Funcionario where idFunc = 2;
-- Não, por que o id 2 está sendo referenciado em outras tabelas.

-- Alterar o salário do Funcionário com idFunc=3 para 2800. Conseguiu alterar? Por que?
update Funcionario set salario = 2800 where idFunc = 3;
-- Sim, pois o id 3 e a coluna funcionário existem.

-- Alterar o fkDepto do Funcionário com idFunc=3 para 101. Conseguiu alterar? Por que?
update Funcionario set fkDepto = 101 where idFunc = 3;
-- Sim, pois existe um id para ser referenciado na fkDepto e existe um id 3.

-- Alterar o fkDepto do Funcionário com idFunc=3 para 107. Conseguiu alterar? Por que?
update Funcionario set fkDepto = 107 where idFunc = 3;
-- Não, pois não existe um fkDepto 107 para ser alterado.

-- Exibir a data de nascimento e o salário do funcionário João Silva.
select dataNasc, salario from Funcionario
where nomeFunc = 'João Silva';

-- Exibir uma lista apenas dos salários de todos os funcionários.
select salario from funcionario;

-- Exibir uma lista apenas dos salários distintos de todos os funcionários.
select distinct(salario) from funcionario;

--  Exibir os dados dos funcionários ordenados pelo nome.
select * from funcionario
order by nomeFunc;

-- Exibir os dados dos funcionários ordenados pelo salário, de forma decrescente.
select * from funcionario
order by salario desc;

--  Exibir os dados dos funcionários que tenham salário entre 2000 e 4000.
select * from funcionario 
where salario > 2000 and salario < 4000;

-- Exibir os nomes e os salários dos funcionários cujos nomes começam com a letra ‘J’.
select nomeFunc, salario from funcionario 
where nomeFunc like 'J%';

--  Exibir os nomes e os salários dos funcionários cujos nomes terminam com a letra ‘a’.
select nomeFunc, salario from funcionario
where nomeFunc like '%a';

-- Exibir os nomes dos funcionários que tem a letra ‘n’ como terceira letra do nome.
select nomeFunc from funcionario 
where nomeFunc like '__n%';

-- Exibir os nomes e as datas de nascimento dos funcionários cujos nomes tenham a letra ‘S’ como 5ª letra de trás para frente.
select nomeFunc, dataNasc from funcionario
where nomeFunc like '%s____';

--  Exibir os dados dos funcionários que trabalham no departamento Pesquisa.
select funcionario.* from funcionario 
join departamento 
on funcionario.fkDepto = departamento.idDepto
where departamento.nomeDepto = 'Pesquisa';

-- Exibir os dados dos funcionários que trabalham no departamento Pesquisa e que tenham salário acima de 3500.
select funcionario.* from funcionario 
join departamento
on departamento.idDepto = funcionario.fkDepto
where departamento.nomeDepto = 'Pesquisa' and salario > 3500;

-- Exibir os dados dos funcionários que trabalham no departamento Pesquisa e que tenham o nome com inicial ‘J’.
select funcionario.* from funcionario
join departamento 
on departamento.idDepto = funcionario.fkDepto
where departamento.nomeDepto = 'Pesquisa' and funcionario.nomeFunc like 'J%';

-- Exibir o idFunc e o nome de cada funcionário, juntamente com o idFunc e o nome do seu supervisor. 
-- Faça com que o título da coluna seja “idFuncionario” para funcionário e “idSupervisor” para o id do supervisor.
select funcionario.idFunc as 'Idfuncionario', 
funcionario.nomeFunc as 'Nome funcionario', 
supervisor.idFunc as 'Idsupervisor',
supervisor.nomeFunc as 'Nome supervisor'
from funcionario
join funcionario as supervisor
on funcionario.fkSupervisor = supervisor.idFunc;

--  Exibir para cada projeto localizado em São Paulo, o idProj do projeto, 
-- o número do departamento que o controla, o nome e a data de nascimento do gerente do departamento.
select projeto.idProj, departamento.idDepto, funcionario.nomeFunc, funcionario.dataNasc
from projeto
join departamento
on projeto.fkDepto = departamento.idDepto
join funcionario
on funcionario.idFunc = departamento.fkGerente;

--  Exibir o idFunc e o nome do funcionário, o projeto e o nome do projeto em que trabalha, 
-- e a quantidade de horas que trabalha nesse projeto.
select funcionario.idFunc, funcionario.nomeFunc, projeto.idProj, projeto.nomeProj, funcProj.horas
from funcionario
join FuncProj
on funcionario.idFunc = FuncProj.fkFunc
join projeto
on FuncProj.fkProj = projeto.idProj;

-- Exibir os nomes dos funcionários que nasceram antes de 1980.
select funcionario.nomeFunc from funcionario
where dataNasc < '1980-01-01';

--  Exibir a quantidade de salários diferentes que existem na empresa.
select count(distinct salario) from funcionario;

-- Exibir a quantidade de locais diferentes de projeto.
select count(distinct localProj) from projeto;

--  Exibir o salário médio da empresa e a soma dos salários.
select sum(salario), avg(salario) from funcionario;

-- Exibir o menor e o maior salário da empresa.
select min(salario), max(salario) from funcionario;

--  Exibir o idDepto, o salário médio e a soma do salário de cada departamento (agrupado por departamento)
select sum(salario), avg(salario), departamento.idDepto from funcionario
join departamento
on departamento.idDepto = funcionario.fkDepto
group by departamento.idDepto;

--  Exibir o idDepto, o menor e o maior salário de cada departamento (agrupado por departamento).
select departamento.idDepto, min(salario), max(salario)  from funcionario
join departamento
on departamento.idDepto = funcionario.fkDepto
group by departamento.idDepto;

--  Inserir mais os seguintes funcionários na tabela Funcionário:
INSERT INTO Funcionario VALUES 
(10, 'José da Silva', 1800, 'm', 3, '2000-10-12', NULL),
(11, 'Benedito Almeida', 1200, 'm', 5, '2001-09-01', NULL);

--  Inserir mais o seguinte departamento na tabela Departamento:
INSERT INTO Departamento VALUES 
(110, 'RH', 3, '2018-11-10');

