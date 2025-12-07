{
  flake.modules.nixos.dev-extras = {
    programs.wireshark = {
      enable = true;
      usbmon.enable = true;
    };
  };
}
