FROM ruby:3.2.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . ./app/

EXPOSE 3000

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
