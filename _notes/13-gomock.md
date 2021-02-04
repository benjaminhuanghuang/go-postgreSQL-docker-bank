# Mock DB for testing HTTP API in Go and achieve 100% coverage

https://www.youtube.com/watch?v=rL0aeMutoJ0&list=PLy_6D98if3ULEtXtNSY_2qN21VCKgoQAE&index=13&ab_channel=TECHSCHOOL

Why mock db
- isolate tests data
- reduce the time talking to db
- 100% coverage, easy to setup edge cases

How to mock 
- Use fack db (Lot of code and hard to mantain)
- Generate stubs that returns hard-coded values (Gomock)


## Gomock
```
  go get github.com/golang/mock/mockgen@v1.4.4
```

generate mocks
```
  mockgen simplebank/db/sqlc Store -destination db/mock/store.go
```