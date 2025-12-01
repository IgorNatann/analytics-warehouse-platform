/*
Nome do Arquivo: azure_blob_access.sql

Proposito:
Este script configura os componentes necessarios para habilitar acesso seguro ao Azure Blob Storage
a partir do SQL Server. Ele cria uma master key, uma credencial com escopo de banco e uma
fonte de dados externa, que sao pre-requisitos para realizar operacoes como BULK INSERT
do Azure Blob Storage.

Componentes:
1. Master Key: Criptografa o segredo da credencial no nivel do banco.
2. Credencial com escopo de banco: Armazena o token SAS para acesso ao Azure Blob Storage.
3. Fonte de dados externa: Define a conexao com o container do Azure Blob Storage.

Uso:
Execute este script uma vez para configurar o acesso ao Azure Blob Storage. Apos a execucao, esses
objetos ficarao disponiveis para uso em outros scripts ou stored procedures que precisem
interagir com o container especificado do Azure Blob Storage.

Nota de Seguranca:
- A senha da master key e o token SAS neste script devem ser substituidos por valores seguros.
- Em producao, considere usar o Azure Key Vault para gerenciar esses segredos.

Manutencao:
- O token SAS tem data de expiracao. Atualize a credencial antes de o token expirar.
- Se o local do Azure Blob Storage mudar, atualize a fonte de dados externa conforme necessario.
*/

-- Create a Master Key 
-- Which is required to create database scoped credentials since the blob storage 
-- is not configured to allow public (anonymous) access. 
CREATE MASTER KEY
ENCRYPTION BY PASSWORD= 'Masterkeypsw*'
GO


-- Create a database scope credentials - SAS
CREATE DATABASE SCOPED CREDENTIAL [https://salesdatasets.blob.core.windows.net/datasets/]
WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
SECRET = 'your-SAS-token';
GO

-- Create an external data source 
CREATE EXTERNAL DATA SOURCE dataset
WITH 
(
    TYPE = BLOB_STORAGE,
    LOCATION = 'https://salesdatasets.blob.core.windows.net/datasets',
    CREDENTIAL = [https://salesdatasets.blob.core.windows.net/datasets/]
); 
GO
