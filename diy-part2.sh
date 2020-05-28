#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: KingYan P3TERX
# Build 2020-05-27 15:47
#============================================================

# 替换默认IP
sed -i 's/192.168.1.1/192.168.1.3/g' package/base-files/files/bin/config_generate

# 删除APP
sed -i 's/filetransfer luci-app-vsftpd/bridge/g' include/target.mk
sed -i 's/-app-pptp-server luci-/-/g' include/target.mk
sed -i 's/-app-nlbwmon luci-/-/g' include/target.mk
sed -i 's/-app-zerotier luci-app-ipsec-vpnd luci-app-pptp-server luci-/-/g' target/linux/x86/Makefile
sed -i 's/-app-qbittorrent luci-/-/g' target/linux/x86/Makefile
sed -i 's/luci-app-zerotier luci-app-xlnetacc/open-vm-tools/g' target/linux/x86/Makefile

# 注释匹配行
sed -i '/samba.lua/ s/^/#/g' package/lean/default-settings/files/zzz-default-settings

# 替换匹配下一行
sed -i '/Include ShadowsocksR Server/{n;s/y if i386||x86_64||arm||aarch64/n/g}' feeds/helloworld/luci-app-ssr-plus/Makefile
