# ==============================================================================
# ⚙️  Variables
# ==============================================================================

COMPOSE_FILE := docker-compose.yml
PROJECT_NAME := app

COMPOSE_CMD  := docker compose -f $(COMPOSE_FILE) --project-name $(PROJECT_NAME)

# ==============================================================================
# 📖  Help
# ==============================================================================

.PHONY: help
help: ## 📖 Show this help message.
	@echo "Usage: make [target]"
	@echo ""
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-18s\033[0m %s\n", $$1, $$2}'

# ==============================================================================
# 🐳  Docker Lifecycle
# ==============================================================================

.PHONY: start
start: ## 🚀 Start all services in the background.
	$(COMPOSE_CMD) up -d

.PHONY: stop
stop: ## 🛑 Stop all services.
	$(COMPOSE_CMD) down

.PHONY: restart
restart: ## 🔄 Restart all services.
	$(COMPOSE_CMD) restart

.PHONY: build
build: ## 🛠️  Build (or rebuild) images and start containers.
	$(COMPOSE_CMD) up --build -d

.PHONY: prune
prune: stop ## 🧹 Stop containers and remove all volumes and orphaned networks.
	$(COMPOSE_CMD) down -v --remove-orphans

# ==============================================================================
# 🪵  Logs & Shell
# ==============================================================================

.PHONY: logs
logs: ## 📜 Follow logs from all services.
	$(COMPOSE_CMD) logs -f

.PHONY: shell
shell: ## 💻 Open a shell inside a container. Usage: make shell s=<service>
	$(COMPOSE_CMD) exec $(s) sh

# Set 'help' as the default when 'make' is run without arguments.
.DEFAULT_GOAL := help
