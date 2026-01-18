{ ... }:
{
  boot.kernelParams = [
    "btusb.enable_autosuspend=0"
  ];
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="2357", ATTR{idProduct}=="0604", TEST=="power/wakeup", ATTR{power/wakeup}="enabled",
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="2357", ATTR{idProduct}=="0604", TEST=="power/control", ATTR{power/control}="on"
  '';
}
