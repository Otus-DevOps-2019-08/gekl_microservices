#FROM ruby:2.2
#RUN apt-get update -qq && apt-get install -y build-essential
FROM ruby:2.7.0-alpine3.11

RUN apk add --update alpine-sdk 


ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/


RUN gem install bundler \
&& bundle update --bundler \ 
&&  bundle install
ADD . $APP_HOME

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

CMD ["puma"]
