{ config, pkgs, lib, ... }: {

  programs.gitui = {
    enable = true;
    theme = '' (
      selected_tab: Reset,
      command_fg: White,
      selection_bug: Blue,
      cmbbar_extra_lines_bg: Blue,
      disabled_fg: DarkGray,
      diff_line_add: Green,
      diff_line_delete: Red,
      diff_file_added: LightGreen,
      diff_file_moved: LightMagenta,
      diff_file_modified: Yellow,
      commit_hash: Magenta,
      commit_time: LightCyan,
      commit_author: Green,
      danger_fg: Red,
      push_gauge_bg: Blue,
      push_gauge_fg: Reset
    )
    '';
  };

}
