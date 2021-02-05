postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root1234 -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres12 dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:root1234@localhost:5432/simple_bank?sslmode=disable" -verbose up
	
migrateup1:
	migrate -path db/migration -database "postgresql://root:root1234@localhost:5432/simple_bank?sslmode=disable" -verbose up 1

migratedown:
	migrate -path db/migration -database "postgresql://root:root1234@localhost:5432/simple_bank?sslmode=disable" -verbose down

migratedown1:
	migrate -path db/migration -database "postgresql://root:root1234@localhost:5432/simple_bank?sslmode=disable" -verbose down 1

sqlc:
	sqlc generate

test:
	# run multiple package under current folder
	go test -v -cover ./...

server:
	go run main.go
	
mock:
	mockgen simplebank/db/sqlc Store -package mockdb -destination db/mock/store.gocc
