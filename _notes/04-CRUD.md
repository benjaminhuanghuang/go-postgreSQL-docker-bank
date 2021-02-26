# Generate CRUD Golang code from SQL | Compare db/sql, gorm, sqlx & sqlc


## Libary for db access
- Database / SQL
Downside: Map SQL fields to variables manaually
```
  import (

  )


  db.QueryRowContext(ctx, "SELECT *").Scan(&usename, &created)
```

- gorm
Slow, Must learn to query using gorm's function


- SqlX



- SqlC
Generage code based on sql


## Use sqlc
- Setup
```
  brew install kyleconroy/sqlc/sqlc
  sqlc version

  sqlc init              # create sqlc.yaml config file
```
modify sqlc.yaml
```
  path: "./db/sqlc"
  queries: "./db/query/"
  schema: "./db/migration/"
  engine: "postgresql"
```


- Create SQL query under /query. 

>sqlc will use /query/*.sql to generate code

```
-- name: CreateAccount :one
INSERT INTO accounts (
  owner,
  balance,
  currency
) VALUES (
  $1, $2, $3
) RETURNING *;   -- return all columns
```


- generate code 
```
  sqlc generate
```
sqlc will create
```
  db.go           # contains DBTX interface
  modules.go
  xxx.sql.go
```

Pagination
```
  -- name: ListAccounts :many
  SELECT * FROM accounts
  ORDER BY id
  LIMIT $1
  OFFSET $2;
```