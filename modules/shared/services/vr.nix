{ inputs, ... }:
{
  flake.modules.nixos.vr =
    { pkgs, lib, ... }:
    {
      services.wivrn = {
        enable = true;
        autoStart = true;
        highPriority = true;
        openFirewall = true;
        steam.importOXRRuntimes = true;

        package = pkgs.wivrn.overrideAttrs (old: {
          # version = "42d825883a409f4bd251e6072b549627aa4121cd";
          # src = inputs.wivrn-custom;
          src = lib.fetchFromGithub {
            type = "github";
            owner = "notpeelz";
            repo = "WiVRn";
            ref = "refs/heads/solarxr-patches";
          };
          cmakeFlags = old.cmakeFlags ++ [
            (lib.cmakeBool "WIVRN_FEATURE_SOLARXR" true)
          ];
        });
      };
    };
}
