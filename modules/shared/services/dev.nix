{
  flake.modules.nixos = {
    dev = {
      services = {
        openbao = {
          enable = true;
          settings = {
            ui = false;
            cluster_addr = "http://127.0.0.1:8201";
            api_addr = "https://bao.litelot.us";
            listener.default = {
              type = "unix";
            };
            storage.raft.path = "/var/lib/openbao";
          };
        };
      };
    };
  };
}
