FROM python:3.9-slim-buster

WORKDIR /code

#COPY requirements.txt .
COPY . .

RUN echo 'nameserver 8.8.8.8' > /etc/resolv.conf && pip install -r requirements.txt
#COPY . .

EXPOSE 5000

CMD ["python", "./server.py"]
