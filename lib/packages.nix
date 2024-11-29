{ pkgs, root, gui-packages, ... }: let

    defaultPackages = with pkgs; [
        any-nix-shell        # zsh support for nix shell
        atuin                # replacement shell history tool
        bat                  # better cat
        bc                   # calculator
        cachix               # nix binary cache tool
        carapace             # command completion tool 
        coreutils            # basic gnu binaries
        cowsay               # say hi with cows
        devenv               # dev environment utils
        dig                  # dns command line tool
        docker               # container manager
        docker-compose       # container orchestration manager
        delta                # pager for git
        direnv               # load and unload environments dynamically
        dive                 # explore docker layers
        duf                  # disk usage/free utility
        fd                   # faster find for files
        feh                  # image viewer
        fzf                  # fuzzy file finder
        gcc                  # c compiler
        gh                   # github client
        git                  # ubiqitious version control system
        gitui                # interactive git tool
        glow                 # terminal markdown viewer
        gnumake              # gnu make
        htop                 # better top
        hyperfine            # command line benchmarking tool
        jq                   # json query tool
        killall              # kill processes by name
        kubecm               # kube config manager
        kubectl              # kubernetes control
        kubectx              # tool for switching contexts and namespaces
        kubernetes-helm      # helm
        k9s                  # tui for k8s clusters
        lua-language-server  # useful for editing nvim confs
        lazygit              # simplified git
        lnav                 # log navigator on the terminal
        lsd                  # a better 'ls'
        lua                  # lua for nvim
        luarocks             # lua rocks used by nvim plugins
        lynx                 # console based web client
        most                 # fancy more (or less)
        ncdu                 # disk space info (a better 'du')
        ncftp                # FTP client
        ncurses              # fancy console library
        neofetch             # system info
        neovim               # vim with lua
        nil                  # Nix language services
        nix-index            # locate packages containing certain nixpkgs
        nodejs               # node executable
        nyancat              # the famous rainbox cat
        oh-my-posh           # shell fancifier 
        prettyping           # a nicer 'ping'
        pv                   # pipe progress monitor
        qrencode             # qr-code generator
        ranger               # terminal file explorer
        ripgrep              # fast grep
        rmlint               # file cruft removal tool
        rsync                # file sync tool
        strace               # system trace tool
        tldr                 # summary of a manpage
        tmux                 # terminal multiplexer
        tree                 # display files in a tree
        unzip                # decompression tool
        util-linux           # suite of system utilities
        wget                 # web client
        xclip                # clipboard client
        zip                  # compression tool
        zoxide               # enhanced cd tool
    ];

    gfxPackages = with pkgs; [
        firefox              # browser
        kitty                # terminal emulator
        wofi                 # launcher
        pavucontrol          # audio controller
        hyprshot             # screenshot
        hyprpaper            # background manager
    ];

    scripts = [
      (pkgs.writeScriptBin "hb" (builtins.readFile "${root}/scripts/hb"))
    ];

in {

  home.packages = defaultPackages ++ scripts ++ (if gui-packages then gfxPackages else []);

}
