-- 📌 Script SQL com duas a cinco consultas usando SELECT (com WHERE, ORDER BY, LIMIT, JOIN etc.)

-- 1. Consulta com JOIN e WHERE: Nome do animal, nome do dono e data da consulta para animais que tiveram consulta com o 'Dr. João Pereira'.
SELECT
    A.nome AS Animal,
    D.nome AS Dono,
    C.data_consulta
FROM
    Consultas C
JOIN
    Animais A ON C.animal_id = A.animal_id
JOIN
    Donos D ON A.dono_id = D.dono_id
JOIN
    Veterinarios V ON C.vet_id = V.vet_id
WHERE
    V.nome = 'Dr. João Pereira'
ORDER BY
    C.data_consulta DESC;

-- 2. Consulta com Agregação (SUM) e GROUP BY: Valor total gasto por cada dono em consultas.
SELECT
    D.nome AS Dono,
    SUM(C.valor) AS TotalGasto
FROM
    Donos D
LEFT JOIN
    Animais A ON D.dono_id = A.dono_id
LEFT JOIN
    Consultas C ON A.animal_id = C.animal_id
GROUP BY
    D.nome
HAVING
    SUM(C.valor) > 0;

-- 3. Consulta com ORDER BY e LIMIT: Top 2 consultas mais caras.
SELECT
    C.consulta_id,
    A.nome AS Animal,
    C.valor
FROM
    Consultas C
JOIN
    Animais A ON C.animal_id = A.animal_id
ORDER BY
    C.valor DESC
LIMIT 2;

-- 4. Consulta com JOIN e DATE/Time (Função de Data): Animais que nasceram após 2021.
SELECT
    A.nome AS Animal,
    A.data_nascimento,
    D.nome AS Dono
FROM
    Animais A
JOIN
    Donos D ON A.dono_id = D.dono_id
WHERE
    A.data_nascimento > '2021-12-31'
ORDER BY
    A.data_nascimento ASC;
