# How to handle DB errors in Golang correctly


Create /db/query/user.sql

Generage sqlc code
```
  make sqlc   ( sqlc generate )
```
sqlc will create User module in `models.go` and functions in `user.sql.go`, and add functions in `querier.go`


Create `user_test.go` for user.sql.go


Becuase the foreign key in account table, we need fix the `account_test.go`
```
  func createRandomAccount(t *testing.T) Account {
    // to fix the foreign key between user and account
    user := createRandomUser(t)
    arg := CreateAccountParams{
      Owner:    user.Username,
      Balance:  util.RandomMoney(),
      Currency: util.RandomCurrency(),
    }

    ...
```

MockStore doesn't implement the db.Store interface
To fix this, we have to run `make mock` to regenerate the `db/mock/store.go`