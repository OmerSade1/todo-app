FROM python:3.9-slim
LABEL authors="BiomedicLJZ"

RUN apt-get update && apt-get install -y procps

WORKDIR /app

COPY requirements.txt  requirements.txt

# Create a user to run the app not as root
RUN adduser --disabled-password myuser
USER myuser

#create a virtual environment for the app
RUN python3 -m venv venv

#Activate the virtual environment
RUN /bin/bash -c "source venv/bin/activate"

#Install python3
RUN apt-get update && apt-get install -y python3-pip

#Upgrade pip
RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["/bin/bash", "-c", "source venv/bin/activate && python3 app.py"]
