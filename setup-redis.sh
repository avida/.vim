#!/bin/bash
mkdir redis
pushd redis
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make -j4
cd src
sudo cp redis-server /usr/local/bin
sudo cp redis-cli /usr/local/bin
popd
rm -rf redis
