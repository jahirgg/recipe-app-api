FROM python:3
MAINTAINER Jahir González

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

#RUN apk add --update --no-cache postgresql-client
#RUN apk add --update --no-cache --virtual .tmp-build-deps \
#  gcc libc-dev linux-headers postgresql-dev musl-dev python-dev build-base

#RUN pip install --upgrade pip
RUN pip install -r /requirements.txt

#RUN apk del .tmp-build-deps


RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser app_user
USER app_user
