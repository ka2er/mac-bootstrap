#!/bin/sh

# T2 : sudo
grep tid /etc/pam.d/sudo
if [ $? -eq 0 ]; then
    echo "Sudo already allow T2 password input"
else
    echo "Adding support for T2 for sudo"
    sudo patch -u -b /etc/pam.d/sudo -i patch/pam.d-sudo.patch
fi
