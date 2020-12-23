FROM ubuntu:20.04

RUN apt-get update

RUN apt-get -y install python3.8

RUN apt-get -y install python3-pip

RUN apt-get install -y libgl1-mesa-dev

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y libglib2.0-0

RUN pip3 install pipenv

COPY Pipfile* ./

RUN pipenv install

COPY ./app /app

EXPOSE 8080

CMD ["pipenv", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]