# Dockerized Puppet
This module was designed to provide the ability to validate and lint test puppet code. Utilizing environment variables, this will allow you to install multiple versions of puppet to test your code. By default at runtime puppet will install version 5.5.6, unless other wise specified. See examples below.

## Build
```
docker build -t mock-puppet:latest .
```

## Examples
### Validate
```
docker run --rm -v $PWD:/code/ -t mock-puppet:latest validate
```
### Lint
```
docker run --rm -e PUPPET_VERSION=4.9.4 -e OPTIONS='--flag --flag2 --flag3' -v $PWD:/code/ -t mock-puppet:latest lint
```