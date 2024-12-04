-- 1
INSERT INTO disciplina (codigo_disciplina, nome_disciplina, carga_horaria, descricao)
VALUES 
    ('MEC001', 'Mecatrônica Básica', 60, 'Fundamentos de Mecatrônica'),
    ('ELE001', 'Eletricidade Básica', 60, 'Fundamentos de Eletricidade'),
    ('MEC002', 'Mecânica Geral', 60, 'Fundamentos de Mecânica'),
    ('ELE002', 'Sistemas Elétricos', 60, 'Sistemas e Circuitos Elétricos');


ALTER TABLE professor ADD COLUMN data_admissao DATE;

 
INSERT INTO professor (nro_registro_professor, nome, codigo_disciplina, data_admissao)
VALUES 
    ('REG001', 'Clara Almeida', 'MEC001', '2023-06-11'),
    ('REG002', 'João Gomes', 'ELE001', '2021-10-10'),
    ('REG003', 'Fernando da Silva', 'MEC002', '2023-01-01'),
    ('REG004', 'Bento Ramos', 'ELE002', '2022-02-02');


COMMIT;

 -- 2 
UPDATE professor
SET nome = 'Clara de Almeida'
WHERE nro_registro_professor = 'REG001';
DELETE FROM professor
WHERE nro_registro_professor = 'REG003';
COMMIT;

-- 3 
SAVEPOINT savepoint_insert_disc;
INSERT INTO disciplina (codigo_disciplina, nome_disciplina, carga_horaria, descricao)
VALUES 
    ('MEC003', 'Mecânica de Precisão', 60, 'Estudo de sistemas mecânicos de alta precisão'),
    ('ELE003', 'Eletrônica Digital', 60, 'Fundamentos de circuitos digitais'),
    ('INF001', 'Programação Básica', 60, 'Introdução à programação de computadores'),
    ('INF002', 'Estruturas de Dados', 60, 'Estudo de estruturas de dados em programação'),
    ('MEC004', 'Robótica Avançada', 60, 'Estudo e aplicação de robôs industriais');

UPDATE disciplina
SET nome_disciplina = CASE
    WHEN RIGHT(nome_disciplina, 1) = LOWER(RIGHT(nome_disciplina, 1)) THEN
        CONCAT(SUBSTRING(nome_disciplina, 1, LENGTH(nome_disciplina) - 1), UPPER(RIGHT(nome_disciplina, 1)))
    ELSE
        CONCAT(SUBSTRING(nome_disciplina, 1, LENGTH(nome_disciplina) - 1), LOWER(RIGHT(nome_disciplina, 1)))
END
WHERE codigo_disciplina = 'ELE003';
DELETE FROM disciplina
WHERE codigo_disciplina = 'MEC004';
ROLLBACK TO SAVEPOINT savepoint_insert_disc;

-- 4 
SAVEPOINT savepoint_antes_insert;
ALTER TABLE aluno
ADD COLUMN email VARCHAR(100);

INSERT INTO aluno (nro_matricula, nome_aluno, codigo_turma, email) VALUES
(1011, 'Renato Souza', 'TURMA01', 'renato.souza@email.com'),
(1012, 'Isabela Lima', 'TURMA02', 'isabela.lima@email.com'),
(1013, 'Gabriela Costa', 'TURMA03', 'gabriela.costa@email.com'),
(1014, 'Ricardo Pereira', 'TURMA04', 'ricardo.pereira@email.com');

UPDATE aluno
SET email = 'renato.souza@meudominio.com'
WHERE nro_matricula = 1011;

DELETE FROM aluno
WHERE nro_matricula = 1013;

ROLLBACK TO SAVEPOINT savepoint_antes_insert;

-- 5

SAVEPOINT savepoint_inserts_curso;

INSERT INTO curso (sigla_curso, codigo_disciplina, nome, carga_horaria, descricao) VALUES
('CS201', 'D004', 'Engenharia de Software', 320, 'Curso focado em desenvolvimento de software'),
('CS202', 'D001', 'Álgebra Linear', 240, 'Curso de álgebra com ênfase em aplicações computacionais'),
('CS203', 'D006', 'Redes de Computadores', 300, 'Curso sobre a teoria e prática de redes de computadores');


SAVEPOINT savepoint_inserts_turma;

INSERT INTO turma (codigo_turma, nro_alunos, sigla_curso, nro_registro_professor, periodo) VALUES
('TURMA11', 30, 'CS201', 'P001', '2024-2'),
('TURMA12', 25, 'CS202', 'P002', '2024-2'),
('TURMA13', 28, 'CS203', 'P003', '2024-2'),
('TURMA14', 35, 'CS201', 'P004', '2024-2');


DELETE FROM turma
WHERE codigo_turma = 'TURMA13';

ROLLBACK TO SAVEPOINT savepoint_inserts_turma;

COMMIT;



