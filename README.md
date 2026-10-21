# Docker Images

Custom Docker images built on Alpine Linux.

## Images

### fortune-cow

Playful container based on Alpine 3.24 that prints a random fortune with a cow.

**Usage:**

```
docker run --rm fortune-cow
```

### mariadb

MariaDB server running on Alpine Linux. TCP and remote access are enabled, and data persists in a mounted volume.

**Usage:**

```
docker run --name mariadb -d -p 3306:3306 -v db-data:/var/lib/mysql mariadb
```

**Compose:**

A `compose.yml` is provided in the `mariadb/` directory for running MariaDB with phpMyAdmin:

```
cd mariadb
docker compose up -d
```

- MariaDB: `localhost:3306`
- phpMyAdmin: `localhost:8000` (root / secret)
