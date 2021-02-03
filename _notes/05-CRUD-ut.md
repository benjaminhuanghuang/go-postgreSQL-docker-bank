# Write Golang unit tests for database CRUD with random data

main_test.go

TestMain() funciton is the main entry point of all unit tests inside one golang package

Need import postgres driver
```
  github.com/lib/pq 
```



```
  func createRandomAccount(t *testing.T) Account {
    arg := CreateAccountParams{
      Owner:    "ben",
      Balance:  100,
      Currency: "USD",
    }

    account, err := testQueries.CreateAccount(context.Background(), arg)
    require.NoError(t, err)
    require.NotEmpty(t, account)

    require.Equal(t, arg.Owner, account.Owner)
    require.Equal(t, arg.Balance, account.Balance)
    require.Equal(t, arg.Currency, account.Currency)

    require.NotZero(t, account.ID)
    require.NotZero(t, account.CreatedAt)
    return account
  }

  func TestCreateAccount(t *testing.T) {
    //createRandomAccount(t)
  }
```