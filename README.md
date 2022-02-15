# Delivery APP

|                       |
| :-------------------- |
| ![01](./app_demo.gif) |
|                       |

Um aplicativo de delivery feito em Flutter GraphQL, GetStorage, Dio etc

## Instalação do Backend

O backend deste projeto foi feito com [Strapi](https://strapi.io). 

### Requisitos
 * Node.js
 * Postgres

A configuração do banco de dados pode ser encontrada em [config/database.js](backend/config/database.js)

### Desenvolvimento

Após clonar este projeto, entre dentro da pasta backend e instale as dependências:

```
npm ou yarn install
```

E inicie o servidor:

```
yarn develop ou npm run develop
```

As urls de acesso são:

- `http://localhost:1337/admin` - O painel para criar e preencher dados
- `http://localhost:1337/graphql` - GraphQL Playground para testar suas consultas GraphQL
- `http://localhost:1337/documentation/v1.0.0` - Documentão da API Rest

Na primeira vez para acessar o Admin, você precisará criar um usuário.

### Dump do Dados

Este projeto usa `Postgres` e se você quiser todos os dados previamente, descompacte o [database.sql.zip](database.sql.zip) e restaure os dados do arquivo dentro do zip.
