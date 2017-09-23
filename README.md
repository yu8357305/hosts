<新常态>：9.19号封锁升级，YouTube、Facebook已经被加入特殊照顾名单，待遇与`*.twitter.com`相同。若使用官方IP（ipv4）经过防火墙时一旦探测到相关域名的CA证书，对应IP通信百分之百被拦截切断。若使用sni服务器IP反代部分域名也会被拦截，但并不是全部IP都会被拦截，能用的IP很少。拦截只针对经过出口路由上。不远将来全面部署CA证书拦截等技术，到时候hosts将成为历史！！

提醒：小小的hosts圈也是各路牛鬼蛇神都有，很快就有人搞出什么付费hosts来借机敛财，各位千万别上当购买。想想也是多可笑，这些人的hosts数据其实都是来自github开源项目。

由于个人IP库可用IP已剩很少，加上防火墙封锁技术升级，未来可能暂停sy618 hosts项目维护！建议自备代理，不要依赖于hosts来上网。后会有期！！

## hosts/dnsmasq订阅方案
- [hosts订阅推荐方案](https://github.com/sy618/hosts/blob/master/md/hosts%E8%AE%A2%E9%98%85%E6%96%B9%E6%A1%88.md)
- [路由器方案：hosts+dnsmasq规则、padavan脚本](https://github.com/sy618/hosts/blob/master/dnsmasq/dnsmasq.md)
> [安全性问题？建议先看看](https://github.com/sy618/hosts/tree/master/dnsmasq/%E5%AE%89%E5%85%A8%E9%97%AE%E9%A2%98)

## 自动更新hosts/dnsmasq、工具
* [安卓手机定时自动更新hosts，tasker脚本与教程](https://github.com/sy618/hosts/tree/master/%E5%AE%89%E5%8D%93%E8%87%AA%E5%8A%A8%E6%9B%B4%E6%96%B0hosts)
* [路由器自动更新dnsmasq教程与padavan脚本](https://github.com/sy618/hosts/blob/master/dnsmasq/dnsmasq.md)
* [SwitchHosts：PC端更新hosts软件，作者：oldj](https://github.com/oldj/SwitchHosts/blob/master/README.md)，下载：[【github】](https://github.com/oldj/SwitchHosts/releases)、[【网站】](https://oldj.github.io/SwitchHosts)
* [Daedalus：安卓免root使用DNS/hosts/dnsmasq规则软件，项目作者iTXTech ](https://github.com/iTXTech/Daedalus)。下载：[【play商店】](https://play.google.com/store/apps/details?id=org.itxtech.daedalus)、[【github】](https://github.com/iTXTech/Daedalus/releases)

### China AD hosts，by vokins
* 有广告或误杀问题请到以下项目反馈！
* https://github.com/vokins/yhosts/

### 免责与提醒
* 项目大部分域名都是解析到官方IP，但部分功能可能需要依靠sni反向代理（运营商提供的缓存服务器）才能实现，不保证安全性。不喜勿用！
> - 谷歌全家桶
> - play商店下载 `sn-*.gvt1.com`

> - ~~YouTube视频播放 `sn-*.googlevideo.com`~~
> - ~~推特部分域名`*.twitter.com`~~
* 请遵守当地法律法规，文明上网。
* 请勿在中国大陆的社交网络内传播与讨论本项目内容！

### licensed
* [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/deed.zh)
* 本项目所有重定向数据仅用于个人学术研究与学习使用。请勿用于任何商业性盈利活动。
* 不适用人群：强迫症者、被害妄想症者

### other
* [使用内置代理上telegram方法](https://github.com/sy618/hosts/blob/master/md/telegram.md)
* [tg](https://t.me/adfqhosts)

