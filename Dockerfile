FROM python:3
MAINTAINER Jahir González

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

#RUN apk add --update --no-cache postgresql-client jpeg-dev
#RUN apk add --update --no-cache --virtual .tmp-build-deps \
#  gcc libc-dev linux-headers postgresql-dev musl-dev \
#  python-dev build-base zlib zlib-dev

#RUN pip install --upgrade pip
RUN pip install -r /requirements.txt

#RUN apk del .tmp-build-deps


RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static
RUN adduser app_user
RUN chown -R app_user:app_user /vol/
RUN chmod -R 755 /vol/web
USER app_user
