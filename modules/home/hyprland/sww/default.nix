{pkgs, ...}: {
  home.packages = with pkgs; [
    (pkgs.writeShellScriptBin "set-wallpaper" ''
      #perform cleanup and exit
      if ! swww query; then
          swww init
      fi

      swww img -t any --transition-bezier 0.0,0.0,1.0,1.0 --transition-duration .8 --transition-step 255 --transition-fps 60 $1 -o $2
      set_env_bg $2 $1
    '')

    (pkgs.writeShellScriptBin "wallpaper-picker" ''
      folder="$HOME/Pictures/wallpapers"

      output=$(find "$folder" -type f | while read file; do
          # If the file is in a subfolder, display it in the format "subfolder/file"
          if [[ "$file" != "$folder/"* ]]; then
              subfolder="$(dirname "$file" | sed "s|^$folder/||")"
              echo "$subfolder/$(basename "$file")" | sed "s|^$folder/||"
          else
              # Otherwise, just display the filename
              echo "$file" | sed "s|^$folder/||"
          fi
      done)

      wallpaper_location="$folder/$(echo "$output" | wofi --show dmenu)"

      current_monitor=$(hyprctl monitors | grep -B 11 "focused: yes" | head -n 1 | sed -E 's/^Monitor ([^[:space:]]+) \(ID [^)]+\):/\1/')

      hypr=$HOME/.config/hypr

      if [ $# -eq 0 ]; then
        set-wallpaper "$wallpaper_location" "$current_monitor"
      else
        set-wallpaper "$wallpaper_location" $1
      fi
    '')

    (pkgs.writeShellScriptBin "load-wallpapers" ''
      save_location=~/.config/.hypr_cache/temp

      function checkENVDir() {
          if ! test -d "$save_location"; then
              mkdir -p $save_location
          fi
          if ! test -f "$save_location/$1"; then
              touch $save_location/$1
          fi
      }

            all_monitors=$(hyprctl monitors | grep "^Monitor" | cut -d"(" -f1 | cut -d" " -f2-)

            while read -r monitor; do
              checkENVDir $monitor
              wall=$(cat "$save_location/$monitor")
              f="$save_location/$monitor"
              #echo "wall $wall monitor $monitor f $f"

              if [ -s $f ]; then
                #echo "The file contains text"
                set-wallpaper $wall $monitor
              else
                #echo "File is empty"
                wallpaper_random $monitor
              fi
            done <<< "$all_monitors"
    '')

    (pkgs.writeShellScriptBin "set_env_bg" ''
      save_location=~/.config/.hypr_cache/temp

      function checkENVDir() {
          if ! test -d "$save_location"; then
              mkdir -p $save_location
          fi
          if ! test -f "$save_location/$1"; then
              touch $save_location/$1
          fi
      }

              checkENVDir $1
              echo $2 > "$save_location/$1"
    '')

    (pkgs.writeShellScriptBin "wallpaper_random" ''
            save_location=~/.config/.hypr_cache/temp

                  function checkENVDir() {
                      if ! test -d "$save_location"; then
                          mkdir -p $save_location
                      fi
                      if ! test -f "$save_location/$1"; then
                          touch $save_location/$1
                      fi
                  }

              output=$(find "$folder" -type f | while read file; do
          # If the file is in a subfolder, display it in the format "subfolder/file"
          if [[ "$file" != "$folder/"* ]]; then
              subfolder="$(dirname "$file" | sed "s|^$folder/||")"
              echo "$subfolder/$(basename "$file")" | sed "s|^$folder/||"
          else
              # Otherwise, just display the filename
              echo "$file" | sed "s|^$folder/||"
          fi
      done)

      random_line=$(echo "$output" | shuf -n 1)

      wallpaper_location="$folder/$random_line"
      current_monitor=$(hyprctl monitors | grep -B 10 "focused: yes" | head -n 1 | sed -E 's/^Monitor ([^[:space:]]+) \(ID [^)]+\):/\1/')

      hypr=$HOME/.config/hypr

      if [ $# -eq 0 ]; then
        set-wallpaper "$wallpaper_location" "$current_monitor"
      else
        set-wallpaper "$wallpaper_location" $1
      fi
    '')

    swww
  ];
}
#! /bin/sh
# value=`cat entry.txt`
# filecount=$(ls -1 $HOME/wallpapers/s | wc -l)
# filecount=$((filecount-1))
# echo "$value"
# swww img --transition-type grow --transition-duration .4 $HOME/wallpapers/s/${value}.*
# if [ $value -lt $filecount ]
# then
# 	value=$((value+1))
# else
# 	echo "else" && value=0
# fi
# echo "$value" > entry.txt

