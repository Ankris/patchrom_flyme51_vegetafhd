#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8984576 b38ecf2a42b9fb390178cc1bb1020f84deeb708a 6418432 c731744a782c2d3a6fe65de0678845cb703b9750
fi

if ! applypatch -c EMMC:/dev/recovery:8984576:b38ecf2a42b9fb390178cc1bb1020f84deeb708a; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/bootimg:6418432:c731744a782c2d3a6fe65de0678845cb703b9750 EMMC:/dev/recovery b38ecf2a42b9fb390178cc1bb1020f84deeb708a 8984576 c731744a782c2d3a6fe65de0678845cb703b9750:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
