FROM ruby:2.7.0-slim-buster as builder

RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential \
    curl \
    libcurl3-dev \
    cmake \
    gnupg2 \
    pkg-config

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    less \
    libxml2-dev \
    libgssapi-krb5-2 \
    libpq5 \
    libpam-dev \
    libedit-dev \
    libxslt1-dev \
    libpq-dev \
    postgresql-client \
    nodejs \
    yarn

WORKDIR /app
COPY Gemfile Gemfile.lock /app/

RUN bundle config --global frozen 1 \
&& bundle install --without development test -j4 --retry 3 \
&& rm -rf /usr/local/bundle/cache/*.gem \
&& find /usr/local/bundle/gems/ -name "*.c" -delete \
&& find /usr/local/bundle/gems/ -name "*.o" -delete

COPY . /app/
RUN SECRET_KEY_BASE='dummy' RAILS_ENV='production' rails assets:precompile
RUN rm -rf node_modules tmp/* log/*

FROM ruby:2.7.0-slim-buster

RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    libcurl3-dev \
    libxml2-dev \
    libgssapi-krb5-2 \
    libpq5 \
    libpam-dev \
    libedit-dev \
    libxslt1-dev \
    libpq-dev

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=builder /app/ /app/

WORKDIR /app

EXPOSE 3000
