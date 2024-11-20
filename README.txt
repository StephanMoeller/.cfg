
TODO:

Setup qmk to have easy workspace switching and move-around-logic



# install git and add the ssh key from github to a location and then create this file:

~/.ssh/config

# add these 3 lines content to the file to allow ssh to always work in hyperland where github_stephanmoeller is the name of the private ssh key to use:

Host *
  AddKeysToAgent yes
  IdentityFile ~/.ssh/github_stephanmoeller


# clone this repo like this:

mkdir ~/.cfg
cd ~/.cfg
git clone (...this repo...)

# create symlinks:
ln -s ~/.cfg/waybar ~/.config/waybar
ln -s ~/.cfg/hypr ~/.config/hypr
ln -s ~/.cfg/alacritty ~/.config/alacritty
ln -s ~/.cfg/nvim ~/.config/nvim
ln -s ~/.cfg/tmux/.tmux.conf ~/.tmux.conf

# update nixos-config/configuration.nix to contain exactly this:
{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      <home-manager/nixos>
      /home/stephan/.cfg/stephan.nix
    ];
}

# run a nixos build:
sudo nix-channel --update
sudo nixos-rebuild switch

# after the first build, future rebuilds can be run by simply running:
nb
