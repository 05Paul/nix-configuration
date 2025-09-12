# TODOs
+ use options for desktop environments, making tty configurable
+ make steam-gamescope session configurable, to set which tty it returns to
+ try changig themes on the fly using specialistations + options
+ convert host value into options
+ theme Hyprpanel correctly see [Downloads](~/Downloads/catppuccin_mocha.json)
+ move custom Hyprpanel module to home manager config

## DEs + Gamescope
```nix
desktop-environments.hyprland = {
  enable = true;
  tty = 1;
};

desktop-environments.kde = {
  enable = true;
  sddm = false;
  tty = 2;
};

desktop-environments.steamos = {
  enable = true;
  tty = 3;
  exit-to-tty = 1;
};
```

## Themes

