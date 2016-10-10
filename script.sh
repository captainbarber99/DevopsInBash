#!/bin/bash
#Author:Divyanshu_Shukla:10/10/2016

sudo apt-get update
sudo apt-get install curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev rbenv -y

echo -ne '\n' | sudo add-apt-repository ppa:git-core/ppa

sudo apt-get update
sudo apt-get install git -y

echo "Installing Puppet"

wget -O - https://raw.githubusercontent.com/petems/puppet-install-shell/master/install_puppet_agent.sh | sudo sh

echo "Installing Docker"

wget -qO- https://get.docker.com/ | sh

echo "Installing Ruby Version 2.2.3"
cd
/usr/bin/git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

/usr/bin/git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

/usr/bin/rbenv install -v 2.2.3
/usr/bin/rbenv global 2.2.3
echo ruby -v
echo "gem: --no-document" > ~/.gemrc
/usr/bin/gem install bundler
/usr/bin/gem install puppet-lint
/usr/bin/rbenv rehash


echo "Installed Ruby Version"
ruby -v
echo "Installed Git Version"
git --version
echo "Installed Docker Version"
docker --version
echo "Installed Puppet Version"
/opt/puppetlabs/bin/puppet --version
echo "Installed Puppet-lint Version"
/usr/local/bin/puppet-lint
