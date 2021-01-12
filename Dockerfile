FROM ruby:2.6.5 

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs

RUN mkdir /seadiscovery
WORKDIR /seadiscovery

ADD ./Gemfile /seadiscovery/Gemfile
ADD ./Gemfile.lock /seadiscovery/Gemfile.lock

RUN gem install bundler
RUN bundle install
ADD . /seadiscovery
