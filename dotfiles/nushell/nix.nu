# Load the nix env into nushell

bash -c "if [ -f ~/.nix-profile/etc/profile.d/nix.sh ]; then source ~/.nix-profile/etc/profile.d/nix.sh; fi; env"
    | lines
    | parse "{k}={v}"
    | where k not-in ["_", "LAST_EXIT_CODE", "DIRS_POSITION"]
    | filter { |x| ($x.k not-in $env) or $x.v != ($env | get $x.k) }
    | transpose --header-row
    | into record
    | load-env
