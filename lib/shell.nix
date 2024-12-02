{ obsidian-landing, ... }:

{
    home.sessionVariables = {
        LANG = "en_GB.UTF-8";
    };

    home.shellAliases = {

        # System 
        du     = "ncdu --color dark -rr -x";
        js     = "jq .";
        more   = "bat";
        ping   = "prettyping";
        tree   = "exa -T";
        c      = "clear";
        fzf    = "fzf --height 50% --preview 'bat --style = numbers --color= always --line-range :500 {}'";
        js     = "jq .";
        ping   = "prettyping";
        tree   = "exa -T";
        vi     = "nvim";
        vif    = "nvim (fzf | str trim)";

        # Obsidian
        notes  = "nvim ~/vaults/notes/${obsidian-landing}"

        # Git
        gc     = "git commit -m";
        gca    = "git commit -a -m";
        gp     = "git push origin HEAD";
        gpu    = "git pull origin";
        gst    = "git status";
        glog   = "git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit";
        gdiff  = "git diff";
        gco    = "git checkout";
        gb     = "git branch";
        gba    = "git branch -a";
        gadd   = "git add";
        ga     = "git add -p";
        gcoall = "git checkout -- .";
        gr     = "git remote";
        gre    = "git reset";

        # K8s
        k      = "kubectl";
        ka     = "kubectl apply -f";
        kg     = "kubectl get";
        kd     = "kubectl describe";
        kdel   = "kubectl delete";
        kl     = "kubectl logs";
        kgpo   = "kubectl get pod";
        kgd    = "kubectl get deployments";
        kc     = "kubectx";
        kns    = "kubens";
        kl     = "kubectl logs -f";
        ke     = "kubectl exec -it";

    };

}
