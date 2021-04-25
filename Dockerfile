FROM ruby:2.7.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Install dependencies
RUN apt-get update && \
  apt-get install -y nodejs yarn postgresql-client && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /app
WORKDIR /app
ADD . /app

RUN bundle install
