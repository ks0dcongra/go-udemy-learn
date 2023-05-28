postgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -d postgres:14-alpine

createdb: 
	docker exec -it postgres createdb --username=postgres --owner=postgres simple_bank

dropdb: 
	docker exec -it postgres dropdb go_udemy_learn

sqlc:
	docker run --rm -v "C:\Users\ks0dc\go-udemy-learn:/src" -w /src kjconroy/sqlc generate

migrateup:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose up 1

migratedown:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:9525/simple_bank?sslmode=disable" -verbose down 1

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test