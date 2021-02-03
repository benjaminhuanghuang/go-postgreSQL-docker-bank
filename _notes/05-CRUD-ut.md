# Generate CRUD Golang code from SQL | Compare db/sql, gorm, sqlx & sqlc

## Database / SQL
```
  import (

  )


  db.QueryRowContext(ctx, "SELECT *").Scan(&usename, &created)
```

## gorm
Slow


## SqlX



## SqlC
```
  brew install kyleconroy/sqlc/sqlc
  sqlc version

  sqlc init
```
modify sqlc.yaml

run 
```
  sqlc generate
```
