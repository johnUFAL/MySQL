# Banco de Dados de Exemplo com MySQL

Este repositório contém um script SQL abrangente que cobre operações básicas e intermediárias em MySQL, incluindo a criação, manipulação, e consulta de tabelas com relações entre elas.

## Conteúdo do Script

O script inclui as seguintes funcionalidades:

1. **Criação do Banco de Dados e Tabelas**
   - Tabelas: `gafanhotos` (dados de pessoas) e `cursos` (cursos oferecidos).
   - Relação muitos-para-muitos implementada na tabela `assiste`.

2. **Manipulação de Dados**
   - Inserção de registros nas tabelas.
   - Atualização de dados específicos.
   - Exclusão de registros.

3. **Consultas Básicas e Avançadas**
   - Utilização de `JOIN` para relacionar tabelas.
   - Agregação de dados (`COUNT`, `SUM`, `AVG`).
   - Filtros avançados com `WHERE`, `LIKE`, `BETWEEN`.

4. **Modificação de Estruturas**
   - Alteração de tabelas existentes (`ALTER TABLE`).
   - Adição de colunas e chaves estrangeiras.

5. **Relações entre Tabelas**
   - Exemplos de relacionamentos 1:N e N:N.
   - Uso de `FOREIGN KEY` para garantir integridade referencial.

## Como Usar

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/mysql-exemplo.git
   cd mysql-exemplo
