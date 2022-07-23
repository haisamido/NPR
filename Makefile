.DEFAULT_GOAL := help

ENVIRO = test

CONTAINER_ENGINE = docker

export PROJECT   = npr
NPR_LIST         = 7150.2D
PROJECT_VERSION  = latest
PROJECT_NETWORK  = $(PROJECT)-network

DB  = $(PROJECT)
TAG = $(PROJECT)

# Database Configurations
DBTAG     = $(TAG)-database
DBVERSION = 13
DBIMAGE   = docker.io/library/postgres:$(DBVERSION)

export DBHOST     = localhost
export DBUSER     = postgres
export DBPASSWORD = postgres
export PGPASSWORD = $(DBPASSWORD)
export DBPORT     = 5432

directories:
	@mkdir -p $(CONTAINER_ENGINE)

database-pull: ## pull database engine from registry
	@$(CONTAINER_ENGINE) pull $(DBIMAGE)

database-build: database-pull ## build database engine image
	@$(CONTAINER_ENGINE) tag $(DBIMAGE) $(DBTAG)

database-up: | database-build ## bring database engine up
	@cd ./$(CONTAINER_ENGINE) && \
	$(CONTAINER_ENGINE)-compose up -d $(PROJECT)-database

database-down: ## bring database engine down
	@cd ./$(CONTAINER_ENGINE) && \
	$(CONTAINER_ENGINE)-compose down

database-create: database-up ## create project's database schemas
	@sleep 2
	@psql -h $(DBHOST) -U $(DBUSER) -p $(DBPORT) -tc "SELECT 1 FROM pg_database WHERE datname = '$(DB)'" \
		| grep -q 1 || psql -h $(DBHOST) -U $(DBUSER) -p $(DBPORT) -c "CREATE DATABASE $(DB);"

database-drop: database-up ## delete project's database (NON-RECOVERABLE)
	@sleep 3
	@psql -h $(DBHOST) -U $(DBUSER) -p $(DBPORT) -c "DROP DATABASE IF EXISTS $(DB) WITH (FORCE);"

database-configure: | database-drop database-create ## configure project's database
	@psql -h $(DBHOST) -U $(DBUSER) -p $(DBPORT) -d $(DB) < ./NPRs/create_db.sql

database-populate: | database-configure ## populate project's database with global records
	@psql -h $(DBHOST) -U $(DBUSER) -p $(DBPORT) -d $(DB) < ./NPRs/insert_db_records.sql

database-populate-%: ## populate NPR specific database records
	@cd ./NPRs/$* && \
		psql -h $(DBHOST) -U $(DBUSER) -p $(DBPORT) -d $(DB) < $(*)_insert.sql

clean:
	$(CONTAINER_ENGINE) rm -f $(DBTAG) 2> /dev/null; \
	yes | $(CONTAINER_ENGINE) system prune -a

.PHONY: help

help: ## That's me!
	@printf "\033[37m%-30s\033[0m %s\n" "#----------------------------------------------------------------------------------"
	@printf "\033[37m%-30s\033[0m %s\n" "# Makefile targets                          |"
	@printf "\033[37m%-30s\033[0m %s\n" "#----------------------------------------------------------------------------------"
	@printf "\033[37m%-30s\033[0m %s\n" "#-target-----------------------description-----------------------------------------"
	@grep -E '^[a-zA-Z0-9].+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

print-%:
	@echo $* = $($*)