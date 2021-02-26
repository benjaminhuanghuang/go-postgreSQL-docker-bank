# DB Migration


## Go migration library

```
  brew install golang-migrate

  migrate -version
```

Create the `first` migration file 
```
  # -ext the extension of the file will be sql
  # -seq generate sequential version num
  # init_schema is migration file name 
  migrate create -ext sql -dir db/migration -seq init_sechma
```
this command create 2 files:  
0000001_<filename>.down.sql and  0000001_<filename>.up.sql

The first up.sql will be used to init the database
copy bank.sql to up.sql


The first down.sql will be used clean database to nothing
```
  DROP TABLE IF EXISTS entries;
  DROP TABLE IF EXISTS transfers;
  DROP TABLE IF EXISTS accounts;
```
For the foreign constraint, the order matters

## Create Makefile


