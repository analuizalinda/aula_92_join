create database ibge;

use ibge;

create table unidades_federativas (
cod_uf INT,
uf CHAR(2),
nome_uf VARCHAR(30),
primary key(cod_uf)
);

create table municipios (
cod_municipio int,
cod_uf INT,
nome_municipio VARCHAR(40),
populacao INT,
primary key(cod_municipio),
foreign key (cod_uf) references unidades_federativas(cod_uf)
);


SELECT m.nome_municipio, u.nome_uf FROM municipios m
INNER JOIN unidades_federativas u ON m.cod_uf = u.cod_uf;

#listar os municipios com sua populacao ea sigla da unidade
SELECT m.nome_municipio, m.populacao, u.uf FROM municipios m
INNER JOIN unidades_federativas u ON m.cod_uf = u.cod_uf; 

#Listar os municipios e suas unidades federativas, ordenando pelo nomedo municipio 
SELECT m.nome_municipio, u.nome_uf FROM municipios m
INNER JOIN unidades_federativas u ON m.cod_uf = u.cod_uf
order by m.nome_municipio;
 
 
 #listar os municipios que possuem uma populacao superior a 100000 habitantes, juntamente com a sigla da unidade federativa 
SELECT m.nome_municipio, m.populacao, u.uf FROM municipios m
INNER JOIN unidades_federativas u ON m.cod_uf = u.cod_uf
where m.populacao > 100000;

#listar os municipios que tem o mesmo nome que sua respectiva unidade federativa 
SELECT m.nome_municipio, u.uf FROM municipios m
INNER JOIN unidades_federativas u ON m.cod_uf = u.cod_uf
where m.nome_municipio = u.nome_uf;

#calcular a media de populacao dos municipios para cada unidade federativa 
select u.nome_uf, avg(m.populacao) as media_populacao
from municipios m 
inner join unidades_federativas u on m.cod_uf = u.cod_uf
group by u.uf;
 
 #listar os municipios que tem uma populacao maior que a media da populacao de todos os municipios 
 select *
from municipios m 
where populacao > (select avg(m.populacao) as media_populacao 
from municipios m);

#desafio
select u.nome_uf, count(*) as quantidade_municipios 
from municipios m
inner join unidades_federativas u on m.cod_uf = u.cod_uf 
group by u.uf;
