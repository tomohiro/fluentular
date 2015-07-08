FROM ruby:2.2.2

RUN gem install foreman

RUN mkdir /app
ADD Gemfile /app/Gemfile

WORKDIR /app
RUN bundle install
ADD . /app

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "3000"]
