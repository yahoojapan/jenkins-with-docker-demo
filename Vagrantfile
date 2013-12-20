# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
set -x

sudo bash -c 'echo LC_ALL="en_US.UTF-8" >> /etc/default/locale'

wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'

wget -q -O - https://get.docker.io/gpg | sudo apt-key add -
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

sudo apt-get -q update
sudo apt-get -y upgrade

sudo apt-get -y install build-essential wget curl git-core jq

# Install Jenkins
sudo useradd -u 45678 -g 65534 -m -d /var/lib/jenkins -s /bin/bash jenkins
sudo apt-get -y install jenkins

# Install Docker
sudo apt-get -y install lxc-docker
sudo adduser vagrant docker
sudo adduser jenkins docker
sudo service docker restart

# Install jenkins plugins
cat <<EOL | sudo -u jenkins xargs -P 5 -n 1 wget -nv -T 60 -t 3 -P /var/lib/jenkins/plugins
https://updates.jenkins-ci.org/download/plugins/git-client/1.4.6/git-client.hpi
https://updates.jenkins-ci.org/download/plugins/git/2.0/git.hpi
https://updates.jenkins-ci.org/download/plugins/scm-api/0.2/scm-api.hpi
https://updates.jenkins-ci.org/download/plugins/ansicolor/0.3.1/ansicolor.hpi
EOL

# Setup jenkins jobs
sudo -u jenkins cp -R /vagrant/jobs/* /var/lib/jenkins/jobs/

# Restart jenkins service
sudo service jenkins restart

# Build Docker image
sudo docker build -t jenkins-with-docker/nodejs /vagrant
SCRIPT

Vagrant.configure('2') do |config|
  # $ vagrant plugin install --plugin-source https://rubygems.org/ --plugin-prerelease vagrant-vbguest
  config.vbguest.auto_update = true

  config.vm.box = 'saucy64'
  config.vm.box_url = 'http://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-amd64-vagrant-disk1.box'

  config.vm.network :forwarded_port, guest: 8080, host:8888

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '2048', '--natdnsproxy1', 'on']
  end

  config.vm.provision :shell, inline: $script
end
