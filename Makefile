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

DIRECTORIES=$(CONTAINER_ENGINE)

directories:
	@mkdir -p $(CONTAINER_ENGINE)

pull-db: directories ## pull database from registry
	@$(CONTAINER_ENGINE) pull $(DBIMAGE)

database-build: pull-db ## build database image
	@$(CONTAINER_ENGINE) tag $(DBIMAGE) $(DBTAG)

database-up: | database-build ## bring database engine up
	@cd ./$(CONTAINER_ENGINE) && \
	DOCKER_BUILDKIT=1 $(CONTAINER_ENGINE)-compose up -d $(PROJECT)-database

clean:
	$(CONTAINER_ENGINE) rm -f $(DBTAG)

.PHONY: help

help: ## That's me!
	@printf "\033[37m%-30s\033[0m %s\n" "#----------------------------------------------------------------------------------"
	@printf "\033[37m%-30s\033[0m %s\n" "# Makefile targets                          |"
	@printf "\033[37m%-30s\033[0m %s\n" "#----------------------------------------------------------------------------------"
	@printf "\033[37m%-30s\033[0m %s\n" "#-target-----------------------description-----------------------------------------"
	@grep -E '^[a-zA-Z0-9].+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

print-%:
	@echo $* = $($*)