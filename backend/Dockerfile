FROM python:3.9-slim
LABEL authors="BiomedicLJZ"

RUN apt-get update && apt-get install -y procps

WORKDIR /app

COPY requirements.txt  requirements.txt

#Install python3
RUN apt-get update && apt-get install -y python3-pip

#Upgrade pip
RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python3", "app.py"]
