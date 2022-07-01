# laravel postgrep template

## Environment

| item       | version |
| ---------- | ------- |
| nginx      | 1.23    |
| php        | 7.4.29  |
| laravel    | v8.6.12 |
| postgresql | 14.3.1  |

## How to init project?

- `.docker/app/Dockerfile` の `RUN /usr/bin/composer install` をコメントする

```bash
# RUN /usr/bin/composer install
```

- Install the latest Laravel project

```bash
make create-project
```

- `.docker/app/Dockerfile` の `RUN /usr/bin/composer install` をコメントアウトする

```bash
RUN /usr/bin/composer install
```

- Test project

```bash
docker-compose up
```

## Links

- [docker-laravel](https://github.com/ucan-lab/docker-laravel)
- [docker-laravel-postgres-nginx](https://github.com/thayronarrais/docker-laravel-postgres-nginx)
