FROM ruby:3.2.2-slim

# Install basic packages
RUN apt-get update && apt-get install -y apt-utils curl apt-transport-https build-essential git wget

# Add NodeJS Repo
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash -

# Install Our Application Deps
RUN apt-get update && apt-get install -y postgresql-client libpq-dev nodejs fontconfig cron

ENV app /app
RUN mkdir $app
WORKDIR $app


# Add Node's Corepack for Yarn
RUN corepack enable
RUN yarn set version stable
RUN npm install

RUN gem install bundler:2.4.18
CMD bundle exec puma -p 3000 -C config/puma.rb
EXPOSE 3000
