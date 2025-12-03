{
  flake.modules.homeManager.base.programs.git = {
    enable = true;
    settings = {
      user = {
        name = "lamar daughma";
        email = "lite5h4dow+dev@gmail.com";
      };

      credential = {
        # helper = "${pkgs.gitFull}/bin/git-credential-libsecret";
        # credentialStore = "secretservice";
        "https://git.litelot.us".username = "litelotus";
        "https://www.github.com".username = "lite5h4dow+dev@gmail.com";
        "https://github.com".username = "lite5h4dow+dev@gmail.com";
      };

      init = {
        defaultBranch = "main";
      };

      push = {
        autoSetupRemote = true;
      };

      url = {
        # github.com
        "ssh://git@github.com/".insteadOf = "github:";
        "https://github.com/".insteadOf = "github+https:";

        # git.litelot.us
        "ssh://git@git.litelot.us/".insteadOf = "git:";
        "https://git.litelot.us/".insteadOf = "git+https:";
      };
    };
  };
}
