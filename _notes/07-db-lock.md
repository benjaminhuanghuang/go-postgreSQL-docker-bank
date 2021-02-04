# DB transaction lock & How to handle deadlock in Golang
https://www.youtube.com/watch?v=G2aggv_3Bbg&list=PLy_6D98if3ULEtXtNSY_2qN21VCKgoQAE&index=7&ab_channel=TECHSCHOOL




```
-- name: GetAccountForUpdate :one
SELECT * FROM accounts
WHERE id = $1 LIMIT 1
FOR NO KEY UPDATE;

```


Deadlock

https://wiki.postgresql.org/wiki/Lock_Monitoring

```
  SELECT a.datname,
          l.relation::regclass,
          l.transactionid,
          l.mode,
          l.GRANTED,
          a.usename,
          a.query,
          a.query_start,
          age(now(), a.query_start) AS "age",
          a.pid
  FROM pg_stat_activity a
  JOIN pg_locks l ON l.pid = a.pid
  ORDER BY a.query_start;
```

