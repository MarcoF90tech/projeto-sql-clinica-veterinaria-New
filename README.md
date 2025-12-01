# 🚀 Projeto Integrado: Criação e Manipulação de Dados com SQL

## Mini-mundo: <Nome do Seu Projeto (Exemplo: Sistema de Gerenciamento de Livraria)>

Olá! Este repositório contém o projeto prático de **Criação e Manipulação de Dados (DML)** em um banco de dados relacional. O objetivo foi aplicar comandos SQL em um cenário real (o "mini-mundo" da <Nome do Mini-mundo>), integrando a modelagem lógica (DDL) com a manipulação de dados (DML), garantindo a **integridade referencial** e a **coerência** dos dados.

---

## ✨ Fundamentos e Objetivos

Este projeto foi construído sobre três pilares essenciais: a **Taxonomia de Bloom** (Aplicar e Criar), a **Taxonomia de Fink** (Aplicação, Integração e Aprendendo a Aprender) e a prática de **Versionamento** (Git/GitHub).

### 🎯 O que foi feito?

* **Implementação do Modelo Lógico:** As tabelas foram criadas com seus respectivos **tipos de dados** coerentes (ex: `VARCHAR` para nomes, `INT` para IDs, `DATE` para datas, etc.), utilizando o *script* DDL.
* **Manipulação de Dados (DML):** Uso dos comandos `INSERT`, `SELECT`, `UPDATE` e `DELETE` para popular, consultar e manter a base de dados.
* **Versionamento:** Todo o desenvolvimento dos *scripts* foi controlado e compartilhado publicamente via GitHub.

### 🛠️ Ferramentas Utilizadas

| Ferramenta | Função |
| :--- | :--- |
| **SGBD** | PostgreSQL / MySQL (Depende do que você usou) |
| **Ambiente de Desenvolvimento** | <Nome da Ferramenta (Ex: PGAdmin 4 ou MySQL Workbench)> |
| **Controle de Versão** | Git e GitHub |

---

## ⚙️ Como Executar o Projeto

Para rodar este projeto e testar os *scripts* em seu ambiente, siga os passos abaixo:

1.  **Pré-requisitos:** Certifique-se de ter o SGBD (`PostgreSQL` ou `MySQL`) e o cliente de banco de dados (`PGAdmin` ou `Workbench`) instalados.
2.  **Clone o Repositório:**
    ```bash
    git clone <link-do-seu-repositorio>
    ```
3.  **Criação do Banco de Dados:** Crie um novo banco de dados no seu SGBD com o nome `db_<nome_do_seu_mini_mundo>`.
4.  **Execução dos Scripts (Ordem Crucial!):**
    * Abra o seu cliente de banco de dados (<Ferramenta>) e conecte-se ao BD recém-criado.
    * Execute o arquivo `scripts/01_ddl_criacao_tabelas.sql` para criar toda a estrutura (tabelas, chaves primárias e estrangeiras).
    * Execute o arquivo `scripts/02_dml_insercao_dados.sql` para popular as tabelas.
    * Execute e analise os comandos nos arquivos `03_dml_consultas_avancadas.sql` e `04_dml_update_delete.sql`.

---

## 📂 Detalhes dos Scripts SQL

Todos os *scripts* essenciais para a avaliação estão na pasta `scripts/`.

### 1. `01_ddl_criacao_tabelas.sql`

> **Nota:** Este arquivo DDL deve conter os `CREATE TABLE` do seu modelo lógico, definindo as chaves primárias (`PRIMARY KEY`) e estrangeiras (`FOREIGN KEY`) que garantem a **Integridade dos Dados**.

```sql
-- Exemplo de uma tabela do seu mini-mundo. Adapte para o seu projeto!

-- MINI-MUNDO: LIVRARIA
CREATE TABLE Autores (
    autor_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

CREATE TABLE Livros (
    livro_id INT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    ano_publicacao INT,
    autor_id INT,
    preco DECIMAL(10, 2),
    FOREIGN KEY (autor_id) REFERENCES Autores(autor_id)
);

-- ... (Outras tabelas do seu projeto)
