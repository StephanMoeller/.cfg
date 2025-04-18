
TODO:

Setup qmk to have easy workspace switching and move-around-logic

# Install programs
- 1password
- chrome
- tmux
- neovim
- discord

# Install alacritty and make it the default terminal

# Install git

- Create an ssh key on your github account and save the private key in: ~/.ssh/github_stephanmoeller
- run: sudo chmod 600 github_stephanmoeller to increase security on the key file
- create file: ~/.ssh/config
and add the following to this file:

Host *
  AddKeysToAgent yes
  IdentityFile ~/.ssh/github_stephanmoeller

Now clone a private repo to test that everything works :)

# Clone .cfg 
- clone repo with git
- Make script file executable: sudo chmod +x ~/.cfg/scripts/start_or_focus_gnome.sh

# Setup shortcuts:
win+d => /home/stephan/.cfg/scripts/start_or_focus_gnome.sh Discord discord
win+t => /home/stephan/.cfg/scripts/start_or_focus_gnome.sh Alacritty alacritty
win+c => /home/stephan/.cfg/scripts/start_or_focus_gnome.sh Chrome google-chrome-stable

# Create symlinks
ln -s ~/.cfg/nvim ~/.config/nvim
ln -s ~/.cfg/tmux ~/.config/tmux
ln -s ~/.cfg/alacritty ~/.config/alacritty

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







# Old stuff from nixos times

mkdir ~/.cfg
cd ~/.cfg
git clone (...this repo...)

# create symlinks:
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
