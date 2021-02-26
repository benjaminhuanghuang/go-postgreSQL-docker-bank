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
copy bank.sql created by https://dbdiagram.io to up.sql


The first down.sql will be used to revert database to nothing
```
  DROP TABLE IF EXISTS entries;
  DROP TABLE IF EXISTS transfers;
  DROP TABLE IF EXISTS accounts;
```
For the foreign constraint, the order matters

## Create db in docker
Method 1:
```
  docker ps -a

  dockeer start postgres12

  docker exec -it postgres12 /bin/sh    # go into docker

  createdb --username=root --owner=root simple_bank

  psql simple_bank                      # postgres shell

  # drop simple_bank
  # exit
```

Method 2:
```
  create --username=root --owner=root simple_bank
```

## Migration
```
migrateup:
	migrate -path db/migration -database "postgresql://root:root1234@localhost:5432/simple_bank?sslmode=disable" -verbose up
	
migrateup1:
	migrate -path db/migration -database "postgresql://root:root1234@localhost:5432/simple_bank?sslmode=disable" -verbose up 1

migratedown:
	migrate -path db/migration -database "postgresql://root:root1234@localhost:5432/simple_bank?sslmode=disable" -verbose down

migratedown1:
	migrate -path db/migration -database "postgresql://root:root1234@localhost:5432/simple_bank?sslmode=disable" -verbose down 1
```
