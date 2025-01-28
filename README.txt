
TODO:

Setup qmk to have easy workspace switching and move-around-logic



# install git and add the ssh key from github to a location and then create this file:

~/.ssh/config

Remember to run: sudo chmod 600 github_stephanmoeller to increase security on the key file

# add these 3 lines content to the file to allow ssh to always work in hyperland where github_stephanmoeller is the name of the private ssh key to use:

Host *
  AddKeysToAgent yes
  IdentityFile ~/.ssh/github_stephanmoeller


# clone this repo like this:

mkdir ~/.cfg
cd ~/.cfg
git clone (...this repo...)

# create symlinks:
ln -s ~/.cfg/alacritty ~/.config/alacritty
ln -s ~/.cfg/nvim ~/.config/nvim
ln -s ~/.cfg/tmux ~/.config/tmux
ln -s ~/.cfg/sway ~/.config/sway
ln -s ~/.cfg/waybar ~/.config/waybar
ln -s ~/.cfg/bash/.bashrc ~/.bashrc
ln -s ~/.cfg/bash/.bash_profile ~/.bash_profile
alias ta="tmux new-session -A -s main"
alias e=exit
alias n=nvim

# Install a nerd font:

wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv

# Solid background color in popos/ubuntu
gsettings set org.gnome.desktop.background picture-uri none
gsettings set org.gnome.desktop.background picture-uri-dark none
gsettings set org.gnome.desktop.background primary-color '#000000'
