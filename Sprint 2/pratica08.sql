create database venda;
use venda;

create table cliente (
idCliente int primary key auto_increment,
nome varchar(45),
email varchar(45),
cep char(9),
numero varchar(10),
complemento varchar(45),
fkCliente int,
constraint fkClienteIndicado foreign key (fkCliente) references cliente(idCliente)
);

create table venda (
idVenda int primary key auto_increment,
dtVenda date,
valor decimal (5,2),
fkCliente int,
constraint fkCliente foreign key (fkCliente) references cliente(idCliente)
);

create table produto (
idProduto int primary key auto_increment,
nome varchar(45),
descricao varchar(45),
valor decimal(5,2));

insert into cliente values
(default, 'Rodolfo', 'rodolfo@ikeda.com', '07156-451', '84', 'Casa', null),
(default, 'Eder', 'eder@souza.com', '07143-781', '434', 'Casa', 1),
(default, 'Lucas', 'lucas@felipe.com', '08630-221', '875', 'Casa', 1);

insert into venda values
(default, '2024-02-18', 5.99, 1),
(default, '2024-02-11', 6.99, 1),
(default, '2024-02-12', 2.99, 2),
(default, '2024-02-13', 3.99, 2),
(default, '2024-02-14', 9.99, 3),
(default, '2024-02-15', 8.99, 3);

insert into produto values 
(default, '', '', 3.99, null)
(default, '', '', 3.99, null)
(default, '', '', 3.99, null)
(default, '', '', 3.99, null)

