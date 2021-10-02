#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.30.1/g' package/base-files/files/bin/config_generate
# mkdir package/base-files/files/config
# echo 0xDEADBEEF > package/base-files/files/config/google_fu_mode
rm -rf package/lean/smartdns
# git clone -b lede https://github.com/pymumu/luci-app-smartdns.git feeds/luci/applications/luci-app-smartdns
# git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages

sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
# sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default

# Modify default hostname
sed -i 's/OpenWrt/noodles/g' package/base-files/files/bin/config_generate

# Modify default WiFi SSID
sed -i 's/OpenWrt/noodles/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Modify the version number
#sed -i 's/OpenWrt/noodles @ $(date "+%Y.%m.%d") build noodles OpenWrt/g' package/lean/default-settings/files/zzz-default-settings
#sed -i 's/OpenWrt/noodles/g' package/default-settings/files/zzz-default-settings
sed -i 's/SNAPSHOT/noodles @ $(date "+%Y.%m.%d") /g' package/default-settings/files/zzz-default-settings


# Modify default theme
# sed -i 's/luci-theme-bootstrap/luci-theme-noodles/g' feeds/luci/collections/luci/Makefile

# Add kernel build user
[ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_USER="noodles"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_USER=\).*@\1$"noodles"@' .config

# Add kernel build domain
[ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_DOMAIN="HDragon"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_DOMAIN=\).*@\1$"HDragon"@' .config
