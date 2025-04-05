FROM python:3.12-slim

WORKDIR /opt/app

COPY src src
COPY requirements.txt .
COPY setup.py .

RUN pip install --no-cache-dir -e .

CMD ["python", "src/app.py"]