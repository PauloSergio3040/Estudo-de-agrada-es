Funções de Agregação e Análise de Dados em SQL — MySQL

Este repositório contém um conjunto de consultas SQL voltadas para o estudo de funções de agregação, análise estatística e agrupamento de dados utilizando MySQL.

O objetivo do projeto é explorar como operações matemáticas e estatísticas podem ser aplicadas diretamente no banco de dados para analisar informações populacionais de municípios e estados.

Os exemplos utilizam dados da tabela senso, permitindo investigar distribuição populacional, crescimento demográfico e métricas estatísticas por estado e região.

Objetivos do Estudo

Explorar o comportamento das principais funções de agregação do SQL e compreender como elas podem ser utilizadas para gerar análises de dados diretamente no banco.

O estudo inclui:

cálculo de médias populacionais

identificação de valores mínimos e máximos

soma total de populações

contagem de registros

análise de crescimento populacional entre anos

cálculo de métricas estatísticas como variância e desvio padrão

Funções SQL Utilizadas

O script explora diversas funções importantes do MySQL:

Funções de agregação

AVG() — média de valores

MIN() — menor valor do conjunto

MAX() — maior valor do conjunto

SUM() — soma total

COUNT() — quantidade de registros

Funções estatísticas

STDDEV() — desvio padrão

STDDEV_POP() — desvio padrão populacional

VAR_POP() — variância populacional

VAR_SAMP() — variância amostral

Outras funções

GROUP_CONCAT() — concatenação de valores agrupados

GROUP BY — agrupamento de registros

WITH ROLLUP — geração de totais agregados

Análises Realizadas

O projeto inclui consultas como:

média de população por estado

média de população por região

cidade com maior população em cada estado

cidade com menor população em cada estado

quantidade de cidades por estado

crescimento populacional entre 2010 e 2014

soma da população por estado

análise estatística da distribuição populacional

Estrutura dos Dados

As consultas utilizam principalmente a tabela:

senso

Campos utilizados nas análises:

nome_mun — nome do município

estado — estado do município

regiao — região do país

cod_mun — código do município

cod_uf — código da unidade federativa

populacao — população registrada

ano — ano do censo

Também são utilizados exemplos adicionais com o banco de dados world.

Tecnologias Utilizadas

MySQL

SQL

Documentação de Referência

👉 https://dev.mysql.com/doc/refman/5.7/en/group-by-functions.html
