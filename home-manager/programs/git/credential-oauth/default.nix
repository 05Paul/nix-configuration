{ ... }:
{
  programs.git-credential-oauth = {
    enable = true;
  };

  programs.git.extraConfig = {
    credential.helper = [
      "cache --timeout 3600"
      "oauth"
    ];
  };
}
