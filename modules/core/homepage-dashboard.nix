{...}:
{
  services.homepage-dashboard = {
    # These options were already present in my configuration.
    enable = true;
    listenPort = 8082;

    # The following options were what I planned to add.

    # https://gethomepage.dev/latest/configs/settings/
    settings = {};

    # https://gethomepage.dev/latest/configs/bookmarks/
    bookmarks = [];

    # https://gethomepage.dev/latest/configs/services/
    services = [];

    # https://gethomepage.dev/latest/configs/service-widgets/
    widgets = [];

    # https://gethomepage.dev/latest/configs/kubernetes/
    kubernetes = { };

    # https://gethomepage.dev/latest/configs/docker/
    docker = { };

    # https://gethomepage.dev/latest/configs/custom-css-js/
    customJS = "";
    customCSS = "";
  };
}
