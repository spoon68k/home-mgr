{ ... }: {

    programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
        options = [ ];
    };

    home.shellAliases = {
        cdx = "z";
    };

}
