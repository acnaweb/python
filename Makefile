LOCAL_IMAGE := $(shell grep -oP '"local_image":\s*"\K[^"]+'  metadata.json)
JOB_ARGS := $(shell python -c 'import json; f = open("metadata.json"); data = json.load(f); print(" ".join(map(str, data["job_args"])))')

# Local development
install:
	python -m venv venv; \
	. venv/bin/activate; \
	pip install --upgrade pip; \
	pip install pre-commit; \
	pip install -e .[dev]; \
	pre-commit install; \
	git config --bool flake8.strict true; \
	
run:
	@echo "Executando com os seguintes argumentos: $(JOB_ARGS)"
	@python src/app.py $(JOB_ARGS)

run_python:
	docker run -it -v .:/shared/ python:3.12-slim /bin/bash	

docker_build:
	docker build -t ${LOCAL_IMAGE} .

docker_run: docker_build
	if [ ! -f .env ]; then \
		docker run --rm -v .:/shared ${LOCAL_IMAGE} python src/app.py $(JOB_ARGS); \
	else \
		docker run --rm -v .:/shared --env-file .env  ${LOCAL_IMAGE} python src/app.py $(JOB_ARGS); \
	fi

docker_iteractive: docker_build
	if [ ! -f .env ]; then \
		docker run --rm -it -v .:/shared ${LOCAL_IMAGE} /bin/bash; \
	else \
		docker run --rm -it -v .:/shared --env-file .env ${LOCAL_IMAGE} /bin/bash; \
	fi

version:	
	@if [ -n "$$(git status --porcelain)" ]; then \
		echo "Existem alterações pendentes. Faça um commit antes de executar o push."; \
		exit 1; \
	fi
	@if [ "$$(git rev-list --count @{upstream}..HEAD)" -gt 0 ]; then \
		echo "Existem commits locais não enviados. Faça o push."; \
		exit 1; \
	else \
		echo "Digite a versão (exemplo: v0.0.1): "; \
		read TAG; \
		if [ -z "$$TAG" ]; then \
			echo "Erro: A tag não foi informada!"; \
		else \
			echo "Você digitou a tag: $$TAG"; \
			git tag $$TAG && \
			git push origin $$TAG && \
			echo "Tag $$TAG criada com sucesso!"; \
		fi; \
	fi	