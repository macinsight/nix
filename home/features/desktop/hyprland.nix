{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.hyprland;
in {
  options.features.desktop.hyprland.enable = mkEnableOption "hyprland config";

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        xwayland = {
          force_zero_scaling = true;
        };

        exec-once = [
          "ashell"
          "hyprpaper"
          "hypridle"
          "wl-paste -p -t text --watch clipman store -P --histpath=\"~/.local/share/clipman-primary.json\""
        ];

        env = [
          "XCURSOR_SIZE,32"
          "WLR_NO_HARDWARE_CURSORS,1"
          "GTK_THEME,Dracula"
        ];

        input = {
          kb_layout = "us";
          kb_variant = "";
          kb_model = "";
          kb_rules = "";
          follow_mouse = 1;

          touchpad = {
            natural_scroll = true;
          };

          sensitivity = 0;
        };

        general = {
          gaps_in = 5;
          gaps_out = 5;
          border_size = 1;
          "col.active_border" = "rgba(9742b5ee) rgba(9742b5ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
          layout = "dwindle";
        };


        windowrule = "opacity 0.8,class:kitty";
        windowrule = "opacity 0.8,class:firefox";

        "$mainMod" = "SUPER";

        bind = [
          "$mainMod, return, exec, kitty"
          "$mainMod, o, exec, thunar"
          "$mainMod, Escape, exec, wlogout -p layer-shell"
          "$mainMod, Space, togglefloating"
          "$mainMod, q, killactive"
          "$mainMod, M, exit"
          "$mainMod, F, fullscreen"
          "$mainMod, D, exec, wofi --show drun --allow-images"
          "$mainMod, J, togglesplit"
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"
        ];

        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
        monitor = "eDP-1, 1920x1080@60, 0x0, 1";

      };
    };
  };
}
