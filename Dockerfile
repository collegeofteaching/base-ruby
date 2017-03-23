FROM ruby:2.4-slim

# Install basic packages
RUN apt-get update && apt-get install -y build-essential git postgresql-client libpq-dev sqlite3 libsqlite3-dev

ENV app /app
RUN mkdir $app
WORKDIR $app

CMD bundle exec puma -p 3000 -C config/puma.rb
EXPOSE 3000