# TODOs
+ try changig themes on the fly using specialistations + options

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

