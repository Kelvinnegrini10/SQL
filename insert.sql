-- Exercício One 
select * from departamento
where (qtdfuncionariosdepto>15);

-- Exercício Two
select * from funcionario
where (salario>=4000);

-- Exercício three
select avg(salario) as media_valores from funcionario;

-- Exercício Four
select round(avg(salario),2) as media_valores from funcionario;

-- Exercício Five
select * from funcionario
where nome_funcionario = "Gomes";

-- Exercício Six
select avg(salario) * 12 as media_valores from funcionario;


-- Exercício Seven
SELECT MAX(salario) AS maior_salario FROM funcionario;

-- Exercício Eight
select nome_funcionario, salario
from funcionario
order by salario desc
limit 2;

-- Exercício Nine
select nome_funcionario, data_admissao
from funcionario
order by data_admissao
limit 1;

-- Exercício Ten
select distinct sigla_depto
from funcionario
where salario >5000;

-- Exercício Eleven
SELECT DISTINCT departamento_id
FROM empregados
WHERE salario > (
    SELECT AVG(salario) FROM empregados
);

-- Exercício Twelve
select * from funcionario
where nome_funcionario = "Costa";

-- Exercício Thirteen
SELECT sigla_depto FROM funcionario 
WHERE EXISTS (
SELECT * FROM funcionario
WHERE salario > (select AVG(salario) FROM funcionario)
);












