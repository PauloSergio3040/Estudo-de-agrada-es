use curso;
select * from senso;

-- avg retorna a média dos valores em um grupo. valores null são ignorados
select avg(populacao) as media from senso
where ano='2014';

-- avg media estado
select estado,avg(populacao) from senso
where ano='2014'
group by estado
order by 2 desc;

-- avg media estado com sigla estado
select a.cod_uf,b.sigla_uf,avg(a.populacao) media
from senso a
inner join uf b
on a.cod_uf=b.cod_uf
where a.ano='2014'
group by a.cod_uf,b.sigla_uf
order by 3 desc;

-- avg regiao
select a.regiao,avg(a.populacao)
from senso a
where a.ano='2014'
group by a.regiao;

-- min retorna o valor mínimo na expressão. pode ser seguido pela cláusula over
select min(a.populacao) from senso a
where a.ano='2014';

-- min por estado
select a.estado,min(a.populacao)
from senso a
where a.ano='2014'
group by estado;

-- min
select a.regiao,min(populacao)
from senso a
where a.ano='2014'
group by a.regiao
order by 2;

-- script 135
-- max retorna o valor máximo na expressão
select max(populacao) from senso a
where a.ano='2014';

-- max por estado
select a.estado,max(a.populacao) from senso a
where a.ano='2014'
group by a.estado
order by 2 desc;

-- max por sigla estado
select b.sigla_uf,max(a.populacao) as maximo
from senso a
inner join uf b
on a.cod_uf=b.cod_uf
where a.ano='2014'
group by b.sigla_uf
order by 2;

-- sum por estado
select a.cod_uf,sum(a.populacao) from senso a
where a.ano='2014'
group by a.cod_uf
order by 2 desc;

-- sum por regiao
select b.sigla_uf,sum(a.populacao) as maximo
from senso a
inner join uf b
on a.cod_uf=b.cod_uf
where a.ano='2014'
group by b.sigla_uf
order by 2;

-- count retorna o número de itens de um grupo
select count(*) from senso a
where a.ano='2014';

-- count retorna o número de cidades por ano
select a.ano,count(*) qtd_cidades from senso a
group by a.ano;

-- descobrindo qtd estados
select count(distinct cod_uf) from senso;

-- exemplo
select count(cod_uf) from senso;

-- count por estado
select a.estado,count(*) from senso a
where ano='2014'
group by a.estado
order by 2 desc;

-- count por regiao
select a.regiao,count(*) from senso a
where ano='2014'
group by a.regiao
order by 2 desc;

-- usando varias funcoes de agregacao
select avg(a.populacao) media_pop,
       min(a.populacao) minimo_pop,
       max(a.populacao) maximo_pop,
       sum(a.populacao) total_pop,
       count(*) qtd_cidades
from senso a
where a.ano='2014';

-- por estado
select a.estado,
       avg(a.populacao) media_pop,
       min(a.populacao) minimo_pop,
       max(a.populacao) maximo_pop,
       sum(a.populacao) total_pop,
       count(*) qtd_cidades
from senso a
where a.ano='2014'
group by a.estado
order by 2 desc;

-- apresentar nome da cidade com maior populacao de cada estados
select a.estado,a.nome_mun,a.populacao
from
(
    select b.estado, max(b.populacao) as populacao from senso b
    where b.ano='2014'
    group by b.estado
) b
join senso a
on a.estado = b.estado
and a.populacao = b.populacao
where a.ano='2014'
order by a.populacao desc;

-- apresentar nome da cidade com minimo populacao de cada estados
select a.estado,a.nome_mun,a.populacao
from
(
    select b.estado, min(b.populacao) as populacao from senso b
    where b.ano='2014'
    group by b.estado
) b
join senso a
on a.estado = b.estado
and a.populacao = b.populacao
where a.ano='2014'
order by a.populacao desc;

-- stddev retorna o desvio padrão estatístico de todos os valores da expressão especificada
select stddev(a.populacao) from senso a
where a.ano='2014';

-- script 148
-- stddev_pop retorna o desvio padrão estatístico para a população de todos os valores na expressão especificada
select stddev_pop(populacao) from senso;

-- comparando crescimento pop da cidades ref anos 2010 a 2014
-- select cod_uf,cod_mun,cod_uf+cod_mun as concatenado from cidades
-- usando exemplo
select a.nome_mun,
       a.populacao as senso_2010,
       b.populacao as senso_2014,
       (100/a.populacao)*(b.populacao)-100 as percentual
from senso a
inner join senso b
on a.cod_mun=b.cod_mun
where a.ano='2010'
and b.ano='2014';

-- comparando crescimento populacao por estado ref anos 2010 a 2014
select a.estado,
       sum(a.populacao) as senso_2010,
       sum(b.populacao) as senso_2014,
       (100/sum(a.populacao))*(sum(b.populacao))-100 as percentual
from senso a
inner join senso b
on a.cod_mun=b.cod_mun
where a.ano='2010'
and b.ano='2014'
group by a.estado;

-- var_pop retorna a variância estatística de todos os valores da expressão especificada
select var_pop(populacao) from senso
where ano='2014';

-- var_pop com group by
select estado,var_pop(populacao) from senso
group by estado;

-- var_samp retorna a variância estatística para o preenchimento
-- de todos os valores da expressão especificada
select var_samp(populacao) from senso;

-- var_samp com group by
select estado,var_samp(populacao) from senso
group by estado;

use world;

-- função concat
select continent,group_concat(distinct population order by population
desc separator ';') as grupo
from country
group by continent;

-- função concat
select continent,group_concat(distinct region order by region
desc separator ';') as regiao
from country
group by continent;

use curso;

-- group by with rollup
select a.estado,count(*) from senso a
where ano='2014'
group by a.estado desc with rollup;