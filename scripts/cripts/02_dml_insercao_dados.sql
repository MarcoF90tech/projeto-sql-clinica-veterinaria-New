-- 📌 Script SQL com comandos de INSERT para povoar as tabelas principais

-- 1. Inserindo Dados na tabela DONOS
INSERT INTO Donos (dono_id, nome, telefone, cpf) VALUES
(1, 'Ana Silva', '991234567', '11122233344'),
(2, 'Bruno Costa', '998765432', '55566677788'),
(3, 'Carla Oliveira', '995554444', '99988877766');

-- 2. Inserindo Dados na tabela VETERINARIOS
INSERT INTO Veterinarios (vet_id, nome, crmv, especialidade) VALUES
(101, 'Dr. João Pereira', 'CRMV-SP 12345', 'Clínico Geral'),
(102, 'Dra. Maria Souza', 'CRMV-RJ 67890', 'Dermatologia');

-- 3. Inserindo Dados na tabela ANIMAIS (dono_id deve ser 1, 2 ou 3)
INSERT INTO Animais (animal_id, nome, especie, raca, data_nascimento, dono_id) VALUES
(10, 'Fido', 'Cachorro', 'Poodle', '2020-05-10', 1), -- Dono: Ana
(11, 'Miau', 'Gato', 'Siamês', '2022-01-20', 2), -- Dono: Bruno
(12, 'Rex', 'Cachorro', 'Pastor Alemão', '2019-11-25', 1), -- Dono: Ana
(13, 'Zeca', 'Pássaro', 'Calopsita', '2023-03-01', 3); -- Dono: Carla

-- 4. Inserindo Dados na tabela CONSULTAS (animal_id deve ser 10, 11, 12 ou 13; vet_id deve ser 101 ou 102)
INSERT INTO Consultas (consulta_id, animal_id, vet_id, data_consulta, sintomas, valor) VALUES
(1, 10, 101, '2025-11-15 10:00:00', 'Tosse e febre', 120.00), -- Fido (Dr. João)
(2, 11, 102, '2025-11-16 14:30:00', 'Coceira na pele', 150.00), -- Miau (Dra. Maria)
(3, 12, 101, '2025-11-16 16:00:00', 'Check-up anual', 90.00); -- Rex (Dr. João)

-- Teste rápido
SELECT A.nome, D.nome AS Dono, C.data_consulta FROM Animais A JOIN Donos D ON A.dono_id = D.dono_id JOIN Consultas C ON A.animal_id = C.animal_id;
