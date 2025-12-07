{
  flake.modules.homeManager.ui = {pkgs,...}:
  let
    element' = pkgs.symlinkJoin{
      name = "element-desktop";
      paths = [ pkgs.element-desktop ];
      nativeBuildInputs = [ pkgs.makeBinaryWrapper ];
      postBuild = ''
        wrapProgram $out/bin/element-desktop \
        --add-flag "--password-store=gnome-libsecret"
      '';
    };
  in
  {
    programs.element-desktop = {
      enable = true;
    };
  };
}
