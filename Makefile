# Local development
install:
	python -m venv venv; \
	. venv/bin/activate; \
	pip install -U pip; \
	pip install pre-commit; \
	pip install -e .[dev]; \
	pre-commit install; \
	git config --bool flake8.strict true; \

formatter:
	black src

# Continuous Integration
typing: formatter
	mypy src

lint:
	flake8  src

build:
	python install setup.py

test:
	pytest

# Continuous Deployment/Delivery
coverage:
	echo "run coverage"

deploy_staging:
	echo "deploy staging"

deploy_production:
	echo "deploy production"

smoke_test:
	echo "smoke test"	

run:
	python src/main.py