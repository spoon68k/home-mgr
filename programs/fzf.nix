{ ... }: {

    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
        defaultCommand = "fd -I -H --type file --follow";
        defaultOptions = [ "--height 30%" ];
        fileWidgetCommand = "fd -I -H --type file --follow";
        fileWidgetOptions = [ "--previous 'bat -- style=numbers --color=always --line-range :500 {}'" ];
    };

    home.shellAliases = {
        vif = "vi `fzf`";
    };

}
