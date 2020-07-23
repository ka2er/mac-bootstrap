#!/bin/sh

# 1 - none
# 2 - mission control
# 3 - app windows
# 4 - desktop
# 5 - 
# 6 - 
# 7 - 
# 12 - notification center

# mission control - top left
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# application windows - top right
defaults write com.apple.dock wvous-tr-corner -int 3
defaults write com.apple.dock wvous-tr-modifier -int 0
# notification center - bottom right
defaults write com.apple.dock wvous-br-corner -int 12
defaults write com.apple.dock wvous-br-modifier -int 0
# desktop - bottom left
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0

killall Dock

