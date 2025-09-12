{ ... }:
{
  programs.git = {
    extraConfig = {
      user.personal = {
        name = "Paul Skamrada";
        email = "pl.skamrada@gmail.com";
      };
    };
  };
}
