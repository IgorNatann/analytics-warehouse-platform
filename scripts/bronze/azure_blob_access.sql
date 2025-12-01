/*
Nome do Arquivo: azure_blob_access.sql

Proposito:
Como a carga sera feita a partir de arquivos locais (filesystem) e nao via Azure Blob,
este script apenas remove, se existirem, os objetos relacionados ao Blob (data source
e credencial). Nenhuma configuracao de Blob e necessaria.

Componentes removidos (se existirem):
1. Credencial com escopo de banco para o Blob.
2. Fonte de dados externa do Blob.

Uso:
Execute este script apenas para garantir que nenhum data source/credencial de Blob permaneceu.
Depois disso, a carga usara caminhos absolutos locais no `BULK INSERT` das procedures.
*/

PRINT 'Removendo configuracoes de Blob (se existirem) e usando apenas arquivos locais...';
GO

-- Remove data source externo do Blob, se existir
IF EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'dataset')
    DROP EXTERNAL DATA SOURCE dataset;
GO

-- Remove credencial de Blob, se existir
IF EXISTS (SELECT * FROM sys.database_credentials WHERE name = 'https://salesdatasets.blob.core.windows.net/datasets/')
    DROP DATABASE SCOPED CREDENTIAL [https://salesdatasets.blob.core.windows.net/datasets/];
GO

PRINT 'Configuracao concluida: Blob desabilitado, leitura somente de arquivos locais.';
