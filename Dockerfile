FROM ruby:3.2.7

RUN apt-get update && \
    apt-get install -y \
    build-essential && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN gem install bundler --version 2.4.16 && bundle install

COPY . .

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
