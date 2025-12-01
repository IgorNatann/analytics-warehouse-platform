# Projeto de Data Warehouse em SQL

Repositório para uma solução completa de Data Warehouse e Analytics, da ingestão de dados à geração de insights acionáveis.

---
## Visão Geral

O projeto cobre:

1. **Arquitetura de Dados**: Data Warehouse moderno usando a Medallion Architecture com camadas **Bronze**, **Silver** e **Gold**.
2. **Pipelines ETL**: Extração, transformação e carga de dados dos sistemas fonte para o DW.
3. **Modelagem Dimensional**: Tabelas fato e dimensões otimizadas para consultas analíticas.
4. **Analytics e Relatórios**: Consultas SQL e dashboards para insights de negócio.

## Requisitos do Projeto

### Construção do Data Warehouse (Data Engineering)

**Objetivo**  
Criar um DW em SQL Server para consolidar dados de vendas e habilitar relatórios analíticos e tomada de decisão.

**Especificações**
- **Fontes de dados**: Importar de dois sistemas (ERP e CRM) fornecidos como CSV.
- **Qualidade**: Tratar e corrigir problemas de qualidade antes da análise.
- **Integração**: Unificar as fontes em um modelo analítico de fácil consumo.
- **Escopo**: Focar no dataset mais recente (sem historização).
- **Documentação**: Descrever claramente o modelo para negócio e analytics.

### BI: Analytics e Relatórios (Data Analysis)

**Objetivo**  
Produzir análises SQL para insights sobre:
- **Comportamento de clientes**
- **Performance de produtos**
- **Tendências de vendas**

## Arquitetura de Dados

A arquitetura segue a Medallion Architecture com camadas **Bronze**, **Silver** e **Gold**:
![Data Architecture](docs/data_architecture.png)

1. **Bronze**: Armazena dados brutos dos sistemas fonte (CSV carregados no SQL Server).
2. **Silver**: Limpeza, padronização e normalização para preparar a análise.
3. **Gold**: Dados prontos para negócio, modelados em esquema estrela para relatórios e analytics.

## Integração de Dados 

Diagrama de integração entre as tabelas e relacionamentos:
![data integration](docs/data_integration.png)

## Modelagem de Dados 

Após Bronze (bruto) e Silver (transformado), a camada Gold é modelada em esquema estrela (fato + dimensões):
![data model](docs/data_model.png)

Fluxo completo de dados:
![data flow](docs/data_flow.png)
