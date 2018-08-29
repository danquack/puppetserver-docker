FROM centos:latest

# Update and install ruby
RUN yum -y update
RUN yum -y install ruby

# Install Puppet Lint
RUN gem install puppet-lint

# Copy over entry script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Make Mounting point
RUN mkdir -p /code
WORKDIR /code

# On run execute script
ENTRYPOINT ["/start.sh"]