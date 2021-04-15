FROM python:3.9-slim-buster

WORKDIR /code

#COPY requirements.txt .
COPY . .

RUN echo 'nameserver 8.8.8.8' > /etc/resolv.conf && pip install -r requirements.txt

#COPY . .

EXPOSE 5001/tcp
#CMD ["python", "./paswword_env_store"]

#CMD ["python", "./flask_print.py"]

CMD ["python", "./server.py"]

#CMD ["stdbuf", "-oL", "python", "./xmr_price.py"]