FROM ruby:3.0.2-slim

RUN apt-get update -qq && apt-get install -y build-essential bash

WORKDIR /code

# Copy dependencies
COPY code/Gemfile /code/Gemfile
COPY code/Gemfile.lock /code/Gemfile.lock

# Install depedencies
RUN gem install bundler -v 2.3.5
RUN bundle _2.3.5_ install

COPY code /code

CMD ["tail", "-f", "/dev/null"]