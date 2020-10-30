#!/bin/sh

VERSION=1.1.4
URL=https://developers.yubico.com/yubikey-manager-qt/Releases/yubikey-manager-qt-${VERSION}-mac.pkg

curl $URL -o /tmp/ykmnger.pkg
sudo installer -pkg /tmp/ykmnger.pkg -target /
rm /tmp/ykmnger.pkg
