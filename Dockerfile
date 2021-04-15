FROM python:3.9-slim-buster

WORKDIR /code

#COPY requirements.txt .
COPY . .

RUN echo 'nameserver 8.8.8.8' > /etc/resolv.conf && pip install -r requirements.txt && apt install nodejs

#COPY . .

EXPOSE 5001

CMD ["python", "./server.py"]
