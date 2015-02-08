# Forked from https://github.com/progrium/busybox/tree/e98c5d270ab8554877b2be8e8daa4c0c79c592a8
FROM       scratch
MAINTAINER Josh Padnick <josh@tinysteps.co>

ADD ./rootfs.tar /
ADD ./opkg.conf         /etc/opkg.conf
ADD ./opkg-install      /usr/bin/opkg-install
ADD ./functions.sh      /lib/functions.sh
RUN opkg-cl install http://downloads.openwrt.org/snapshots/trunk/x86_64/generic/packages/base/libgcc_4.8-linaro-1_x86_64.ipk
RUN opkg-cl install http://downloads.openwrt.org/snapshots/trunk/x86_64/generic/packages/base/libc_0.9.33.2-1_x86_64.ipk
RUN opkg-install bash

CMD ["/bin/bash"]
