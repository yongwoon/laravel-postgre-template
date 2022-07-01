up:
	docker compose up -d
build:
	docker compose build --no-cache --force-rm
laravel-install:
	docker compose exec app composer create-project --prefer-dist laravel/laravel=8.6.12 .
create-project:
	mkdir -p backend
	@make build
	@make up
	@make laravel-install
	docker compose exec app php artisan key:generate
	docker compose exec app php artisan storage:link
	docker compose exec app chmod -R 777 storage bootstrap/cache
	@make fresh
fresh:
	docker compose exec app php artisan migrate:fresh --seed
