FROM ruby:3.0.0

ADD . /Sinatra-Docker
WORKDIR /Sinatra-Docker
RUN bundle install

EXPOSE 80

CMD ["/bin/bash"]