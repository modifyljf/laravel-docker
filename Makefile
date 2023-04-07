.PHONY: start
start: ## Build the development docker image.
	docker compose \
  -f docker-compose.yml \
  --env-file .env \
  --project-name app \
  up \
  -d

.PHONY: stop
stop: ## Build the development docker image.
	docker compose \
  -f docker-compose.yml \
  -v \
  --env-file .env \
  --project-name app \
  down
