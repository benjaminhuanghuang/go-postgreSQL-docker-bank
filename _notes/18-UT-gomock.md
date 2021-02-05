#  How to write stronger unit tests with a custom gomock matcher

Write API unit test for gomock



Implement a custom matcher for equal compare
```
  type eqCreateUserParamsMatcher struct {
    arg      db.CreateUserParams
    password string
  }

```

