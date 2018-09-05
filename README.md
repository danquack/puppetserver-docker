# Dockerized Puppet
This module was designed to provide the ability to validate and lint test puppet code. Utilizing environment variables and build args, this will allow you to install multiple versions of puppet on a given host, which can be utilized in your CICD pipeline to test your code. By default at buildtime puppet will install version 5.5.6 (the latest at time of creation), unless other wise specified. See examples below for running with Puppet 4.9.4.

## Build
```
docker build --build-arg PUPPET_VERSION=4.9.4 -t puppet-checker:4.9.4 .
```

## Examples
### Validate
```
docker run --rm -v $PWD:/code/ -t puppet-checker:4.9.4 validate
```
### Lint
```
docker run --rm -e OPTIONS='--flag --flag2 --flag3' -v $PWD:/code/ -t puppet-checker:4.9.4 lint
```
### Version
```
docker run --rm -t mock-puppet:latest version
```
