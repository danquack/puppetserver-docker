FROM centos:latest

# install ruby
RUN yum -y install ruby

# Set Gemsource
RUN gem install bundler
COPY Gemfile /Gemfile

#Set Default if not provided and install bundle
ARG PUPPET_VERSION=5.5.6
ENV ENV_PUPPET_VERSION=$PUPPET_VERSION
RUN bundle install

# Copy over entry script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Make Mounting point
RUN mkdir -p /code
WORKDIR /code

# On run execute script
ENTRYPOINT ["/start.sh"]