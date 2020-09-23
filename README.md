# Delivery APP GetX

|                       |
| :-------------------- |
| ![01](./app_demo.gif) |
|                       |

Um aplicativo de delivery (quase pronto) feito em flutter com GetX, GraphQL, GetStorage, Dio etc. Utilizando Strapi como Backend

## Instalação do Backend

### Requisitos

Este projeto usa [PostgreSQL] (https://www.postgresql.org/), portanto, para fazê-lo funcionar, instale em sua máquina local ou use Docker.

A configuração do banco de dados pode ser encontrada em [config/database.js](backend/config/database.js)

### Desenvolvimento

Após clonar este projeto, entre dentro da pasta backend e instale as dependências:

```
yarn install
```

And run using:

```
yarn develop
```

Os urls para acessar são:

- `http://localhost:1337/admin` - O painel para criar e preencher dados
- `http://localhost:1337/graphql` - GraphQL Playground para testar suas consultas GraphQL
- `http://localhost:1337/documentation/v1.0.0` - Documentão da API Rest

Na primeira vez para acessar o Admin, você precisará criar um usuário.

### Dump do Dados

Este projeto usa `Postgres` e se você quiser todos os dados previamente, descompacte o [database.sql.zip](database.sql.zip) e restaure os dados do arquivox dentro do zip.
