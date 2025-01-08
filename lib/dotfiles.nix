{ pkgs, root, home, username, promptColour, ... }: 

let

    dotfiles = "${root}/dotfiles";
    
    # A small derivation to:
    #   1. Copy `dotfiles` into $out
    #   2. Perform variable substitution in *.template files
    #   3. Strip `.template` suffix

    templatedDotfiles = pkgs.runCommand "dotfiles-with-substitution" {} ''

        mkdir -p "$out/dotfiles"
        cp -r ${dotfiles}/* "$out/dotfiles"
        chmod -R u+w "$out/dotfiles"

        # For each *.template file:
        for f in $(find "$out/dotfiles" -type f -name '*.template'); do

            # Strip the template name
            n=$(echo $f | sed 's/.template$//')

            # Perform substitutions
            sed -i "s|{{ config.username }}|${username}|g" "$f"
            sed -i "s|{{ config.homeDirectory }}|${home}/${username}|g" "$f"
            sed -i "s|{{ config.promptColour }}|${promptColour}|g" "$f"

            # Remove the old .template file
            mv "$f" "$n"

        done
    '';

in {
    home.file.".config" = {
        source = "${templatedDotfiles}/dotfiles";
        recursive = true;
    };

}
