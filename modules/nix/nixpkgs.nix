{ lib, ...}:
let
  inherit (lib) mkDefault;
in
{
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
