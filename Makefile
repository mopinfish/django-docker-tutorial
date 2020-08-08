# @see https://qiita.com/nokonoko_1203/items/242367a83c313a5e46bf
start:
	docker-compose -f docker-compose.dev.yml up -d --build
stop:
	docker-compose down -v
migrate:
	# docker-compose exec <service_name> python manage.py migrate --noinput
	docker-compose exec django python manage.py migrate --noinput
ps:
	docker-compose ps
sql:
	docker-compose exec postgres psql --username=django_db_user --dbname=django_db

start-prod:
	docker-compose -f docker-compose.yml up -d --build
migrate-prod:
	docker-compose -f docker-compose.prod.yml exec django python manage.py migrate --noinput
collectstatic-prod:
	docker-compose -f docker-compose.prod.yml exec django python manage.py collectstatic --no-input --clear

push:
	cd app && heroku container:push django_tutorial_django && cd ..
deploy:
	cd app && heroku container:release django_tutorial_django && cd ..