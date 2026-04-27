{ pkgs, ... }: {
  
  programs.git = {
    enable = true;
    settings = {
      user.name = "Austin Bowman";
      user.email = "astrangbow2@gmai.com";
    };
  };
}
