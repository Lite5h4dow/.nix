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

        # package = pkgs.wivrn.overrideAttrs (old: rec{
        #   version = "42d825883a409f4bd251e6072b549627aa4121cd";
        #   src = inputs.wivrn-custom;
        #   cmakeFlags = old.cmakeFlags ++ [
        #     # (lib.cmakeBool "WIVRN_FEATURE_SOLARXR" true)
        #   ];

        #   postUnpack = ''
        #     ourMonadoRev="${old.monado.src.rev}"
        #     theirMonadoRev=$(cat ${old.src.out}/monado-rev)
        #     if [ ! "$theirMonadoRev" == "$ourMonadoRev" ]; then
        #       echo "Our Monado source revision doesn't match CMakeLists.txt." >&2
        #       echo "  theirs: $theirMonadoRev" >&2
        #       echo "    ours: $ourMonadoRev" >&2
        #       return 1
        #     fi
        #   '';
        # });
      };
    };
}
