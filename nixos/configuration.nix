############################################################################## NIX OS ##############################################################################
{ config, pkgs, ... }:

{
imports = [./hardware-configuration.nix];
####################################################################################################################################################################
# Bootloader

boot.loader.grub.enable = true;
boot.loader.grub.version = 2;
boot.loader.grub.device = "/dev/sda";
####################################################################################################################################################################
# Packages

environment.systemPackages = with pkgs; [
	gcc
	dzen2
	conky
	ghc
	libreoffice
	ranger
	xfce.terminal
	synapse
	wget
	chromium
	#haskellPackages.xmobar
	#haskellPackages.xmonad
	openbox
	openbox-menu
	emacs
	unzip
	unrar
	arandr
	xorg.xrandr
];
####################################################################################################################################################################
# Services

#XServer
services.xserver = {
	# keyboard
	enable = true;
	layout = "de";
	
	# UI
	#windowManager.xmonad.enable = true;
	windowManager.openbox.enable = true;
	windowManager.default = "openbox";
	#windowManager.xmonad.extraPackages = haskellPackages: [haskellPackages.xmonad-contrib];
	windowManager.xmonad.enableContribAndExtras = true;
	desktopManager.xterm.enable = false;
	desktopManager.default = "none";
};
# SQL
services.mysql.package = pkgs.mysql;
services.mysql.enable = true;


####################################################################################################################################################################
# Users

# moritz
users.extraUsers.moritz = {
	isNormalUser = true;
	home = "/home/moritz";
	extraGroups = [ "wheel" "networkmanager"];
};

####################################################################################################################################################################
# Version
system.stateVersion = "15.09";

}
