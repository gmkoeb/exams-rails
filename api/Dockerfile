FROM ruby:3.2.2

WORKDIR /app

COPY . /app/

RUN bundle install

EXPOSE 3000

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
