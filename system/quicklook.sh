#!/bin/sh

exit

# see https://github.com/boochtek/mac_config/blob/master/quicklook.sh

# Preview Markdown files.
brew --cask install qlmarkdown

# Preview plain text files without a file extension (README, CHANGELOG, etc.).
brew --cask install qlstephen

# Preview source code files for various programming languages, with syntax highlighting.
brew --cask install qlcolorcode

# Preview JSON files.
brew --cask install quicklook-json

# Preview CSV files.
brew --cask install quicklook-csv

# Preview diffs.
brew --cask install qlprettypatch

# Preview archives (ZIP, tar, gzip, bzip2, ARJ, LZH, ISO, etc.).
#brew --cask install betterzipql

# Preview SSL/X509 certificate files (CRT, PEM, DER, etc.).
#brew --cask install cert-quicklook

# Reload QuickLook daemon, so new plugins will work.
qlmanage -r

# Enable text selection in QuickLook views.
defaults write com.apple.finder QLEnableTextSelection -bool TRUE
killall Finder
