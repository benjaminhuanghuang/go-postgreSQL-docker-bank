## Install Docker & Postgres

Install Dockeer Desktop

```
  # List all running containers
  docker ps       


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


  ## View logs 
  docker logs <continer_name/id>
```

PostgreSQL command
```
  select now();

  # exit 
  \q
```

GUI db client: TablePlus