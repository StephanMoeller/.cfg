# clone this repo like this:

mkdir ~/.cfg
cd ~/.cfg
git clone (...this repo...)

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
