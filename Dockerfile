from nexus.fc.uralsibbank.ru/ml-platform/base-image:corporate-3.12-api

workdir /app

# copy static/ ./static
copy src/ ./src
copy requirements.txt .

run pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir certifi \
    && rm requirements.txt \
    && cat /etc/ssl/certs/ca-certificates.crt > $(python -m certifi)

expose 8000

cmd ["python", "src/main.py"]
