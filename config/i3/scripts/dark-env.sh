#!/usr/bin/env bash

# Keep dark-mode overrides scoped to the i3 session only.
export GTK_THEME=Adwaita:dark
export QT_QPA_PLATFORMTHEME=gtk3

if [ -r /usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc ]; then
    export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
fi
