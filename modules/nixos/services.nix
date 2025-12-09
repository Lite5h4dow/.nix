{
  flake.modules.nixos = {
    base = {
      services = {
        gnome.gnome-keyring.enable = true;
        sshd.enable = true;
      };
    };
    extras = {
      services = {
        ollama = {
          enable = true;
          openFirewall = true;
        };
      };
    };
  };
}
