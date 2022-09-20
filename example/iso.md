# Создание iso-образов

```
IN_PATH='distr/'
OUT_ISO='/tmp/cd.iso'
mkisofs -f -J $IN_PATH | tee $OUT_ISO | md5sum -b | cut -f1 -d' '
```

```
IN_PATH='distr/'
OUT_ISO='/tmp/cd.iso'
mkisofs -J -b isolinux/isolinux.bin -no-emul-boot -boot-load-size 4 -boot-info-table -c isolinux/boot.cat $IN_PATH | tee $OUT_ISO | md5sum -b | cut -f1 -d' '
```

```
IN_PATH='distr/'
OUT_ISO='/tmp/cd.iso'
mkisofs -J -R -l  -V "MY_DISK_LABEL" -o $OUT_ISO -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table $IN_PATH
```

```
IN_PATH='distr/'
OUT_ISO='/tmp/cd.iso'
EFIBOOT='isolinux/efiboot.img'
env LC_ALL=ru_RU.UTF8 xorrisofs -f -J -joliet-long -c .boot/boot.cat -b .boot/isolinux.bin -no-emul-boot -boot-load-size 4 -boot-info-table -isohybrid-mbr $IN_PATH/isohdpfx.bin -eltorito-alt-boot -V "MY_DISK_LABEL" -o $OUT_ISO -e $EFIBOOT -no-emul-boot -isohybrid-gpt-basdat --boot-catalog-hide -hide-joliet .boot $IN_PATH
```

```
IN_PATH='distr/'
OUT_ISO='/tmp/cd.iso'
genisoimage -v -J -V "MY_DISK_LABEL" -o $OUT_ISO $IN_PATH
```
