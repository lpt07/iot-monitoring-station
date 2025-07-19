# TODO 1: Dùng image python
FROM python:3.9-slim

# TODO 2: Set working directory
WORKDIR /app

# TODO 3: Copy requirements
COPY requirements.txt .

# TODO 4: Cài thư viện
RUN pip install --no-cache-dir -r requirements.txt

# TODO 5: Copy script vào container
COPY receiver.py .

# TODO 6: Run script với host là "mosquitto"
CMD ["python", "receiver.py", "--host", "mosquitto", "--topic", "iot-monitoring-station"]
