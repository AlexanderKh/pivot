FROM ruby:2.4-alpine

WORKDIR /usr/src/app
ADD Gemfile /usr/src/app
ADD Gemfile.lock /usr/src/app
ADD . /usr/src/app

RUN apk --update add git && bundle install