## Carga Bronze com Arquivos Locais (sem Azure Blob)

Este projeto estava configurado para ler os CSVs a partir de um data source do Azure Blob (`DATA_SOURCE = 'dataset'`). Para evitar custos e depender apenas de arquivos locais, a abordagem foi alterada para usar caminhos absolutos no filesystem.

### O que mudou
- **`proc_load_bronze.sql`** agora faz `BULK INSERT` direto dos arquivos locais em `C:\Users\Igorn\Documents\Projects Pessoal\analytics-warehouse-platform\datasets\source_crm` e `source_erp`.
- **`azure_blob_access.sql`** virou apenas um script de limpeza: remove credencial/data source de Blob, pois não são mais usados.

### Pré-requisitos
1. Os arquivos CSV devem existir localmente em `datasets/source_crm` e `datasets/source_erp` (já versionados no repo).
2. O serviço do SQL Server (conta de execução) precisa de permissão de leitura nessa pasta.

### Passos para rodar
1) Criar/atualizar as tabelas bronze  
   - Execute `scripts/bronze/ddl_bronze.sql`.

2) Garantir que não há data source de Blob ativo (opcional, mas recomendado)  
   - Execute `scripts/bronze/azure_blob_access.sql` para dropar credencial/data source de Blob, se existirem.

3) Executar a carga local  
   - Execute `scripts/bronze/proc_load_bronze.sql` (cria/atualiza a procedure e roda `EXEC bronze.load_bronze`).

### Notas
- Se o SQL Server não conseguir ler a pasta do usuário, mova os CSVs para um diretório que a conta de serviço consiga acessar e ajuste os caminhos absolutos em `proc_load_bronze.sql`.
- Se quiser voltar a usar Blob no futuro, restaure as configurações de credencial/data source e troque os caminhos de `BULK INSERT` para os paths relativos no container.
