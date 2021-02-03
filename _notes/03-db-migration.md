# DB Migration


## Go migration library

```
  brew install golang-migrate

  migrate -version

  # -seq generate sequential version num
  # init_schema is migration file name 
  migrate create -ext sql -dir db/migration -seq init_sechma

  # this command create 2 files: up, down
```
copy bank.sql to up.sql

modify down.sql
```
  DROP TABLE IF EXISTS entries;
  DROP TABLE IF EXISTS transfers;
  DROP TABLE IF EXISTS accounts;
```
For the foreign constraint, the order matters



## Create Makefile


