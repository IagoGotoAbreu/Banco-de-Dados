create database exercicios;
drop database exercicios;
use exercicios;

create table pet (
idPet int primary key auto_increment,
nome varchar(45),
pedigree varchar(3),
raça varchar(45),
fkPai int,
constraint fkPai foreign key (fkPai) references pet (idPet),
fkMae int,
constraint fkMae foreign key (fkMae) references pet (idPet));

insert into pet (idPet, nome, pedigree, raça) values
(default, 'Bella', 'sim', 'Golden'),
(default, 'Thor', 'sim', 'Golden'),
(default, 'Mel', 'sim', 'Golden'),
(default, 'Luke', 'nao', 'Rottweiler'),
(default, 'Rex', 'nao', 'Husky'),
(default, 'Donzela', 'nao', 'Rottweiler');

select * from pet;

update pet set fkPai = 2 where idPet = 1;
update pet set fkMae = 3 where idPet = 1;

update pet set fkPai = 5 where idPet = 4;
update pet set fkMae = 6 where idPet = 4;

select filho.nome as NomeFilho, 
	pai.nome as NomePai, 
	mae.nome as NomeMae
	from pet as filho 
		join pet as pai 
		on filho.fkPai = pai.idPet
			join pet as mae
			on filho.fkMae = mae.idPet;
            
create table dono (
idDono int primary key auto_increment,
nome varchar(45),
bairro varchar(45),
telefone char(14));

insert into dono values
(default, 'Enzo', 'Vila Prata', '(11)96345-3245'),
(default, 'Valentina', 'Jardim Santos', '(11)95061-9920');

alter table pet add column fkDono int,
	add constraint fkDonoPet foreign key (fkDono)
		references dono(idDono);

select * from pet;
select * from dono;
        
update pet set fkDono = 1 where idPet = 1;
update pet set fkDono = 1 where idPet = 2;
update pet set fkDono = 1 where idPet = 3;
update pet set fkDono = 2 where idPet = 4;
update pet set fkDono = 2 where idPet = 5;
update pet set fkDono = 2 where idPet = 6;

-- ------------------------------------------------------------------------ --

create table motorista (
idMotora int primary key auto_increment,
nome varchar(45),
CNH char(11),
dtValidade date,
fkMotoraReserva int,
constraint fkMotoraReserva foreign key (fkMotoraReserva) references motorista (idMotora));

insert into motorista (idMotora, nome, CNH, dtValidade) values
(default, 'Iago', '09873945065', '2024-12-23'),
(default, 'Eder', '83940566234', '2026-10-11'),
(default, 'Julia', '23456532456', '2029-03-28'),
(default, 'Bianca', '09876543211', '2030-04-01');

update motorista set fkMotoraReserva = 1 where idMotora = 2;
update motorista set fkMotoraReserva = 2 where idMotora = 4;

select * from motorista;

create table carro (
idCarro int primary key auto_increment,
nome varchar(45),
placa char(7),
marca varchar(45));

insert into carro values
(default, '320i', 'ERFS234', 'BMW'),
(default, 'AMG', 'SPTE666', 'Mercedes');

alter table motorista add column fkCarro int,
	add constraint fkCarroMotora foreign key (fkCarro)
		references carro(idCarro);
        
update motorista set fkCarro = 1 where idMotora = 1;
update motorista set fkCarro = 1 where idMotora = 2;
update motorista set fkCarro = 2 where idMotora = 3;
update motorista set fkCarro = 2 where idMotora = 4;
        
select * from motorista join carro on fkCarro = idMotora;

-- ------------------------------------------------------------------------ --

create table empresa (
idEmpresa int primary key auto_increment,
nome varchar(45),
CNPJ char(18),
fkMatriz int,
constraint fkMatriz foreign key (fkMatriz) references empresa (idEmpresa));

insert into empresa (idEmpresa, nome, CNPJ) values
(default, 'c6 bank', '12.011.457/0001-80'),
(default, 'c6 matriz', '55.150.445/0001-40'),
(default, 'safra', '35.513.668/0001-17'),
(default, 'safra matriz', '67.850.758/0001-90');

update empresa set fkMatriz = 2 where idEmpresa = 1;
update empresa set fkMatriz = 4 where idEmpresa = 3;

create table funcionario (
idFunc int primary key auto_increment,
nome varchar(45),
area varchar(45),
salario float,
fkSupervisor int,
constraint fkSupervisor foreign key (fkSupervisor) references funcionario (idFunc));

insert into funcionario (idFunc, nome, area, salario) values
(default, 'Valeria', 'RH', '3800'),
(default, 'Carlos', 'RH', '6200'),
(default, 'Flavia', 'Seguros', '1800'),
(default, 'Pedro', 'Seguros', '3000');

update funcionario set fkSupervisor = 2 where idFunc = 1;
update funcionario set fkSupervisor = 4 where idFunc = 3;

alter table funcionario add column fkEmpresa int,
	add constraint fkEmpresaFunc foreign key (fkEmpresa)
		references empresa(idEmpresa);

update funcionario set fkEmpresa = 1 where idFunc = 1;
update funcionario set fkEmpresa = 1 where idFunc = 2;
update funcionario set fkEmpresa = 2 where idFunc = 3;
update funcionario set fkEmpresa = 2 where idFunc = 4;

select * from funcionario join empresa on fkEmpresa = idFunc;















            
