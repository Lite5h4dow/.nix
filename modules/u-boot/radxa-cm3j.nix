{ inputs, ... }:
{
  flake.uboot.radxa-cm3j = inputs.nixpkgs.legacyPackages.aarch64-linux.buildUBoot {
    src = inputs.custom-uboot;
    version = "2025.10";
    BL31 = "${inputs.nixpkgs.legacyPackages.aarch64-linux.armTrustedFirmwareRK3568}/bl31.elf";
    ROCKCHIP_TPL = inputs.nixpkgs.legacyPackages.aarch64-linux.rkbin.TPL_RK3568;
    defconfig = "radxa-cm3j-rpi-cm4-io-rk3568_defconfig";
    extraMeta.platforms = [ "aarch64-linux" ];
    filesToInstall = [
      # "idbloader.img"
      # "u-boot.itb"
      "u-boot-rockchip.bin"
      # "u-boot.img"
    ];

  };
}
