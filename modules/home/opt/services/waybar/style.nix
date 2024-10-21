{stylix, ...}: {
  programs.waybar.style = ''
    * {
        border: none;
        border-radius: 0px;
        padding: 0;
        margin: 0;
        min-height: 0px;
    }

    #workspaces {
        font-size: 18px;
        padding-left: 15px;

    }
    #workspaces button {
        padding-left:  6px;
        padding-right: 6px;
    }

    #cpu {
        padding-left: 15px;
        padding-right: 9px;
        margin-left: 7px;
    }
    #memory {
        padding-left: 9px;
        padding-right: 9px;
    }
    #disk {
        padding-left: 9px;
        padding-right: 15px;
    }

    #tray {
        padding: 0 20px;
        margin-left: 7px;
    }

    #pulseaudio {
        padding-left: 15px;
        padding-right: 9px;
        margin-left: 7px;
    }
    #network {
        padding-left: 9px;
        padding-right: 15px;
    }

    #clock {
        padding-left: 9px;
        padding-right: 15px;
    }

    #custom-launcher {
        font-size: 20px;
        padding-left: 10px;
        padding-right: 15px;
    }
  '';
}
