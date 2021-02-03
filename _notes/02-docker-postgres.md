## Install Docker & Postgres

Install Dockeer Desktop

```
  # List all running containers
  docker ps       

  docker ps -a


  # List all images
  docker images        
```    

Run PostgreSQL container
```
  # Pull postgres image, alpine has small size
  docker pull postgres:12-alpine


  # start a container
  ## docker run --name <container_name> -p <p>:<p> -e <env_variable> -d <image>:<tag>
  # default postgres user is "postgres"

  docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root1234 -d postgres:12-alpine


  # Connect to docker 
  ## docker exec -it <continer_name/id> <cmd> [args]           it means interactive session

  docker exec -it postgres12 psql -U root

  docker exec -it postgres12 /bin/sh

  ## View logs 
  docker logs <continer_name/id>


  # Stop container
  docker stop <container_name/id>

  # Start a stopped containeer
  docker start <container_name/id>
```

PostgreSQL command
```
  select now();

  # exit 
  \q


  docker exec -it postgres12 /bin/sh

  createdb --username=root --owner=root simple_bank

  psql simple_bank

  dropdb simple_bank
  exit
```

GUI db client: TablePlus