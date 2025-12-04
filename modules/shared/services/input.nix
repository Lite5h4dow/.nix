{ lib, ... }:
let
  inherit (lib) mkDefault;
  module' = {
    services.libinput = {
      enable = true;
      touchpad = {
        tapping = mkDefault true;
        naturalScrolling = mkDefault true;
        horizontalScrolling = mkDefault true;
        disableWhileTyping = mkDefault true;
        sendEventsMode = mkDefault "disabled-on-external-mouse";
      };
    };
  };
in
{
  flake.modules.nixos.input = module';
}
