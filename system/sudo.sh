#!/bin/sh

sudo patch -u -b /etc/pam.d/sudo -i patch/pam.d-sudo.patch
