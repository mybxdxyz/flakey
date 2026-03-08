{ config, pkgs, ... }:

{
  home.username = "nexus";
  home.homeDirectory = "/home/nexus";
  home.packages = with pkgs; [
    git
    nerd-fonts.caskaydia-cove
    fastfetch
    yazi
    unzip
    bat
    kitty
    rofi
    waypaper
    wallust
    waybar
    telegram-desktop
    grim
    hyprshot
  ];
  services.swaync.enable = true;
  home.stateVersion = "25.11";
  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
  programs.bash = {
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec start-hyprland
      fi
    '';
  };

  home.file.".config/hypr".source = .config/hypr;
  home.file.".config/kitty".source = .config/kitty;
  home.file.".config/waybar".source = .config/waybar;
  home.file.".config/fish".source = .config/fish;
  home.file.".config/gtk-4.0".source = .config/gtk-4.0;
  home.file.".config/gtk-3.0".source = .config/gtk-3.0;
  home.file.".config/rofi".source = .config/rofi;
  home.file.".config/swaync".source = .config/swaync;
  home.file.".config/wallust".source = .config/wallust;
  home.file.".config/fastfetch".source = .config/fastfetch;
}
