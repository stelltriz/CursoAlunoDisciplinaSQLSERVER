CREATE TABLE Curso (
    id_curso INTEGER PRIMARY KEY IDENTITY,
    nome VARCHAR(50),
    turno VARCHAR(30)
);

CREATE TABLE Aluno (
    id_aluno INTEGER PRIMARY KEY IDENTITY,
    id_aluno_curso INTEGER,
    nome VARCHAR(50), 
    matricula int, 
    CONSTRAINT fk_aluno_curso FOREIGN KEY (id_aluno_curso) REFERENCES Curso(id_curso)
);

CREATE TABLE Disciplina (
    id_disciplina INTEGER PRIMARY KEY IDENTITY,
    id_disciplina_curso INTEGER,
    nome VARCHAR(50),
    carga_hora int,
    CONSTRAINT fk_disciplina_curso FOREIGN KEY (id_disciplina_curso) REFERENCES Curso(id_curso)
);

ALTER TABLE Curso ADD ano VARCHAR(50);

ALTER TABLE Disciplina ADD sala VARCHAR(50);

INSERT INTO Curso(nome, turno)
VALUES
('Informática', 'Manhã'),
('Eletroeletrônica', 'Tarde'),
('Mecatrônica', 'Noite');

INSERT INTO Disciplina(id_disciplina_curso, nome, carga_hora)
VALUES
(1, 'POO', 20),
(1, 'BD', 10),
(2, 'Digital', 10),
(2, 'Analógica', 20),
(3, 'Desenho', 15),
(3, 'Usinagem', 20);

INSERT INTO Aluno(id_aluno_curso, nome, matricula)
VALUES 
(1, 'Ana', 123),
(2, 'Maria', 333),
(3, 'Carla', 777);

UPDATE Disciplina SET carga_hora = 90;

UPDATE Curso SET turno = 'Noite' WHERE id_curso = 1;

SELECT nome 
FROM Aluno WHERE id_aluno_curso = 1;

SELECT Aluno.nome 
FROM Aluno
INNER JOIN Curso ON Curso.id_curso = Aluno.id_aluno_curso
INNER JOIN Disciplina ON Disciplina.id_disciplina_curso = Curso.id_curso
WHERE Disciplina.nome = 'POO';

SELECT Curso.nome
FROM Curso
INNER JOIN Disciplina ON Disciplina.id_disciplina_curso = Curso.id_curso
WHERE Disciplina.nome = 'BD';

SELECT Curso.nome, Curso.turno, Disciplina.nome
FROM Curso
INNER JOIN Disciplina ON Disciplina.id_disciplina_curso = Curso.id_curso
WHERE Curso.nome = 'Informática';

SELECT Aluno.nome, Aluno.matricula
FROM Aluno
INNER JOIN Curso ON Curso.id_curso = Aluno.id_aluno_curso
WHERE Curso.nome = 'Informática' OR Curso.nome = 'Eletroeletrônica';

SELECT Aluno.nome, Curso.nome
FROM Aluno
INNER JOIN Curso ON Curso.id_curso = Aluno.id_aluno_curso;

SELECT Curso.nome, Disciplina.nome, Disciplina.carga_hora
FROM Curso
INNER JOIN Disciplina ON Disciplina.id_disciplina_curso = Curso.id_curso;

SELECT Aluno.nome, Disciplina.nome
FROM Aluno
INNER JOIN Curso ON Curso.id_curso = Aluno.id_aluno_curso
INNER JOIN Disciplina ON Disciplina.id_disciplina_curso = Curso.id_curso
ORDER BY Aluno.nome ASC;