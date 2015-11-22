FROM ubuntu:trusty

RUN apt-get update &&\
    apt-get install -y git-core subversion build-essential gcc-multilib \
                       libncurses5-dev libreadline-dev libssl-dev zlib1g-dev gawk flex gettext wget unzip python &&\
    apt-get clean &&\
    useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt &&\
    sudo -iu openwrt git clone git://git.openwrt.org/15.05/openwrt.git &&\
    sudo -iu openwrt cp openwrt/feeds.conf.default openwrt/feeds.conf &&\
    sudo -iu openwrt sh -c "echo 'src-git softethervpn https://github.com/el1n/OpenWRT-package-softether.git' >> openwrt/feeds.conf" &&\
    sudo -iu openwrt openwrt/scripts/feeds update
