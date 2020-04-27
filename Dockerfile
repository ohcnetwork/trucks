FROM ruby:2.7.0

# nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn

RUN gem install rails bundler

# Change to the application's directory
WORKDIR /app

COPY Gemfile Gemfile.lock ./

# We install all the dependencies
RUN bundle check || bundle install

COPY package.json yarn.lock ./

COPY . ./

RUN yarn install --check-files

RUN rails assets:precompile
# Set Rails environment to production
ENV RAILS_ENV production

# We expose the port
EXPOSE 3000
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
