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
for pkg in ykman htop zsh-autosuggestions tree pstree pidof openssh lnav ncdu mas bitwarden-cli; do
    if brew ls --versions $pkg > /dev/null; then
        # The package is installed
        echo "$pkg already installed. Skipping"
    else
        # The package is not installed
        brew install $pkg
    fi
done

# elevetate htop perms
sudo chown root:wheel /usr/local/Cellar/htop/*/bin/htop
sudo chmod u+s /usr/local/Cellar/htop/*/bin/htop

# casks
for pkg in rectangle bitwarden macupdater homebrew/cask-fonts/font-meslo-lg-nerd-font iterm2 notion whatsapp google-chrome fanny github visual-studio-code deskreen; do
    if brew list --cask --versions $pkg > /dev/null; then
        # The package is installed
        echo "$pkg already installed. Skipping"
    else
        # The package is not installed
        brew --cask install $pkg
    fi
done

# tweak MacOs behaviour
for system in `ls system/`; do
	./system/$system
done

# color vimrc
echo "syntax on" > ~/.vimrc
