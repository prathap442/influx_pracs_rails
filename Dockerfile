FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler:1.17.3
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
RUN gem install sidekiq
CMD bundle exec sidekiq
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3011 
EXPOSE 9292

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
