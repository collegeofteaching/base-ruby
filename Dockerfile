FROM ruby:2.7.4-slim

# Install basic packages
RUN apt-get update && apt-get install -y apt-utils curl apt-transport-https build-essential git wget

# Add NodeJS Repo
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash -

# Install Our Application Deps
RUN apt-get update && apt-get install -y postgresql-client libpq-dev sqlite3 libsqlite3-dev nodejs fontconfig imagemagick cron

ENV app /app
RUN mkdir $app
WORKDIR $app


# Add Node's Corepack for Yarn
RUN corepack enable
RUN yarn set version stable
RUN npm install

RUN gem install bundler:1.15.4
CMD bundle exec puma -p 3000 -C config/puma.rb
EXPOSE 3000
