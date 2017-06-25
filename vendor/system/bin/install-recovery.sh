#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10156032 60fa01938a67370a8c68f55a4d73a1dae891b8fc 7487488 fa1b0de3d3914849de650a23e8e560c32a846041
fi

if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11120000.msdc0/by-name/recovery:10156032:60fa01938a67370a8c68f55a4d73a1dae891b8fc; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11120000.msdc0/by-name/boot:7487488:fa1b0de3d3914849de650a23e8e560c32a846041 EMMC:/dev/block/platform/mtk-msdc.0/11120000.msdc0/by-name/recovery 60fa01938a67370a8c68f55a4d73a1dae891b8fc 10156032 fa1b0de3d3914849de650a23e8e560c32a846041:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
