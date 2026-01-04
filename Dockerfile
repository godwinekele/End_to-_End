FROM python:3.11-slim

# Install system dependencies needed for MetaTrader5
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY XAUUSDm-break-even.py .

# Run the bot
CMD ["python", "-u", "XAUUSDm-break-even.py"]