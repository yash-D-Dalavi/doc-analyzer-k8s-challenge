# Stage 1: builder (sirf packages install)
FROM python:3.10-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# Stage 2: runtime (chhota, final image)
FROM python:3.10-slim
WORKDIR /app
COPY --from=builder /install /usr/local
COPY main.py .
RUN useradd -m appuser
USER appuser
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]