FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /rails-user-management
COPY . .
RUN gem install bundler -v 2.4.19 && bundle install

EXPOSE 3000

CMD ["rails" ,"server", "-b", "0.0.0.0"]
