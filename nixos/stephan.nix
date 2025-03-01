# Edit this configuration file to define what should be installed on # your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

# run this command first:
# sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
# sudo nix-channel --update nixos-unstable

#eval $(ssh-agent)
#ssh-add ...
#test again

{ config, lib, pkgs, ... }:

let
imports =
    [ # Include the results of the hardware scan.
      <home-manager/nixos>
    ];
  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz";
    sha256 = "sha256-hash-of-the-tarball";
  };
  unstable = import <nixos-unstable>  { config = { allowUnfree = true; }; };
  in
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "stephan-privat"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_DK.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "dk";
  services.xserver.xkb.variant = "";

  # services.displayManager.sddm.enable = true; 
  # services.desktopManager.plasma6.enable = true; 

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # bluetooth - from: https://nixos.wiki/wiki/Bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # enable automount usb in hyperland - https://discourse.nixos.org/t/how-to-automatically-mount-external-hard-drive/15563
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.stephan = {
    isNormalUser = true;
    description = "stephan";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "stephan";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget

     grim # screenshot app
     slurp
     wl-clipboard

     showmethekey
     input-remapper
     google-chrome
     discord
     spotify
     git
     qmk
     tmux
     pavucontrol
     prusa-slicer
     lazygit
     sshpass
     keychain
     fuzzel
     jumpapp
     fzf
     waybar
     #jetbrains.rider
     #jetbrains.rust-rover
     gnumake
     go
     toybox #to provide pgrep
     rustc
     cargo
     jetbrains.goland
     alacritty
# chatgpt told me to add those: https://chatgpt.com/c/358f8650-7df3-4c60-920c-409912acee4a
     wmctrl
     xdotool
     xbindkeys
     docker
     inetutils
     dotnetCorePackages.sdk_8_0_3xx
     unstable.dotnetCorePackages.sdk_9_0
     unstable.dotnetCorePackages.sdk_8_0_3xx
     unstable.neovim # required by nvim kickstart
     unstable.zig
     unstable.zls
     unstable.csharp-ls
     unstable.gopls
     kicad
     unzip # required by nvim kickstart
     ripgrep # required by nvim kickstart
     gcc # required by nvim kickstart
     gparted
     ncdu
     lua-language-server
     vscode
     vimPlugins.vim-tmux-navigator

     blueman #bluetooth manager
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

# Enable the unfree 1Password packages
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "1password-gui"
    "1password"
  ];
  # Alternatively, you could also just allow all unfree packages
  # nixpkgs.config.allowUnfree = true;

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    # Certain features, including CLI integration and system authentication support,
    # require enabling PolKit integration on some desktop environments (e.g. Plasma).
    polkitPolicyOwners = [ "yourUsernameHere" ];
  };

  # kitty is the terminal used by hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  #home manager configs
  users.users.eve.isNormalUser = true;
  home-manager.users.eve = { pkgs, ... }: {
    home.packages = [ pkgs.atool pkgs.httpie ];
    programs.bash.enable = true;

  # The state version is required and should stay at the version you
  # originally installed.
    home.stateVersion = "24.05";
  };

  #docker from https://nixos.wiki/wiki/Docker
  virtualisation.docker.enable = true;

  programs.bash.shellAliases = {
    lg = "lazygit";
    nb = "sudo nix-channel --update\nsudo nixos-rebuild switch";
    cf = "git --git-dir=$HOME/dotfiles/ --work-tree=$HOME";
    rswap = "rm ~/.local/state/nvim/swap/*.swp";
    cl = "clear";
    bs = "qmk flash -kb bastardkb/skeletyl -km  rollercole_bodge_version";
    bc = "qmk flash -kb bastardkb/charybdis/3x5 -km rollercole";
    cc = "cd ~/.cfg";
    sn = "cd ~/stendorf-dotfiles/dotfiles/.config/nvim";
    n = "nvim";
    ta = "tmux new-session -A -s main";
    e = "exit";
  };


  # Auto discovery of printers:
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  services.avahi.openFirewall = true;
  
  console.keyMap = "dk-latin1";
}




