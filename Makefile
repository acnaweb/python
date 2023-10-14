# Local development
install:
	python -m venv venv; \
	. venv/bin/activate; \
	pip install -U pip; \
	pip install pre-commit; \
	pip install -e .[dev]; \
	pre-commit install; \
	git config --bool flake8.strict true; \

run:
	echo "run"

# Continuous Integration
typing:
	mypy src

checker: 
	flake8 src

formatter:
	black src

build:
	python install setup.py

tests:
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