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

insert into cliente values
(default, 'Rodolfo', 'rodolfo@ikeda.com', '07156-451', '84', 'Casa', null),
(default, 'Eder', 'eder@souza.com', '07143-781', '434', 'Casa', 1),
(default, 'Lucas', 'lucas@felipe.com', '08630-221', '875', 'Casa', 1);

create table venda (
idVenda int primary key auto_increment,
dtVenda date,
valor decimal (5,2),
fkCliente int,
constraint fkCliente foreign key (fkCliente) references cliente(idCliente)
);

insert into venda values
(default, '2024-02-18', 5.99, 1),
(default, '2024-02-11', 6.99, 1),
(default, '2024-02-12', 2.99, 2),
(default, '2024-02-13', 3.99, 2),
(default, '2024-02-14', 9.99, 3),
(default, '2024-02-15', 8.99, 3);

create table produto (
idProduto int primary key auto_increment,
nome varchar(45),
descricao varchar(45),
valor decimal(5,2));

insert into produto values 
(default, 'bolacha', 'bolacha recheada', 3.99),
(default, 'caneta', 'caneta preta', 1.99),
(default, 'copo', 'copo de vidro', 5.99),
(default, 'bola', 'bola de futebol', 7.99);

create table registro (
idRegistro int,
fkVenda int,
fkProduto int,
primary key (idRegistro, fkVenda, fkProduto),
quantidade int, 
desconto decimal(5,2),
constraint fkVenda foreign key (fkVenda) references venda(idVenda),
constraint fkProduto foreign key (fkProduto) references produto(idProduto));

insert into registro values
(1, 1, 1, 2, 0.99),
(1, 1, 2, 1, 1.99),
(1, 1, 3, 1, 0.49),
(1, 2, 4, 3, 0),
(2, 1, 2, 5, 2.49),
(2, 1, 1, 3, 0.99),
(2, 2, 4, 1, 0),
(2, 3, 3, 2, 1.49),
(3, 1, 4, 3, 0.99),
(3, 2, 3, 1, 0),
(3, 3, 2, 4, 1.99),
(3, 4, 1, 2, 0.49);

-- g) Exibir os dados dos clientes e os dados de suas respectivas vendas.
select * from cliente join venda on idVenda = venda.fkCliente;

-- h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta) e os dados de suas respectivas vendas.
select * from cliente join venda on idVenda = venda.fkCliente where cliente.nome = 'Eder';

-- i) Exibir os dados dos clientes e de suas respectivas indicações de clientes.
select * from cliente as indicado join cliente as cliente on indicado.fkCliente = cliente.idCliente;
       
-- j) Exibir os dados dos clientes indicados e os dados dos respectivos clientes indicadores, porém somente de um determinado cliente indicador (informar o nome do cliente que indicou na consulta).
select * from cliente as indicado join cliente as cliente on indicado.fkCliente = cliente.idCliente where indicado.nome = 'Lucas';

-- l) Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os dados das respectivas vendas e dos produtos.
select * from cliente as indicado join cliente as cliente on indicado.fkCliente = cliente.idCliente join venda on venda.fkCliente = cliente.idCliente join registro on fkVenda = fkProduto = idRegistro;

-- m) Exibir apenas a data da venda, o nome do produto e a quantidade do produto numa determinada venda.
select venda.dtVenda, produto.nome, registro.quantidade from produto join registro on registro.idRegistro = registro.fkProduto join venda on registro.fkVenda = registro.idRegistro;

-- n) Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de produtos vendidos agrupados pelo nome do produto.
select produto.nome, produto.valor, sum(quantidade) as QtdProdutos from produto join registro on produto.idProduto = registro.fkProduto group by produto.nome, produto.valor;

-- o) Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas vendas, e os clientes que não realizaram nenhuma venda.
insert into cliente values
(default, 'iago', 'iago@abreu.com', '08725-800', '104', 'Casa', null);
select * from cliente left join venda on venda.idVenda = venda.fkCliente;

-- p) Exibir o valor mínimo e o valor máximo dos preços dos produtos;
select min(valor), max(valor) from produto;

-- q) Exibir a soma e a média dos preços dos produtos;
select sum(valor), avg(valor) from produto;

-- r) Exibir a quantidade de preços acima da média entre todos os produtos;
select count(*) as "Quantidade de preços acima da média" from produto where valor > (select avg(valor) from produto);

-- s) Exibir a soma dos preços distintos dos produtos;
select sum(distinct produto.valor) as "Soma dos preços distintos" from produto;

-- t) Exibir a soma dos preços dos produtos agrupado por uma determinada venda;
select venda.idVenda, SUM(produto.valor) as "Soma dos preços" from venda join registro on venda.idVenda = registro.fkVenda join produto on produto.idProduto = registro.fkProduto where venda.idVenda = 1;











