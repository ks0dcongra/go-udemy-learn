postgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -d postgres:14-alpine

createdb: 
	docker exec -it postgres createdb --username=postgres --owner=postgres go_udemy_learn

dropdb: 
	docker exec -it postgres dropdb go_udemy_learn

migrateup:
	migrate -path db/migration -database "postgresql://postgres:Aa123456@localhost:9525/go_udemy_learn?sslmode=disable" -verbose up 1

migratedown:
	migrate -path db/migration -database "postgresql://postgres:Aa123456@localhost:9525/go_udemy_learn?sslmode=disable" -verbose down 1

.PHONY: postgres createdb dropdb migrateup migratedown