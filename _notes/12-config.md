# Load config from file & environment variables in Golang with Viper

Why Viper 
- find, load, unmarshal config
- read config from environment variables or flags
- Read config from remote system
- Live watching and write config file


Install Viper
```
  go get github/spf13/viper
```

Create app.env


Create util/config.go



environment variables will overwirte the settings in config file
```
  SERVER_ADDRESS=0.0.0.0:8888 make server
```