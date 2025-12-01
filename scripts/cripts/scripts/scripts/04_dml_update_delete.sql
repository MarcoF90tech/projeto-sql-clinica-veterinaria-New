-- 📌 Script com ao menos três comandos de UPDATE e três de DELETE com condições

-- --- COMANDOS UPDATE ---

-- 1. UPDATE simples: Atualizar o diagnóstico da Consulta 1.
UPDATE Consultas
SET diagnostico = 'Resfriado comum, prescrever anti-inflamatório.',
    valor = 135.00
WHERE consulta_id = 1;

-- 2. UPDATE por condição complexa: Aumentar em 10% o valor de todas as consultas realizadas pelo Dr. João Pereira.
UPDATE Consultas
SET valor = valor * 1.10
WHERE vet_id = (SELECT vet_id FROM Veterinarios WHERE nome = 'Dr. João Pereira');

-- 3. UPDATE em chave primária (se necessário) ou atributo principal: Corrigir o telefone de um dono.
UPDATE Donos
SET telefone = '991110000'
WHERE nome = 'Ana Silva';

-- Checagem dos updates:
SELECT * FROM Consultas WHERE consulta_id = 1 OR vet_id = 101;


-- --- COMANDOS DELETE ---

-- 1. DELETE condicional simples: Remover uma consulta específica (Ex: consulta cancelada).
DELETE FROM Consultas
WHERE consulta_id = 2; -- Remove a consulta do Miau

-- 2. DELETE por condição de tempo: Remover um animal (e suas consultas relacionadas, se ON DELETE CASCADE) que tem mais de 6 anos e é da raça Poodle.
-- ATENÇÃO: Se usar ON DELETE CASCADE, as consultas do animal 10 serão apagadas!
DELETE FROM Animais
WHERE raca = 'Poodle' AND data_nascimento < '2019-01-01';

-- 3. DELETE seguro (demonstrando integridade): Tenta deletar um Veterinário que AINDA tem consultas registradas.
-- Se o DDL usou ON DELETE RESTRICT (o que é ideal para FKs importantes), este comando deve FALHAR, o que demonstra a integridade do banco.
-- DELETE FROM Veterinarios WHERE nome = 'Dr. João Pereira';

-- DELETE de um registro que não tem relacionamentos importantes (para garantir a exclusão).
DELETE FROM Donos
WHERE nome = 'Carla Oliveira'; -- Se o animal Zeca foi excluído/transferido

-- Resultado final dos dados para checagem:
SELECT * FROM Donos;
SELECT * FROM Animais;
SELECT * FROM Consultas;
