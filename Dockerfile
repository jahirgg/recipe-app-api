FROM python:3.8-rc-alpine
MAINTAINER Jahir González

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D app_user
USER app_user
