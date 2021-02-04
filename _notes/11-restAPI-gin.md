# Implement RESTful HTTP API in Go using Gin

https://www.youtube.com/watch?v=n_Y_YisgqTw&list=PLy_6D98if3ULEtXtNSY_2qN21VCKgoQAE&index=11&ab_channel=TECHSCHOOL

```
  go get -u github.com/gin-gonic/gin
```


```
  const (
    dbDriver      = "postgres"
    dbSource      = "postgresql://root:root1234@localhost:5432/simple_bank?sslmode=disable"
    serverAddress = "0.0.0.0.8080"
  )

  func main() {

    conn, err := sql.Open(dbDriver, dbSource)
    if err != nil {
      log.Fatal("cannot connect to db:", err)
    }

    store := db.NewStore(conn)
    server := api.NewServer(store)

    err = server.Start(serverAddress)
    if err != nil {
      log.Fatal("cannot start server:", err)
    }
  }
```


Makefile
```
  server:
    go run main.go
```