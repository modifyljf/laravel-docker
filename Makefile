.PHONY: start
start: ## Build the development docker image.
	docker compose \
  -f docker-compose.yml \
  --project-name app \
  up \
  -d

.PHONY: stop
stop: ## Build the development docker image.
	docker compose \
  -f docker-compose.yml \
  -v \
  --project-name app \
  down
