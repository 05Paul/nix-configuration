{ lib, ... }:
rec {
  hexToRGB = hex: 
    let
      hexValue = lib.strings.removePrefix "#" hex;
      fromHex = hexPart: (builtins.fromTOML "n = 0x${hexPart}").n;

      r = fromHex (lib.strings.substring 0 2 hexValue);
      g = fromHex (lib.strings.substring 2 2 hexValue);
      b = fromHex (lib.strings.substring 4 2 hexValue);
    in 
      {
        r = r;
        g = g;
        b = b;
      };

  hexToRGBACall = {
    hex,
    opacity ? 1.0,
  }:
    let
      rgb = hexToRGB hex;
    in
        "rgba(${toString rgb.r}, ${toString rgb.g}, ${toString rgb.b}, ${toString opacity})";
}
