# Nome do ambiente virtual
VENV = .venv

# Caminho para o interpretador Python no ambiente virtual
PYTHON = $(VENV)/bin/python

# Caminho para o pip no ambiente virtual
PIP = $(VENV)/bin/pip

# Nome do módulo principal do projeto
MODULE = fastapi_project.main:app

# Comando padrão para instalar as dependências
install:
	@$(PIP) install -r requirements.txt

# Comando para criar um ambiente virtual
venv:
	@python3 -m venv $(VENV)
	@$(MAKE) install

# Comando para rodar a aplicação
run:
	@$(PYTHON) -m uvicorn $(MODULE) --reload

# Comando para formatar o código
format:
	@$(PYTHON) -m black .

# Comando para linting do código
lint:
	@$(PYTHON) -m flake8 .

# Comando para testes
test:
	@$(PYTHON) -m pytest

# Comando para limpar o ambiente
clean:
	@rm -rf $(VENV)
	@find . -type d -name "__pycache__" -exec rm -r {} +

# Comando para construir o Docker
docker-build:
	@docker-compose build

# Comando para rodar o Docker
docker-up:
	@docker-compose up

# Comando padrão
default: venv

.PHONY: install venv run format lint test clean docker-build docker-up default
