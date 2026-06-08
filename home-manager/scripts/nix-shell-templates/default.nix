{ ... }:
{
  home.file.".local/bin/nix-shell-template" = {
    source = ./nst.sh;
    executable = true;
  };

  home.file.".local/share/nix-shell-template/default.nix" = {
    source = ./template-default.nix;
  };

  home.file.".local/share/nix-shell-template/rust.nix" = {
    source = ./template-rust.nix;
  };

  home.file.".local/share/nix-shell-template/java.nix" = {
    source = ./template-java.nix;
  };

  home.file.".local/share/nix-shell-template/python.nix" = {
    source = ./template-python.nix;
  };

}
