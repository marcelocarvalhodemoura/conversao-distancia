FROM python:3.13.0

# Declara o autor
LABEL authors="marcelocarvalhodemoura"

# A Partir do diretório app
WORKDIR /app

# Copia as dependências a serem instaladas
COPY requirements.txt .

# Instala as dependências
RUN pip install -r requirements.txt

# Copia os arquivos da aplicação
COPY . /app/

# Declara a utilização da porta 5000
EXPOSE 5000

# Executa a aplicação
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
