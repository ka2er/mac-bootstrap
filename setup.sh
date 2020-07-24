#!/bin/zsh

# brew
if [ -f /usr/local/bin/brew ]; then
    echo "Brew already installed. Skipping"
else 
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# oh-my-zsh
if [ -d $HOME/.oh-my-zsh ]; then
    echo "Oh-my-zsh already installed. Skipping"
else 
    /bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# powerlevel 10k
if [ -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]; then
    echo "Powerlevel 10k already installed. Skipping"
else 
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# change oh-my-zsh theme
sed -i bak 's#robbyrussell#powerlevel10k/powerlevel10k#' $HOME/.zshrc
echo '# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.' >> $HOME/.zshrc
echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> $HOME/.zshrc
cp dotfiles/.p10k.zsh $HOME/

#
# brew package
for pkg in ykman htop zsh-autosuggestions tree pstree pidof openssh; do
    if brew ls --versions $pkg > /dev/null; then
        # The package is installed
        echo "$pkg already installed. Skipping"
    else
        # The package is not installed
        brew  install $pkg
    fi
done

# elevetate htop perms
sudo chown root:wheel /usr/local/Cellar/htop/*/bin/htop
sudo chmod u+s /usr/local/Cellar/htop/*/bin/htop

# casks
for pkg in spectacle bitwarden macupdater homebrew/cask-fonts/font-meslolg-nerd-font iterm2 notion whatsapp google-chrome fanny github visual-studio-code; do
    if brew cask ls --versions $pkg > /dev/null; then
        # The package is installed
        echo "$pkg already installed. Skipping"
    else
        # The package is not installed
        brew cask install $pkg
    fi
done

# tweak MacOs behaviour

./system/trackpad.sh

./system/hotcorners.sh

./system/safari.sh

./system/finder.sh

./system/mail.sh

./system/iterm2.sh


# T2 : sudo
grep tid /etc/pam.d/sudo
if [ $? -eq 0 ]; then
    echo "Sudo already allow T2 password input"
else
    echo "Adding support for T2 for sudo"
fi

# color vimrc
echo "syntax on" > ~/.vimrc
