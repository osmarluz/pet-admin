FROM ruby:2.3-slim

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev imagemagick libmagickwand-dev

ENV INSTALL_PATH /pet-admin

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile ./

ENV BUNDLE_PATH /box

COPY . .
