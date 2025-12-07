{ ... }:
{
  programs.git-credential-oauth = {
    enable = true;
  };

  programs.git.settings = {
    credential.helper = [
      "cache --timeout 3600"
      "oauth"
    ];
  };
}
