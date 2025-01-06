# Local development
install:
	python -m venv venv; \
	. venv/bin/activate; \
	pip install --upgrade pip; \
	pip install pre-commit; \
	pip install -e .[interactive]; \
	pre-commit install; \
	git config --bool flake8.strict true; \

formatter:
	black src

# Continuous Integration
typing: formatter
	mypy src

lint:
	flake8  src

test:
	pytest

run:
	python src/main.py

build:
	python install setup.py	