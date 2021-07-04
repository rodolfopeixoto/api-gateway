# syntax=docker/dockerfile:1
FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /savepaws
COPY Gemfile /savepaws/Gemfile
COPY Gemfile.lock /savepaws/Gemfile.lock
RUN bundle install
COPY . /savepaws

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
