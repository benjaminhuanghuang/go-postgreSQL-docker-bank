# Implement transfer money API with a custom params validator
https://www.youtube.com/watch?v=5q_wsashJZA&list=PLy_6D98if3ULEtXtNSY_2qN21VCKgoQAE&index=14&ab_channel=TECHSCHOOL

Transfer money api
```
/api/transfer.go
```

Use transaction
```
  result, err := server.store.TransferTx(ctx, arg)
```

implement validator.Func
```
  var validCurrency validator.Func = func(fieldLevel validator.FieldLevel) bool {

  }
```

register validator
```
	if v, ok := binding.Validator.Engine().(*validator.Validate); ok {
		v.RegisterValidation("currency", validCurrency)
	}
```