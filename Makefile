up:
	cd api && docker compose up -d
build:
	cd api && docker compose up -d --build
down:
	cd api && docker compose down
restart:
	@make up-api
	@make down-api
api-bash:
	cd api && docker compose exec api bash
ps:
	cd api && docker compose ps
api-compare-image:
	cd api && docker compose exec api functions_framework --target=compare_image
api-create-keyhole:
	cd api && docker compose exec api functions_framework --target=create_keyhole
api-create-challenge:
	cd api && docker compose exec api functions_framework --target=create_challenge
