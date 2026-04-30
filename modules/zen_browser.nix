{ inputs, config, pkgs, ... }: {
  home.packages = [
    inputs.zen-browser.packages.${pkgs.system}.default
  ];

  # xdg.desktopEntries.zen-browser = {
  #   name = "Zen Browser";
  #   exec = "zen-browser %U";
  #   icon = "zen-browser";
  #   terminal = false;
  #   categories = [ "Network" "WebBrowser" ];
  #   mimeType = [ "text/html" "text/xml" "application/xhtml+xml" "x-scheme-handler/http" "x-scheme-handler/https" ];
  # };
}
