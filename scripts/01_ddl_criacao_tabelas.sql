-- MINI-MUNDO: CLÍNICA VETERINÁRIA

-- ATENÇÃO: Se estiver usando MySQL, use AUTO_INCREMENT em vez de SERIAL, e ajuste os tipos de dados conforme necessário.
-- Se estiver usando PostgreSQL, SERIAL é apropriado.

-- 1. Tabela DONOS (Chave Primária)
CREATE TABLE Donos (
    dono_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    cpf VARCHAR(14) UNIQUE
);

-- 2. Tabela ANIMAIS (FK para Donos)
CREATE TABLE Animais (
    animal_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especie VARCHAR(50), -- Ex: Cachorro, Gato, Pássaro
    raca VARCHAR(50),
    data_nascimento DATE,
    dono_id INT NOT NULL,
    FOREIGN KEY (dono_id) REFERENCES Donos(dono_id) ON DELETE RESTRICT
);

-- 3. Tabela VETERINARIOS
CREATE TABLE Veterinarios (
    vet_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    crmv VARCHAR(20) UNIQUE,
    especialidade VARCHAR(50)
);

-- 4. Tabela CONSULTAS (FK para Animais e Veterinarios)
CREATE TABLE Consultas (
    consulta_id SERIAL PRIMARY KEY,
    animal_id INT NOT NULL,
    vet_id INT NOT NULL,
    data_consulta TIMESTAMP NOT NULL,
    sintomas TEXT,
    diagnostico TEXT,
    valor DECIMAL(10, 2),
    FOREIGN KEY (animal_id) REFERENCES Animais(animal_id) ON DELETE CASCADE,
    FOREIGN KEY (vet_id) REFERENCES Veterinarios(vet_id) ON DELETE RESTRICT
);
