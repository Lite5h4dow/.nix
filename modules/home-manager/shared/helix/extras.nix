{ ... }:
{
  flake.modules.homeManager.dev-extras = {
    home.packages =
      with pkgs; [
        # language servers
        nil
        zls
        nixd
        ruff
        gopls
        taplo
        hyprls
        lsp-ai
        fortls
        nimlsp
        helm-ls
        openscad-lsp
        terraform-ls
        glsl_analyzer
        rust-analyzer
        markdown-oxide
        omnisharp-roslyn
        lua-language-server
        yaml-language-server
        bash-language-server
        svelte-language-server
        dockerfile-language-server
        typescript-language-server
        vscode-langservers-extracted
        docker-compose-language-service

        # debuggers
        lldb
        delve
      ];
  };
}
