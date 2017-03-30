FROM ruby:2.4-slim

# Install basic packages

RUN apt-get update && apt-get install -y build-essential git postgresql-client libpq-dev sqlite3 libsqlite3-dev curl apt-transport-https apt-utils

# Install Yarn Now we have Curl

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y yarn

ENV app /app
RUN mkdir $app
WORKDIR $app

CMD bundle exec puma -p 3000 -C config/puma.rb
EXPOSE 3000
