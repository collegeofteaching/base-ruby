FROM ruby:2.4-slim

# Install basic packages
RUN apt-get update && apt-get install -y build-essential git libpq-dev sqlite3 libsqlite3-dev
