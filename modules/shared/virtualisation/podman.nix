{ ... }:
let
  module' = {
    virtualisation.podman = {
      enable = true;
    };
    oci-containers.backend = "podman";
  };
in
{
  flake.modules = {
    nixos.base = module';
    nixos.wsl = {pkgs,...}:
    let
      podman' =  pkgs.podman.overrideAttrs (oldAttrs:{
        buildInputs = oldAttrs.buildInputs or [] ++ [pkgs.makeWrapper];
        postInstall = oldAttrs.postInstall or "" + ''
          wrapProgram $out/bin/podman --add-flags "-r"
        '';
      });
    in
    {
      virtualisation.podman.package = podman';
    };
  };
}
