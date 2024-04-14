CREATE DATABASE familia;
USE familia;

CREATE TABLE pessoa (
idPessoa int primary key auto_increment,
nome varchar(45),
dtNascimento date,
fkMae int,
constraint fkFilhoMae foreign key (fkMae)
	references pessoa(idPessoa));
    
-- INSERIR O FILHO
INSERT INTO pessoa VALUES
	(default, 'Vivian', '1983-10-13', null);
    
INSERT INTO pessoa VALUES
	(default, 'Elisabete', '1957-05-05', null);
    
SELECT * FROM pessoa;

INSERT INTO pessoa VALUES
	(default, 'Jadir', '1954-10-10', null);
    
UPDATE pessoa SET fkMae = 2
	WHERE idPessoa = 1;
    
SELECT filho.nome as NomeFilho,
	mae.nome as NomeMae
    FROM pessoa as filho JOIN pessoa as mae
    ON filho.fkMae = mae.idPessoa;
    
ALTER TABLE pessoa ADD COLUMN fkPai int,
	ADD CONSTRAINT fkFilhoPai FOREIGN KEY (fkPai)
		REFERENCES pessoa(idPessoa);
        
UPDATE pessoa SET fkPai = 3
	WHERE idPessoa = 1;
    
SELECT * FROM pessoa;
    
SELECT filho.nome as NomeFilho,
	mae.nome as NomeMae,
    pai.nome as NomePai
    FROM pessoa as filho JOIN pessoa as mae
    ON filho.fkMae = mae.idPessoa
    JOIN pessoa as pai
    ON filho.fkPai = pai.IdPessoa;
    
INSERT INTO pessoa VALUES
	(default, 'Elizabeth', '1934-12-11', null, null);
    
INSERT INTO pessoa VALUES
	(default, 'Orlando', '1929-03-05', null, null);
    
SELECT * FROM pessoa;

UPDATE pessoa SET fkMae = 4, fkPai = 5
	WHERE idPessoa = 3;
    
SELECT filho.nome as NomeFilho,
	mae.nome as NomeMae,
    pai.nome as NomePai,
    avó.nome as NomeAvóPaterna,
    avô.nome as NomeAvôPaterno
    FROM pessoa as filho JOIN pessoa as mae
    ON filho.fkMae = mae.idPessoa
    JOIN pessoa as pai
    ON filho.fkPai = pai.IdPessoa
    JOIN pessoa as avó
    ON pai.fkMae = avó.IdPessoa
    JOIN pessoa as avô
    ON pai.fkPai = avô.IdPessoa;
    
INSERT INTO pessoa (nome) VALUES
	('Neli'),
    ('João Carlos');
    
SELECT * FROM pessoa;

UPDATE pessoa SET fkMae = 6, fkPai = 7
	WHERE idPessoa = 2;
    
SELECT filho.nome as NomeFilho,
	mae.nome as NomeMae,
    pai.nome as NomePai,
    avó.nome as NomeAvóPaterna,
    avô.nome as NomeAvôPaterno,
    avóMaterna.nome as NomeAvóMaterna,
    avôMaterno.nome as NomeAvôMaterno
    FROM pessoa as filho JOIN pessoa as mae
    ON filho.fkMae = mae.idPessoa
    JOIN pessoa as pai
    ON filho.fkPai = pai.IdPessoa
    JOIN pessoa as avó
    ON pai.fkMae = avó.IdPessoa
    JOIN pessoa as avô
    ON pai.fkPai = avô.IdPessoa
    JOIN pessoa as avóMaterna
    ON mae.fkMae = avóMaterna.IdPessoa
    JOIN pessoa as avôMaterno
    ON mae.fkPai = avôMaterno.IdPessoa;
    