#!/usr/bin/env bash

set -euxo pipefail

sudo pacman -Syu --noconfirm
# node 15.x
#sudo pacman -S --noconfirm nodejs npm yarn
# node 14.x
sudo pacman -S --noconfirm nodejs-lts-fermium npm yarn
# node 12.x
# sudo pacman -S --noconfirm nodejs-lts-erbium npm yarn

git clone https://github.com/Zettlr/Zettlr.git
cd Zettlr
yarn install --frozen-lockfile
yarn reveal:build

node -v
yarn -v
node node_modules/.bin/electron-forge package --platform=linux --arch=x64
node ./node_modules/.bin/electron-builder --linux zip --x64 --publish "never" --prepackaged out/Zettlr-linux-x64
