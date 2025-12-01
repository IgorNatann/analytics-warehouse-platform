/*
===================================================
Criar Banco de Dados e Esquemas
===================================================
Finalidade do Script:
    Este script cria um novo banco de dados chamado 'DataWarehouse' após verificar se ele já existe.
    Se o banco de dados existir, ele será excluído e recriado.
    Além disso, o script configura três esquemas dentro do banco de dados: 'bronze', 'silver' e 'gold'.

AVISO:
    A execução deste script excluirá todo o banco de dados 'DataWarehouse', caso ele exista.
    Todos os dados neste banco de dados serão excluídos permanentemente.
    Proceda com cautela e certifique-se de ter um backup adequado antes de executar este script.
*/

USE master; 
GO 

-- Dropa e Cria o banco de dados 'DataWarehouse'
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN 
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE; 
    DROP DATABASE DataWarehouse; 
END; 
GO

-- Cria o banco de dados 'DataWarehouse'
CREATE DATABASE DataWarehouse; 
GO 

USE DataWarehouse; 
GO 

-- Cria os esquemas 'bronze', 'silver' e 'gold'.
CREATE SCHEMA bronze; 
GO

CREATE SCHEMA silver; 
GO

CREATE SCHEMA gold; 
GO