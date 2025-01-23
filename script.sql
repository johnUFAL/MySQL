-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS cadastro;
USE cadastro;

-- Tabela 'gafanhotos': informações pessoais
CREATE TABLE IF NOT EXISTS gafanhotos (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    profissao VARCHAR(50),
    nascimento DATE NOT NULL,
    genero CHAR(1) NOT NULL,
    peso DECIMAL(5,2) NOT NULL,
    altura DECIMAL(4,2) NOT NULL,
    nacionalidade VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
) DEFAULT CHARSET=utf8mb3;

-- Inserção de dados na tabela 'gafanhotos'
INSERT INTO gafanhotos VALUES 
(1, 'Daniel Morais', 'Auxiliar Administrat', '1984-01-02', 'M', 78.50, 1.83, 'Brasil'),
(2, 'Talita Nascimento', 'Farmacêutico', '1999-12-30', 'F', 55.20, 1.65, 'Portugal'),
(3, 'Emerson Gabriel', 'Programador', '1920-12-30', 'M', 50.20, 1.65, 'Moçambique');
-- Adicione mais registros conforme necessário...

-- Tabela 'cursos': detalhes sobre os cursos oferecidos
CREATE TABLE IF NOT EXISTS cursos (
    idcurso INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255),
    carga INT NOT NULL,
    inscritos INT NOT NULL,
    ano INT NOT NULL,
    PRIMARY KEY (idcurso)
) DEFAULT CHARSET=utf8mb3;

-- Inserção de dados na tabela 'cursos'
INSERT INTO cursos VALUES 
(1, 'HTML5', 'Curso de HTML5', 40, 37, 2014),
(2, 'Algoritmos', 'Lógica de Programação', 20, 15, 2014),
(3, 'Photoshop5', 'Dicas de Photoshop CC', 10, 8, 2014);
-- Adicione mais registros conforme necessário...

-- Adição de coluna e chave estrangeira em 'gafanhotos' para relacionamento com 'cursos'
ALTER TABLE gafanhotos 
ADD COLUMN cursopreferido INT,
ADD FOREIGN KEY (cursopreferido) REFERENCES cursos(idcurso);

-- Atualizando registros para atribuir cursos preferidos
UPDATE gafanhotos SET cursopreferido = 1 WHERE id = 1;
UPDATE gafanhotos SET cursopreferido = 2 WHERE id = 2;

-- Consulta básica com JOIN: visualizando informações de cursos preferidos
SELECT g.nome AS Gafanhoto, c.nome AS Curso, c.ano AS Ano 
FROM gafanhotos g 
JOIN cursos c 
ON g.cursopreferido = c.idcurso;

-- Tabela 'assiste': relação muitos-para-muitos entre 'gafanhotos' e 'cursos'
CREATE TABLE IF NOT EXISTS assiste (
    id INT NOT NULL AUTO_INCREMENT,
    data DATE NOT NULL,
    idgafanhoto INT NOT NULL,
    idcurso INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (idgafanhoto) REFERENCES gafanhotos(id),
    FOREIGN KEY (idcurso) REFERENCES cursos(idcurso)
) DEFAULT CHARSET=utf8mb3;

-- Inserindo registros na tabela 'assiste'
INSERT INTO assiste (data, idgafanhoto, idcurso) VALUES
('2025-01-23', 1, 1),
('2025-01-24', 2, 2),
('2025-01-25', 1, 2);

-- Consulta avançada: informações de cursos assistidos por 'gafanhotos'
SELECT g.nome AS Gafanhoto, c.nome AS Curso, a.data AS DataAssistencia 
FROM gafanhotos g 
JOIN assiste a ON g.id = a.idgafanhoto
JOIN cursos c ON a.idcurso = c.idcurso;

-- Operações de agregação: contagem, soma, média
-- Contando o número de cursos disponíveis
SELECT COUNT(*) AS TotalCursos FROM cursos;

-- Calculando a média de carga horária dos cursos
SELECT AVG(carga) AS MediaCargaHoraria FROM cursos;

-- Visualizando o número de 'gafanhotos' por nacionalidade
SELECT nacionalidade, COUNT(*) AS Total 
FROM gafanhotos 
GROUP BY nacionalidade 
ORDER BY Total DESC;

-- Exemplo de junção LEFT JOIN para incluir registros sem relacionamento
SELECT g.nome AS Gafanhoto, c.nome AS Curso 
FROM gafanhotos g 
LEFT JOIN cursos c 
ON g.cursopreferido = c.idcurso;

-- Exclusão de registros
-- Deletando um registro específico
DELETE FROM gafanhotos WHERE id = 3;

-- Removendo todos os registros de uma tabela (sem apagar a estrutura)
TRUNCATE TABLE assiste;

-- Modificando tabelas
-- Adicionando nova coluna
ALTER TABLE cursos ADD COLUMN nivel VARCHAR(20) DEFAULT 'Básico';

-- Alterando tipo de coluna
ALTER TABLE cursos MODIFY COLUMN nivel ENUM('Básico', 'Intermediário', 'Avançado') NOT NULL;

-- Consultas com filtros avançados
-- Selecionando cursos criados após 2015
SELECT * FROM cursos WHERE ano > 2015;

-- Busca de 'gafanhotos' com peso acima de 80 kg
SELECT * FROM gafanhotos WHERE peso > 80;

-- Finalizando com backup básico
-- Exportação de dados (exemplo fictício)
-- mysqldump -u usuario -p cadastro > backup.sql
