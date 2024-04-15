create database pet;
drop database pet;
use pet;


                                                    -- Exercício 01 --
create table cliente (
idCliente int primary key auto_increment,
nome varchar(45),
telFixo char(13),
telCelular char(14),
endereco varchar(45));

insert into cliente values 
(default, 'Iago Goto', '(11)3456-7653', '(11)93504-1356', 'Rua diogenes ribas aguiar, 104'),
(default, 'Paulo Abreu', '(11)8641-1286', '(11)97316-2575', 'Vila Oliveira, 82'),
(default, 'Viviane Goto', '(11)1287-7766', '(11)95682-4583', 'Jardim Santos Dumont, 342');

create table pet (
idPet int,
fkCliente int,
constraint pkComposta primary key (idPet, fkCliente),
tipo varchar(45),
nome varchar(45),
raca varchar(45),
dtNasc date,
constraint fkClientePet foreign key (fkCliente)
	references cliente(idCliente)
) auto_increment = 101;

insert into pet values
(1,1, 'cachorro', 'thor', 'golden', '2020-01-01'),
(2,1, 'cavalo', 'bella', 'frisio', '2020-03-03'),
(3,2, 'gato', 'garfield', 'persa', '2020-01-01'),
(4,2, 'cachorro', 'zeus', 'bulldog', '2020-06-06'),
(5,3, 'hamster', 'mestre', 'sirio', '2020-03-03');

select * from pet;
select * from cliente;

alter table cliente modify column nome varchar(30);
describe cliente;

select * from pet where tipo = 'cachorro';

select nome, dtNasc from pet;

select * from pet order by nome;

select * from cliente order by endereco desc;

select * from pet where nome like 'z%';

select * from cliente where nome like '%goto';

update cliente set telCelular = '(11)91234-5678' where idCliente = 2;

select * from cliente;

select * from pet join cliente on fkcliente = idCliente;

select * from pet join cliente on fkcliente = idCliente where cliente.nome = 'iago goto';

delete from pet where idPet = 4;

select * from pet;

drop table pet;
drop table cliente;


                                                    -- Exercício 02 --
                                                    
					
create table pessoa (
idPessoa int primary key auto_increment,
nome varchar(45),
dtNasc date,
profissao varchar(45));

insert into pessoa values
(default, 'iago', '2004-04-01', 'Estudante'),
(default, 'viviane', '1974-05-18', 'Farmacêutico(a)'),
(default, 'paulo', '1969-07-22', 'Farmacêutico(a)');

create table gastos (
idGastos int,
fkPessoa int,
constraint pkComposta primary key (idGastos, fkPessoa),
data DATE,
valor float,
descricao varchar(45),
constraint fkPessoaGastos foreign key (fkPessoa)
	references pessoa(idPessoa));
    
insert into gastos values
(1,1, '2024-04-01', '240', 'Mercado'),
(2,1, '2024-01-28', '14', 'Uber'),
(3,1, '2024-01-22', '69', 'Cinema'),
(4,2, '2024-04-12', '366', 'Mercado'),
(5,2, '2024-02-17', '19', 'Uber'),
(6,3, '2024-03-05', '2306', 'Notebook');

select * from pessoa;

select * from gastos;

select * from pessoa where profissao = 'Farmacêutico(a)';

select * from gastos where descricao = 'mercado';

select * from pessoa join gastos on fkPessoa = idPessoa;

select * from pessoa join gastos on fkPessoa = idPessoa where pessoa.nome = 'iago';

update gastos set valor = '24' where idGastos = 2;
select * from gastos;

update pessoa set profissao = 'Desenvolvedor Júnior' where idPessoa = 1;
select * from pessoa;

delete from gastos where idGastos = 3;


                                                    -- Exercício 03 --


create database PraticaFuncionario;
drop database PraticaFuncionario;
use PraticaFuncionario;

create table setor (
idSetor int primary key auto_increment,
nome varchar(45),
andar int);

insert into setor values
(default, 'RH', '6'),
(default, 'Adm', '7');

create table funcionario (
idFunc int,
fkSetor int, 
constraint pkComposta primary key (idFunc, fkSetor),
nome varchar(45),
telefone char(14),
salario float,
constraint fkSetorFunc foreign key (fkSetor)
	references setor(idSetor));
    
insert into funcionario values
(1,1, 'viviane', '(11)91234-5678', '4600'),
(2,1, 'iago', '(11)91234-5678', '1800'),
(3,2, 'paulo', '(11)91234-5678', '2500'),
(4,2, 'bella', '(11)91234-5678', '8600');

create table acompanhante (
idAcompanhante int,
fkFunc int,
constraint pkComposta primary key (idAcompanhante, fkFunc),
nome varchar(45),
tipoRelacao varchar(45),
dtNasc date,
constraint fkFuncAcompanhante foreign key (fkFunc)
	references funcionario(idFunc));
    
insert into acompanhante values
(1,1, 'maria', 'mae', '2000-01-01'),
(2,1, 'joao', 'sobrinho', '2000-01-01'),
(3,1, 'larissa', 'irma', '2000-01-01'),
(4,2, 'leticia', 'prima', '2000-01-01'),
(5,2, 'sandro', 'tio', '2000-01-01'),
(6,3, 'arthur', 'vô', '2000-01-01');

select * from setor;
select * from funcionario;
select * from acompanhante;

select * from setor join funcionario on fkSetor = idSetor;

select * from setor join funcionario on fkSetor = idSetor where setor.nome = 'rh';

select * from funcionario join acompanhante on fkFunc = idFunc;

select * from funcionario join acompanhante on fkFunc = idFunc where funcionario.nome = 'viviane';

select * from setor join funcionario join acompanhante on fkSetor = idSetor and fkFunc = idFunc;


                                                    -- Exercício 04 --


create database treinador;
drop database treinador;
use treinador;

create table treinador (
idTreinador int primary key auto_increment,
nome varchar(45),
telefone char(14),
email varchar(45),
fkTreinadorExp int,
constraint fkNovatoExp foreign key (fkTreinadorExp)
	references treinador(idTreinador));
    
insert into treinador values
(default, 'paulo', '(11)90090-2345', 'treinador@gmail.com', null),
(default, 'joao', '(11)90090-2345', 'treinador@gmail.com', null),
(default, 'felipe', '(11)90090-2345', 'treinador@gmail.com', null),
(default, 'giovanni', '(11)90090-2345', 'treinador@gmail.com', null),
(default, 'thiago', '(11)90090-2345', 'treinador@gmail.com', null);

update treinador set fkTreinadorExp = 1 where idTreinador = 2;
update treinador set fkTreinadorExp = 1 where idTreinador = 3;
update treinador set fkTreinadorExp = 4 where idTreinador = 5;

select * from treinador;

create table nadador (
idNadador int, 
fkTreinador int,
constraint pkComposta primary key (idNadador, fkTreinador),
nome varchar(45),
estado varchar(45),
dtNasc date,
constraint fkTreinadorNadador foreign key (fkTreinador)
	references treinador(idTreinador));
    
insert into nadador values
(1,1, 'marcos', 'sao paulo', '2000-01-01'),
(2,1, 'luiz', 'sao paulo', '2000-01-01'),
(3,4, 'iago', 'minas gerais', '2000-01-01'),
(4,4, 'julia', 'rio de janeiro', '2000-01-01');

select * from treinador;
select * from nadador;

select * from treinador join nadador on fkTreinador = idTreinador;

select * from treinador join nadador on fkTreinador = idTreinador where treinador.nome = 'giovanni';

select * from treinador as novato join treinador as Experiente
    on novato.fkTreinadorExp = Experiente.idTreinador;
    
select novato.nome as 'Nome do treinador Novato', experiente.nome as 'Nome do treinador Orientador' from treinador as novato join treinador as Experiente
    on novato.fkTreinadorExp = Experiente.idTreinador;
    
select * from treinador as novato join treinador as Experiente
    on novato.fkTreinadorExp = Experiente.idTreinador where Experiente.nome = 'paulo';
    
select novato.nome as 'Nome do treinador Novato', experiente.nome as 'Nome do treinador Orientador' from treinador as novato join treinador as Experiente
    on novato.fkTreinadorExp = Experiente.idTreinador where Experiente.nome = 'paulo';
    
select novato.nome as 'Treinador Novato',
experiente.nome as 'Treinador Orientador',
nadador.nome as Nadador
from treinador as novato
join treinador as experiente
on novato.FkTreinadorExp = Experiente.idTreinador
join nadador 
on experiente.idTreinador = nadador.fkTreinador;

select novato.nome as 'Treinador Novato',
experiente.nome as 'Treinador Orientador',
nadador.nome as Nadador
from treinador as novato
join treinador as experiente
on novato.FkTreinadorExp = Experiente.idTreinador
join nadador 
on experiente.idTreinador = nadador.fkTreinador 
where experiente.nome = 'paulo';