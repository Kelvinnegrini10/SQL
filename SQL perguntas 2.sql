SELECT d.sigla, COUNT(f.id) AS total_funcionarios
FROM departamento d
JOIN funcionario f ON f.departamento_id = d.id
GROUP BY d.sigla;


SELECT d.sigla
FROM departamento d
JOIN funcionario f ON f.departamento_id = d.id
GROUP BY d.sigla
HAVING COUNT(f.id) > 3;

SELECT nome
FROM funcionario
ORDER BY salario ASC
LIMIT 3;

SELECT d.nome, GROUP_CONCAT(f.nome SEPARATOR '; ') AS funcionarios
FROM departamento d
JOIN funcionario f ON f.departamento_id = d.id
GROUP BY d.nome;


SELECT d.nome, COUNT(f.id) AS total_funcionarios
FROM departamento d
JOIN funcionario f ON f.departamento_id = d.id
GROUP BY d.nome
ORDER BY total_funcionarios DESC
LIMIT 3;

SELECT d.nome, COUNT(f.id) AS total_funcionarios
FROM departamento d
JOIN funcionario f ON f.departamento_id = d.id
GROUP BY d.nome;

SELECT d.nome, COUNT(f.id) AS total_funcionarios
FROM departamento d
JOIN funcionario f ON f.departamento_id = d.id
GROUP BY d.nome
HAVING AVG(f.salario) > 3790;

