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

  - `backend/.env` ファイルを開けて以下の

  ```bash
  # 変更前
  DB_CONNECTION=mysql
  DB_HOST=127.0.0.1
  DB_PORT=3306
  DB_DATABASE=laravel
  DB_USERNAME=root
  DB_PASSWORD=
  ```

  ```bash
  # 変更後
  DB_CONNECTION=pgsql
  DB_HOST=db
  DB_PORT=5432
  DB_DATABASE=laravel_development
  DB_USERNAME=postgreuser
  DB_PASSWORD=postgrepwd
  ```

  - docker-compose 実行

  ```bash
  docker-compose up
  ```

## Links

- [docker-laravel](https://github.com/ucan-lab/docker-laravel)
- [docker-laravel-postgres-nginx](https://github.com/thayronarrais/docker-laravel-postgres-nginx)
