# Projeto Joomla 5.2 com Docker Compose

Este projeto configura um ambiente para o Joomla 5.2 utilizando Docker e Docker Compose. Com esta configuração, você pode facilmente levantar um ambiente de desenvolvimento local com Joomla, MySQL e Adminer para gerenciar o banco de dados.

## Pré-requisitos:
Certifique-se de ter instalado os seguintes requisitos em sua máquina:

- Docker (versão 20+)
- Docker Compose (versão 3.8+)

## Estrutura do Projeto
- joomla_app: Serviço Joomla executando Apache e PHP 8.2.
- joomla_db: Banco de dados MySQL 8 para armazenar os dados do Joomla.
- adminer: Interface de administração do banco de dados.

## Instruções para Configuração
### Passo 1: Build e Start dos Containers

Para subir o ambiente, execute o seguinte comando na pasta raiz do projeto:
```bash
docker-compose up -d --build
```

Este comando irá:

1. Fazer o build da imagem Joomla personalizada usando o Dockerfile.
2. Levantar os contêineres Joomla, MySQL e Adminer em background.

### Passo 2: Acessar o Joomla

Após o ambiente estar ativo, você pode acessar o Joomla em:

- Joomla: http://localhost:8080

### Passo 3: Acessar o Adminer (para gerenciar o banco de dados)

Você pode acessar o Adminer para manipulação do banco de dados em:

- Adminer: http://localhost:8081

### Detalhes de Conexão do Banco de Dados

- Servidor: db (ou mysql no Adminer)
- Usuário: joomla_user
- Senha: root
- Nome do Banco: joomla_db

### Comandos Úteis

Parar os contêineres
```bash
docker-compose down
```

Verificar logs
```bash
docker-compose logs -f
```

Reiniciar contêineres
```bash
docker-compose restart
```