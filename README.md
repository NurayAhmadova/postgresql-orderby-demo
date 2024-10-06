# PostgreSQL ORDER BY demo

The key objectives is to demonstrate how to make use of ordered sets using ORDER BY clause in postgresql.

## Technologies Used

- **PostgreSQL**
- **Docker**
- **Migrate package**

## Installation

### Step 1:
Run a database in docker:
```bash
docker run -d --name cats -e POSTGRES_USER=postgres -e POSTGRES_DB=cats -e POSTGRES_PASSWORD=postgres -p 5433:5432 postgres
```

### Step 2:
Connect to database using the tool of your choice (I used Goland's database connection feature)

### Step 3:
Run migrations if need be:
```bash
migrate -path ./migrations -database "postgres://username:password@localhost:5432/yourdbname?sslmode=disable" up
```

### Step 4:
Play around with the demo.sql file!
