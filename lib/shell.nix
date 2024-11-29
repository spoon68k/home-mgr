{ ... }:

{
    home.sessionVariables = {
        LANG = "en_GB.UTF-8";
    };

    home.shellAliases = {
        cat    = "bat --paging=never";
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
        ".."   = "cd ..";
    };

}
