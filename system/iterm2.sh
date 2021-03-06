#!/bin/sh

# iterm 2
# http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/

mkdir -p $HOME/.iterm2
cp dotfiles/com.googlecode.iterm2.plist $HOME/.iterm2

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
