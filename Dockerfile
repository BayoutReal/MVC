# Use uma imagem base oficial do Python
FROM python:3.9

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie os arquivos requirements.txt para o diretório de trabalho
COPY requirements.txt .

# Instale as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Copie o conteúdo do diretório atual para o diretório de trabalho no contêiner
COPY . .

# Comando para iniciar a aplicação
CMD ["uvicorn", "fastapi_project.main:app", "--host", "0.0.0.0", "--port", "80", "--reload"]
