Bem vindo ao DBT - Hyper-XPTO-Bigquery

### Instalação

Crie o ambiente virtual
- python -m venv env
Acesse o ambiente virtual
- source env/scripts/ativate
Instale DBT
- pip install dbt-core dbt-bigquery
- dbt deps
Recorte o arquivo: profiles.yml e cole na sua pasta C:\Users\SeuUsuario\.dbt\
Crie essa pasta se ela não existir
Abra o arquivo profiles.yml e atualize com o caminho da KEYFILE, apontando corretamente para a sua KEYFILE gerada no google cloud

Teste a conexão com o comando:
- dbt debug


### Uso
pra rodar um model
- dbt run --select nomedomodel

pra rodar todos os models
- dbt run

pra testar apenas um model
- dbt test --select nomedomodel

pra rodar todos os testes
- dbt test

pra criar e visualizar a documentação
- dbt docs generate
- dbt docs serve

### Sobre o projeto
O projeto contém apenas metade dos models de trusted. A outra metade seria feita por quem fizesse o treinamento como aluno. É possivel também remover as tabelas no SCHEMA Bigquery e simplesmente refazer todas as models trusted.