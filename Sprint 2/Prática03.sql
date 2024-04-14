create database sprint2;
drop database sprint2;
use sprint2;

                                      -- EXERCÍCIO 01 --
                                      
create table atleta (
idAtleta int primary key,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int );

insert into atleta values 
(1, 'Barbara', 'volei', 2),
(2, 'Gustavo', 'futebol', 3),
(3, 'Rodrigo', 'basquete', 3),
(4, 'Carlos', 'volei', 4),
(5, 'Joao', 'basquete', 1);

create table pais (
idPais int primary key,
nome varchar(30),
capital varchar(40));

insert into pais values
(1, 'brasil', 'brasilia'),
(2, 'japao', 'tokyo'),
(3, 'argentina', 'buenos aries'),
(4, 'inglaterra', 'londres');

-- Criar a chave estrangeira na tabela correspondente conforme modelagem
alter table atleta add column fkPais int,
	add constraint fkAtletaPais foreign key (fkPais)
		references pais(idPais);
        
describe atleta;

-- Atualizar o país de todos os atletas --
update atleta set fkPais = 3 where idAtleta = 1;
update atleta set fkPais = 1 where idAtleta = 2;
update atleta set fkPais = 2 where idAtleta = 3;
update atleta set fkPais = 1 where idAtleta = 4;
update atleta set fkPais = 4 where idAtleta = 5;

-- Modificando a coluna fk para not null -- 
alter table atleta modify column fkPais int not null;

-- Exibir os atletas e seu respectivo país --
select * from atleta join pais
on idPais = fkPais;

-- Exibir apenas o nome do atleta e o nome do respectivo país --
select atleta.nome, pais.nome from atleta join pais
on idPais = fkPais;

-- Exibir os dados dos atletas, seus respectivos países, de uma determinada capital --
select * from atleta join pais
on idPais = fkPais where capital = 'brasilia';


                                      -- EXERCÍCIO 02 --

create table musica (
idMusica int primary key,
titulo varchar(40),
artista varchar(40),
genero varchar(40));

insert into musica values
(1, 'ballena', 'veigh', 'trap'),
(2, 'clickbait', 'veigh', 'trap'),
(3, 'brinks!', 'kyan', 'trap'),
(4, 'copo vazio', 'gilberto gil', 'rock');

create table album (
idAlbum int primary key,
nome varchar(40),
tipo varchar(40),
constraint tipo check (tipo in ('digital', 'fisico')),
dtLancamento date);

insert into album values 
(1, 'dos prédios deluxe', 'digital', '2023-07-02'),
(2, 'quebrada inteligente', 'digital', '2023-06-20'),
(3, 'gil luminoso', 'fisico', '2020-03-15');

-- a) Exibir todos os dados das tabelas separadamente --
select * from musica;
select * from album;

-- b) Criar a chave estrangeira na tabela de acordo com a regra de negócio --
alter table musica add column fkAlbum int,
	add constraint fkMusicaAlbum foreign key (fkAlbum)
		references album(idAlbum);

-- c) Atualizar os álbuns de cada música --
update musica set fkAlbum = 1 where idMusica = 1;
update musica set fkAlbum = 1 where idMusica = 2;
update musica set fkAlbum = 2 where idMusica = 3;
update musica set fkAlbum = 3 where idMusica = 4;

describe musica;

-- Modificando a coluna fk para not null -- 
alter table musica modify column fkAlbum int not null;

-- d) Exibir as músicas e seus respectivos álbuns --
select * from musica join album
	on idAlbum = fkAlbum;

-- e) Exibir somente o título da música e o nome do seu respectivo álbum --
select musica.titulo, album.nome from musica join album
	on idAlbum = fkAlbum;

-- f) Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo --
select * from musica join album
	on idAlbum = fkAlbum where tipo = 'digital';
    




