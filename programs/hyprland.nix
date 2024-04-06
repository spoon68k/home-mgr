{ ... }: {

  wayland.windowManager.hyprland = {

    enable = true;
    settings = {
      "$mod" = "SUPER";

      input = {
        kb_layout = "gb";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
          tap-to-click = true;
        };
      };

      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = "rgba(88888888)";
        "col.inactive_border" = "rgba(00000088)";
        resize_on_border = true;
      };

      decoration = {
        rounding = 16;
        blur = {
          enabled = true;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0.02;
          passes = 3;
          size = 10;
        };
        drop_shadow = true;
        shadow_ignore_window = true;
        shadow_offset = "0 2";
        shadow_range = 20;
        shadow_render_power = 3;
        "col.shadow" = "rgba(00000055)";
      };

      animations = {
        enabled = true;
        animation = [
          "border, 1, 2, default"
          "fade, 1, 4, default"
          "windows, 1, 3, default, popin 80%"
          "workspaces, 1, 2, default, slide"
        ];
      };

      bind = [
        "$mod SHIFT, E, exec, pkill Hyprland"

        "$mod, F, exec, firefox"
        "$mod, Q, exec, alacritty"
        "$mod, R, exec, rofi -show run"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
      
      ] ++ (

        builtins.concatLists (builtins.genList (
          x: let ws = 
               let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
             in [
               "$mod, ${ws}, workspace, ${toString (x+1)}"
               "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x+1)}"
             ]
           ) 10)
      );
    };
  };

}
