SHELL := /bin/sh


.PHONY : bump-major bump-minor bump-patch clean create-requirements current-version help install lint unit-test update jupyter run

bump-major: # @HELP Bumps the major version number.
bump-major:
	@poetry run bump2version --allow-dirty major

bump-minor: # @HELP Bumps the minor version number.
bump-minor:
	@poetry run bump2version --allow-dirty minor

bump-patch: # @HELP Bumps the patch version number.
bump-patch:
	@poetry run bump2version --allow-dirty patch

clean: # @HELP Clean shared folder directoy.
clean:
	@rm -rf dist .pytest_cache .coverage coverage.xml
	@find . -name "__pycache__" | xargs rm -rf
	@find . -name ".ipynb_checkpoints" | xargs rm -rf

create-requirements: # @HELP Create/Update pip requirements.txt file
create-requirements:
	@poetry export --without-hashes --format=requirements.txt > app/requirements.txt

current-version: # @HELP Retrieves the current version number.
current-version:
	@poetry run bump2version patch --allow-dirty --dry-run --list | grep current_version | awk -F "=" 'NR==1 { print $$2 }'

install: # @HELP update project dependencies
install:
	@poetry install

lint: # @HELP lint with black format tool
lint:
	@poetry run black .

unit-test: # @HELP tun unit test and report coverage.
unit-test:
	@poetry run pytest

update: # @HELP update project dependencies
update:
	@poetry update
	@make create-requirements

jupyter: # @HELP runs jupyter lab
jupyter:
	@poetry run jupyter-lab

help: # @HELP Prints this message
help:
	@echo "VARIABLES:" && \
	echo "  SHELL = $(SHELL)" && \
	echo " " && \
	echo "TARGETS:" && \
	grep -E '^.*: *# *@HELP' $(MAKEFILE_LIST)    \
	    | awk '                                   \
	        BEGIN {FS = ": *# *@HELP"};           \
	        { printf "  %-30s %s\n", $$1, $$2 };  \
		'
