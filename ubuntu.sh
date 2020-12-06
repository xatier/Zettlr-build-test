#!/usr/bin/env bash

set -euxo pipefail

cat /etc/lsb-release
TZ=US/Pacific
ln -snf /usr/share/zoneinfo/"$TZ" /etc/localtime && echo "$TZ" > /etc/timezone

apt update
apt install -y build-essential curl git rpm

## install node 15.x
#curl -sL https://deb.nodesource.com/setup_15.x | bash -
#apt-get install -y nodejs

apt install -y npm
npm cache clean -f
npm install -g n
n stable
# 14.15.1 good
# 15.0.0 good
#n 15.0.1 good
#n 15.1.0 good
#n 15.2.0 bad
#n 15.2.1 bad
# n 15.3.0 bad
node -v

# install yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt update
apt-get install yarn

git clone https://github.com/Zettlr/Zettlr.git
cd Zettlr

yarn install --frozen-lockfile
yarn reveal:build
#yarn release:linux-x64
node -v
yarn package:linux-x64
node ./node_modules/.bin/electron-builder --linux zip --x64 --publish "never" --prepackaged out/Zettlr-linux-x64
