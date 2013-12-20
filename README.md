# Jenkins with Docker Demo

This repository is demo codes for Jenkins with Docker.

Slide URL: [http://www.slideshare.net/techblogyahoo/jenkins-withdocker-131220](http://www.slideshare.net/techblogyahoo/jenkins-withdocker-131220)

## Requirements

- [Vagrant](http://www.vagrantup.com/)
- [VirtualBox (>= v4.3.4)](https://www.virtualbox.org/)

## How to use

```
% vagrant plugin install --plugin-source https://rubygems.org/ --plugin-prerelease vagrant-vbguest
% git clone https://github.com/ydnjp/jenkins-with-docker-demo.git; cd jenkins-with-docker-demo
% vagrant up
```

1. Open [http://localhost:8888/](http://localhost:8888/) (jenkins service)
2. See job configurations and start jobs

## Copyright

Copyright (c) 2013 Yahoo Japan Corporation. See LICENSE for further details.
