FROM ruby:2.4.1-slim

# Install basic packages
RUN apt-get update && apt-get install -y apt-utils curl apt-transport-https build-essential git wget

# Add NodeJS Repo
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -

# Add Yarn Repo
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install Our Application Deps
RUN apt-get update && apt-get install -y postgresql-client libpq-dev sqlite3 libsqlite3-dev yarn nodejs fontconfig

# Fetch beta build of Chromedriver and deps
RUN curl https://raw.githubusercontent.com/davidthornton/chromedriver-2.31/master/chromedriver -o /usr/bin/chromedriver && chmod +x /usr/bin/chromedriver
RUN apt-get install -y libglib2.0.0 libnss3 libgconf-2-4

# Add testing apt repo, but prioritise stable
RUN echo "deb http://deb.debian.org/debian sid main non-free contrib" >> /etc/apt/sources.list
RUN echo 'APT::Default-Release "stable";' >> /etc/apt/apt.conf
RUN printf 'Package: *\nPin: release a=stable\nPin-Priority: 700\n\nPackage: *\nPin: release a=unstable\nPin-Priority: 650' >> /etc/apt/preferences

# Install beta build of Chromium
RUN apt-get update && apt-get install -y -t unstable chromium

ENV app /app
RUN mkdir $app
WORKDIR $app

CMD bundle exec puma -p 3000 -C config/puma.rb
EXPOSE 3000
