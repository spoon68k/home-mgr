{ settings, homeage, lib, pkgs, stdenv, nix-colors, ... }:

let
  username = settings.username;
  homeDirectory = "/home/${username}";
  workspace = "${homeDirectory}/workspace";
  notebook = "${workspace}/zk";
  configHome = "${homeDirectory}/.config";

  defaultPkgs = with pkgs; [
    any-nix-shell        # zsh support for nix shell
    ansible              # System automation
    bottom               # alternative to htop and ytop ('btm')
    coreutils            # basic gnu binaries
    cowsay               # say hi with cows
    dig                  # dns command line tool
    docker               # container manager
    docker-compose       # container orchestration manager
    dive                 # explore docker layers
    duf                  # disk usage/free utility
    fd                   # faster find for files
    feh                  # image viewer
    git                  # ubiqitious version control system
    glow                 # terminal markdown viewer
    hyperfine            # command line benchmarking tool
    qrencode             # qr-code generator
    killall              # kill processes by name
    kubecm               # kube config manager
    kubectl              # kubernetes control
    kubectx              # tool for switching contexts and namespaces
    kubernetes-helm      # helm
    lnav                 # log file navigator on the terminal
    lsd                  # a better 'ls'
    lynx                 # console based web client
    ncdu                 # disk space info (a better 'du')
    ncurses              # fancy console library
    neofetch             # system info
    ngrok                # secure tunneling to localhost
    nil                  # Nix language services
    nix-index            # locate packages containing certain nixpkgs
    nyancat              # the famous rainbox cat
    most                 # fancy more (or less)
    prettyping           # a nicer 'ping'
    pv                   # pipe progress monitor
    rage                 # encryption tool for secrets management
    ranger               # terminal file explorer
    ripgrep              # fast grep
    rmlint               # file cruft removal tool
    rsync                # file sync tool
    strace               # system trace tool
    tldr                 # summary of a manpage
    tmux                 # terminal multiplexer
    tree                 # display files in a tree
    unzip                # decompression tool
    wget                 # web client
    zip                  # compression tool
    zk                   # zettelkasten tool
  ];

  programs = (map import [
    ./programs/bat.nix
    ./programs/direnv.nix
    ./programs/fzf.nix
    ./programs/gh.nix
    ./programs/git.nix
    ./programs/gitui.nix
    ./programs/htop.nix
    ./programs/jq.nix
    ./programs/k9s.nix
    ./programs/nixneovim.nix
    ./programs/starship.nix
    ./programs/tmux.nix
    ./programs/zoxide.nix
    ./programs/zsh.nix
  ]);

  scripts = [
    (pkgs.writeScriptBin "hb" (builtins.readFile ./scripts/hb))
  ];

in {

  programs.home-manager.enable = true;

  imports = programs;

  colorscheme = nix-colors.colorSchemes.material;

  xdg = {
    inherit configHome;
    enable = true;
  };

  home = {
    inherit username homeDirectory;

    stateVersion = "21.03";
    
    packages = defaultPkgs ++ scripts;

    sessionVariables = {
      DISPLAY = ":0";
      LANG = "en_GB.UTF-8";
      PAGER = "";
      EDITOR = "nvim";
      HOME_MGR = "${workspace}/home-mgr";
      ZK_NOTEBOOK_DIR = notebook;
    };

    shellAliases = {
      du     = "ncdu --color dark -rr -x";
      js     = "jq .";
      l      = "lsd -lah";
      la     = "lsd -lAh";
      ls     = "lsd";
      ll     = "lsd -l";
      more   = "bat";
      k      = "kubectl";
      ping   = "prettyping";
      tree   = "exa -T";
      zz     = "( cd ${notebook} && nvim init.md )";
      ".."   = "cd ..";
    };
  };

  # restart services on change
  systemd.user.startServices = "sd-switch";

  # suppress about home-manager news
  news.display = "silent";

}
