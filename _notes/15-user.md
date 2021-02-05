# Add users table with unique & foreign key constraints in PostgreSQL

Add user table, one user can have multiple account
```
Table users as U {
  username varchar [pk]
  hashed_password varchar [not null]
  full_name varchar [not null]
  email varchar [unique, not null]
  password_changed_at timestamptz [not null, default: '0001-01-01 00:00:00Z']
  created_at timestamptz [not null, default: `now()`]
}

Table accounts as A {
  id bigserial [pk] // auto-increment
  owner varchar [ref: > U.username, not null]
  balance bigint [not null]
  currency varchar [not null]
  created_at timestamptz [not null, default: `now()`]
  Indexes {
    owner
    (owner, currency)[unique]
  }
}

```

Create a migration file
```
  migrate create -ext sql -dir db/migration -seq add_users
```

Copy sql for user table into thee migration file
```
```

Apply the new migration
```
  make migratedown    # clean the data in accounts table
  
  make migrateup
```