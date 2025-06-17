{
  description = "Dotfiles";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";

    dotfiles.url = "github:dmtrjoy/dotfiles";
    dotfiles.flake = false;
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, dotfiles, ... }:
    flake-utils.lib.eachDefaultSystemPassThrough (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        homeConfigurations.dimitri = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            {
              home.username = "dimitri";
              home.homeDirectory = "/home/dimitri";
              home.stateVersion = "24.05";
              home.backupFileExtension = ".backup";

              home.file = {
                ".bashrc".source = "${dotfiles}/.bashrc";
                ".config/nvim/init.vim".source = "${dotfiles}/nvim/init.vim";
                ".config/starship.toml".source = "${dotfiles}/starship.toml";
              };

              home.packages = [
                pkgs.luarocks
                pkgs.ripgrep
              ];

              programs.git.enable = true;
              programs.neovim.enable = true;
              programs.starship.enable = true;
            }
          ];
        };
      });
}
