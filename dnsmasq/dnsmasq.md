## 路由器轻量化方案
订阅hosts+dnsmasq规则实现去广告与fq，附padavan固件手动教程与一键脚本！

### 规则

1. GFW
>https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsfq
2. 【union.conf】：专门屏蔽一些家族式广告的dnsmasq规则。作为AD hosts的补充。
>https://raw.githubusercontent.com/vokins/yhosts/master/dnsmasq/union.conf
3. 【ip.conf】：屏蔽运营商劫持IP与一些广告IP的dnsmasq规则。
>https://raw.githubusercontent.com/vokins/yhosts/master/dnsmasq/ip.conf
4. 『hosts』：[vokins的专门去国内广告hosts规则](https://github.com/vokins/yhosts)
> - 完整版：https://raw.githubusercontent.com/vokins/yhosts/master/hosts
> - 删减版（PC专用）：https://raw.githubusercontent.com/vokins/yhosts/master/hosts.txt 


## 如何使用？
[hiboy的padavan固件](http://www.right.com.cn/forum/thread-161324-1-1.html)

### 【手动添加】
1.手动添加到【`在 WAN 上行/下行启动后执行`】（在`自定义脚本`里），实现网络连接上时自动更新。也可以直接在命令行里直接运行。
* 自由上网dnsmasq：
>wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsfq -O /etc/storage/dnsmasq/dnsmasq.d/dnsfq.conf;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" /etc/storage/dnsmasq/dnsmasq.d/dnsfq.conf;restart_dhcpd
* 去广告hosts：
>wget --no-check-certificate https://raw.githubusercontent.com/vokins/yhosts/master/hosts -O /etc/storage/dnsmasq/hosts;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" /etc/storage/dnsmasq/hosts;restart_dhcpd

2.手动添加到【`定时任务crontab`】（在 `系统管理`→`服务`→`计划任务 (Crontab) `里），实现每天定时自动更新。
* 自由上网dnsmasq：
>01 00 * * * wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsfq -O /etc/storage/dnsmasq/dnsmasq.d/dnsfq.conf;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" /etc/storage/dnsmasq/dnsmasq.d/dnsfq.conf;restart_dhcpd
* 去广告hosts
>02 00 * * * wget --no-check-certificate https://raw.githubusercontent.com/vokins/yhosts/master/hosts  -O /etc/storage/dnsmasq/hosts;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" /etc/storage/dnsmasq/hosts;restart_dhcpd

## padavan固件脚本
在【`配置扩展环境`】→启用【`网页终端`】→【`打开网页终端`】，进入终端界面后输入路由账号、密码即可开始。直接复制以下的一键命令执行即可。
* 一键运行命令：
>mkdir -p /etc/storage/dnsmasq/dns;wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/sh/setting.sh -O /etc/storage/dnsmasq/dns/setting.sh;sh /etc/storage/dnsmasq/dns/setting.sh
* 一键还原命令：
>sh /etc/storage/dnsmasq/dns/del.sh

