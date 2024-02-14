# Exercícios Banco de Dados

# Aluna: Charlene Marcondes Avelar

# 1. Crie uma tabela chamada "alunos" com os seguintes campos: id
(inteiro), nome (texto), idade (inteiro) e curso (texto).

CREATE TABLE alunos(id INT, nome VARCHAR(100), idade INT, curso VARCHAR(100));

SELECT * FROM alunos;

# 2. Insira pelo menos 5 registros de alunos na tabela que você criou no
exercício anterior.

	INSERT INTO alunos (id, nome, idade, curso) 
VALUES 
    (1, 'João', 18, 'Engenharia'),
    (2, 'Maria', 22, 'Medicina'),
    (3, 'Carlos', 21, 'Direito'),
    (4, 'Ana', 19, 'Arquitetura'),
    (5, 'Pedro', 23, 'Administração');

# 3. a) Selecionar todos os registros da tabela "alunos".

SELECT * FROM alunos;

# 3. b) Selecionar o nome e a idade dos alunos com mais de 20 anos.

SELECT nome, idade FROM alunos WHERE idade > 20;

# 3. c) Selecionar os alunos do curso de "Engenharia" em ordem
alfabética.

SELECT * FROM alunos WHERE curso = 'Engenharia' ORDER BY nome;

# 3. d) Contar o número total de alunos na tabela. 

SELECT COUNT(*) AS total_alunos FROM alunos;

# 4. a) Atualize a idade de um aluno específico na tabela.

UPDATE alunos
SET idade = 25
WHERE id = 3;
SELECT * FROM alunos;

# 4. b) Remova um aluno pelo seu ID.

DELETE FROM alunos
WHERE id = 4;
SELECT * FROM alunos;

# 5. Criar uma Tabela e Inserir Dados, Crie uma tabela chamada "clientes" com os campos: id (chave
primária), nome (texto), idade (inteiro) e saldo (float). Insira alguns registros de clientes na tabela.

CREATE TABLE clientes(id INT, nome VARCHAR(100), idade INT, saldo float);

SELECT * FROM clientes;

INSERT INTO clientes (nome, idade, saldo) 
VALUES 
    ('Vitor', 30, 1000.50),
    ('Graça', 25, 1500.75),
    ('Paulo', 35, 2000.00),
    ('Anelise', 28, 1200.25);
   
SELECT * FROM clientes;

# 6. a) Selecione o nome e a idade dos clientes com idade superior a 30 anos.

SELECT nome, idade FROM clientes WHERE idade > 30;

# 6. b) Calcule o saldo médio dos clientes.

SELECT AVG(saldo) AS saldo_medio FROM clientes;

# 6. c) Encontre o cliente com o saldo máximo.

SELECT * FROM clientes WHERE saldo = (SELECT MAX(saldo) FROM clientes);

# 6. d) Conte quantos clientes têm saldo acima de 1000.

SELECT COUNT(*) AS quantidade_clientes_above_1000 FROM clientes WHERE saldo > 1000;

# 7. a) Atualize o saldo de um cliente específico.

UPDATE clientes
SET saldo = 1800.00
WHERE id = 1;
SELECT * FROM clientes;

# 7. b) Remova um cliente pelo seu ID.

DELETE FROM clientes
WHERE id = 2;
SELECT * FROM clientes;

# 8. Crie uma segunda tabela chamada "compras" com os campos: id
(chave primária), cliente_id (chave estrangeira referenciando o id
da tabela "clientes"), produto (texto) e valor (real). Insira algumas
compras associadas a clientes existentes na tabela "clientes".
Escreva uma consulta para exibir o nome do cliente, o produto e o
valor de cada compra. 

CREATE TABLE compras (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER,
    produto TEXT,
    valor REAL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id));

SELECT * FROM compras;

INSERT INTO compras (cliente_id, produto, valor) 
VALUES 
    (1, 'Produto X', 100.00),
    (2, 'Produto Y', 150.00),
    (3, 'Produto Z', 200.00),
    (4, 'Produto W', 180.00);
   SELECT * FROM compras;
  
SELECT c.nome AS nome_cliente, p.produto, p.valor
FROM clientes c
LEFT JOIN compras p ON c.id = p.cliente_id;
