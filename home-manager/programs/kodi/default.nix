{ pkgs, ... }:
{
  programs.kodi = {
    enable = true;
    package = pkgs.kodi.withPackages (exts: [
      exts.inputstream-adaptive
    ]);
  };
}
