#!/bin/bash

chef_binary=/var/lib/gems/1.9.1/bin/chef-solo

if ! test -f "$chef_binary"; then
    export DEBIAN_FRONTEND=noninteractive

    aptitude update &&
    apt-get -o Dpkg::Options::="--force-confnew" \
        --force-yes -fuy dist-upgrade &&

    aptitude install -y ruby1.9.1 ruby1.9.1-dev make &&
    sudo gem1.9.1 install --no-rdoc --no-ri chef --version 0.10.0
fi &&

"$chef_binary" -c solo.rb -j solo.json
