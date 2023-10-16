FROM ruby:3.0

WORKDIR /usr/src/app

COPY Gemfile ./

RUN gem install jekyll bundler

RUN bundle install

COPY . .

CMD ["bundle", "exec", "jekyll", "build"]
