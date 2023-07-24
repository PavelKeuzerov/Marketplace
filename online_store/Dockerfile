# Make sure it matches the Ruby version in .ruby-version and Gemfile
FROM ruby:3.1.0-alpine

ENV BUNDLER_VERSION=2.0.2


RUN gem install bundler -v 2.0.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries


COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]