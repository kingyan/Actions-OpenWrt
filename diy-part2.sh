  
#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 替换默认IP
sed -i 's/192.168.1.1/192.168.1.3/g' package/base-files/files/bin/config_generate

# 删除APP
sed -i '/luci-app-filetransfer/d' include/target.mk
sed -i 's/nlbwmon/ssr-plus/g' include/target.mk
sed -i 's/luci-app-ipsec-vpnd/open-vm-tools/g' target/linux/x86/Makefile
#sed -i 's/luci-app-unblockmusic luci-app-zerotier luci-app-xlnetacc //g' target/linux/x86/Makefile
sed -i 's/unblockmusic luci-app-zerotier luci-app-xlnetacc/bridge/g' target/linux/x86/Makefile
sed -i '/luci-app-airplay2/d' target/linux/x86/Makefile

# 注释匹配行
sed -i '/samba.lua/ s/^/#/g' package/lean/default-settings/files/zzz-default-settings

# 替换匹配下一行
sed -i '/Include ShadowsocksR Server/{n;s/y if i386||x86_64||arm||aarch64/n/g}' feeds/helloworld/luci-app-ssr-plus/Makefile
