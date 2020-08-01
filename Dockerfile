FROM ruby:2.5.5-slim

RUN mkdir -p /usr/share/man/man7
RUN mkdir -p /usr/share/man/man1


RUN apt-get update -qq && apt-get install -y curl build-essential apt-transport-https ca-certificates postgresql-client
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn git libpq-dev nodejs

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN gem install bundler:2.1.2
ADD Gemfile* $APP_HOME/
RUN bundle install --without=development,test --deployment

RUN ls -alh

ADD . $APP_HOME
RUN yarn install --check-files

RUN RAILS_ENV=production bundle exec rake assets:precompile

CMD ["./bin/run"]
