FROM ruby:3.2.3-slim

RUN apt-get update -qq \
    && apt-get install -y build-essential bash \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code

# Copy dependencies
COPY code/Gemfile /code/Gemfile
COPY code/Gemfile.lock /code/Gemfile.lock

# Install dependencies
RUN gem install bundler
RUN bundle install

COPY code /code

CMD ["tail", "-f", "/dev/null"]