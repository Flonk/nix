{ pkgs, ... }:

{

  home.packages = with pkgs; [
    # wm / desktop env / rice / guis
    rofi
    maim
    playerctl
    pulseaudio
    blueman
    vlc
    spotify

    # File management
    tree
    fq

    # Document conversion
    imagemagick
    ffmpeg

    # Browser
    google-chrome
    firefox-devedition

    # Terminal
    moreutils
    expect
    mkpasswd

    # Network
    nmap
    httpie
    wireshark

    # Programming General
    jetbrains.idea-ultimate
    cmake
    azure-cli
    azure-functions-core-tools

    # K8s and Virtualization
    kubectl
    krew
    # kind
    kubeseal

    # Infra
    terraform

    # Writing
    obsidian

    # Javascript
    nodejs_23
    zx

    # Python
    python3
    uv

    # lol
    cowsay
    fortune
    toilet

  ];

  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "#2E3440";
          foreground = "#D8DEE9";
        };

        normal = {
          black = "#3B4252";
          red = "#BF616A";
          green = "#A3BE8C";
          yellow = "#EBCB8B";
          blue = "#81A1C1";
          magenta = "#B48EAD";
          cyan = "#88C0D0";
          white = "#E5E9F0";
        };

        bright = {
          black = "#4C566A";
          red = "#BF616A";
          green = "#A3BE8C";
          yellow = "#EBCB8B";
          blue = "#81A1C1";
          magenta = "#B48EAD";
          cyan = "#8FBCBB";
          white = "#ECEFF4";
        };
      };

      font = {
        size = 8;
        normal = {
          family = "MesloLGS NF";
        };
      };

    };
  };

  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [ batman ];
  };

  programs.btop = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;

    icons = "always";
    colors = "always";
    extraOptions = [
      "-l"
      "--color-scale=size"
      "--git-ignore"
      "-I '.git'"
      "--group-directories-first"
      "-a"
      "--git"
      "-o"
      "--no-user"
    ];
  };

  programs.fastfetch = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "rg --files --hidden --glob \"!**/.git/**\"";
  };

  programs.git = {
    enable = true;
    delta.enable = true;
    includes = [
      { path = "./dotfiles/.gitconfig"; }
    ];
  };

  programs.htop = {
    enable = true;
  };

  programs.jq = {
    enable = true;
  };

  programs.jqp = {
    enable = true;
  };

  programs.kubecolor = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.k9s = {
    enable = true;
  };

  programs.micro = {
    enable = true;
  };

  programs.ripgrep = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
  };

  programs.zsh = {
    enable = true;
  };

  home.stateVersion = "24.11";
}
