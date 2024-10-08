{ config, pkgs, nix-colors, ... }:

let username = builtins.getEnv "USER";
    homeDirectory = builtins.getEnv "HOME";
    settings = builtins.fromJSON (builtins.readFile "${homeDirectory}/.config/hm/settings.json");
    notebook = "${homeDirectory}/workspace/zk";

    defaultPkgs = with pkgs; [
        any-nix-shell        # zsh support for nix shell
        bc                   # calculator
        cachix               # Nix binary cache tool
        coreutils            # basic gnu binaries
        cowsay               # say hi with cows
        devenv               # dev environment utils
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
        lf                   # TUI file manager
        lnav                 # log navigator on the terminal
        lsd                  # a better 'ls'
        lynx                 # console based web client
        ncdu                 # disk space info (a better 'du')
        ncftp                # FTP client
        ncurses              # fancy console library
        neofetch             # system info
        nil                  # Nix language services
        nix-index            # locate packages containing certain nixpkgs
        nyancat              # the famous rainbox cat
        most                 # fancy more (or less)
        prettyping           # a nicer 'ping'
        pv                   # pipe progress monitor
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
        zk                   # zettelkasten tool
    ];

    extraPkgs = pkgs.lib.flatten [
        (if settings.gfxEssentials then [ pkgs.rofi-wayland ] else [])
        (if settings.obsidian then [ pkgs.obsidian ] else [])
    ];

    defaultPrgs = [
        (import ./programs/bat.nix)
        (import ./programs/direnv.nix)
        (import ./programs/fzf.nix)
        (import ./programs/gh.nix)
        (import ./programs/git.nix)
        (import ./programs/gitui.nix)
        (import ./programs/htop.nix)
        (import ./programs/jq.nix)
        (import ./programs/k9s.nix)
        (import ./programs/starship.nix)
        (import ./programs/tmux.nix)
        (import ./programs/zoxide.nix)
        (import ./programs/zsh.nix)
        ((import ./programs/nixneovim.nix) settings.vimColourScheme)
    ];
   
    gfxEssentials = if settings.gfxEssentials then [
        (import ./programs/hyprland.nix)
        (import ./programs/kitty.nix)
        (import ./programs/firefox.nix)
    ] else [];

    scripts = [
        (pkgs.writeScriptBin "hb" (builtins.readFile ./scripts/hb))
    ];

in {

    programs.home-manager.enable = true;

    imports = defaultPrgs ++ gfxEssentials;

    colorscheme = nix-colors.colorSchemes.material;

    xdg = {
        enable = true;
    };

    home = {
        inherit username homeDirectory;
 
        stateVersion = "21.03";
 
        packages = defaultPkgs ++ extraPkgs ++ scripts;
 
        sessionVariables = {
            LANG = "en_GB.UTF-8";
            PAGER = "";
            EDITOR = "nvim";
            ZK_NOTEBOOK_DIR = notebook;
        };
 
        shellAliases = {
            du     = "ncdu --color dark -rr -x";
            hbe    = "( cd ${config.xdg.configHome}/hm && nvim . )";
            js     = "jq .";
            l      = "lsd -lah";
            la     = "lsd -lAh";
            ls     = "lsd";
            ll     = "lsd -l";
            more   = "bat";
            k      = "kubectl";
            ping   = "prettyping";
            tree   = "exa -T";
            zz     = "( cd ${notebook} && nvim initpage.md )";
            ".."   = "cd ..";
        };
    };

    # restart services on change
    systemd.user = {
        startServices = "sd-switch";
        services.mbsync.Unit.After = [ "sops-nix.service" ];
    };

    # suppress about home-manager news
    news.display = "silent";

    sops = {
        age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";

        secrets.git-profile = {
            sopsFile = ./secrets/${settings.gitProfile}-git.conf;
            format = "binary";
            mode = "0600";
            path = "${config.xdg.configHome}/git/profile";
        };
    };
}
