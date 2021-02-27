# Write Golang unit tests for database CRUD with random data

1. For database related UT, we need to setup the db connection in main_test.go

TestMain() funciton is the main entry point of all unit tests inside one golang package

Need import postgres driver
```
  _  github.com/lib/pq 
```
_ tell go formatter don't delete this import


2. DB configration can be loaded from config file
```
const {
  dbDriver = "postgres"
  dbSource = "postgresql://root:root1234@localhost:5432/simple_bank?sslmode=disable"
}

// Load from config
testDB, err = sql.Open(config.DBDriver, config.DBSource)
```


## Test for single file/module
```
  func TestCreateAccount(t *testing.T) {
    //createRandomAccount(t)
  }


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
```

## Generate random data for testing.
```
  util/random.go

  // will be called automatically when the package is first used
    func init() {
    rand.Seed(time.Now().UnixNano())
  }
```

## Create random account for each test.

