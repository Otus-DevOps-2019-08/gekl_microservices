FROM python:3.6.0-alpine

WORKDIR /app
ADD . /app



RUN apk add --update alpine-sdk
RUN apk add libffi-dev openssl-dev 
RUN apk --no-cache --update add build-base
#RUN apk add build-base
RUN pip install --upgrade pip
RUN pip install -r /app/requirements.txt

ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts1

CMD ["python3", "post_app.py"]
