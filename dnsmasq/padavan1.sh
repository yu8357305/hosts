#!/bin/sh
#�˽ű�ֻ��������ë��padavan�̼�
#�������У� wget --no-check-certificate https://raw.githubusercontent.com/yu8357305/hosts/master/dnsmasq/padavan.sh -O /etc/storage/dnsmasq/padavan.sh;sh /etc/storage/dnsmasq/padavan.sh
echo "��������������������������ʼ�ű���������������������������"
echo " "
echo "������������������д��������Ϣ����������������������"
echo "* ����dnsmasq.conf�������ļ���ָ������ļ�·��"
sed -i '/\/dns\//d' /etc/storage/dnsmasq/dnsmasq.conf
cat >> /etc/storage/dnsmasq/dnsmasq.conf << EOF
addn-hosts=/etc/storage/dnsmasq/dns/hosts
conf-dir=/etc/storage/dnsmasq/dns/conf
conf-file=/etc/storage/dnsmasq/dns/dnsfq
EOF

echo "* ����ʱ����crontabs��д�붨ʱִ������"
#���һ��ִ�нű�
http_username=`nvram get http_username`
sed -i '/\/dns\//d' /etc/storage/cron/crontabs/$http_username
cat >> /etc/storage/cron/crontabs/$http_username << EOF
1 5 * * * sh /etc/storage/dnsmasq/dns/start.sh
EOF

echo "* ���Զ���ű���� WAN ����/����������ִ�С�д�����ʵ����������ʱ�Զ�����dnsmasq"
sed -i '/\/dns\//d' /etc/storage/post_wan_script.sh
cat >> /etc/storage/post_wan_script.sh << EOF
sh /etc/storage/dnsmasq/dns/start.sh
EOF


#�ؽ�dns�ļ���
rm -rf /etc/storage/dnsmasq/dns;mkdir -p /etc/storage/dnsmasq/dns/conf


echo "����������������������start.sh�ű�����������������������"
cat > /etc/storage/dnsmasq/dns/start.sh << EOF
#!/bin/sh
cd /etc/storage/dnsmasq/dns/conf
echo "--- ����dnsmasq����"
wget --no-check-certificate https://raw.githubusercontent.com/yu8357305/hosts/master/dnsmasq/dnsfq -O /etc/storage/dnsmasq/dns/dnsfq;sed -i "1 i\## Download��\$(date "+%Y-%m-%d %H:%M:%S")" /etc/storage/dnsmasq/dns/dnsfq
wget --no-check-certificate https://raw.githubusercontent.com/vokins/yhosts/master/dnsmasq/ip.conf -O ip.conf;sed -i "1 i\## Download��\$(date "+%Y-%m-%d %H:%M:%S")" ip.conf
wget --no-check-certificate https://raw.githubusercontent.com/vokins/yhosts/master/dnsmasq/union.conf -O union.conf;sed -i "1 i\## Download��\$(date "+%Y-%m-%d %H:%M:%S")" union.conf
cd /etc/storage/dnsmasq/dns
echo "--- ����AD hosts����"
wget --no-check-certificate https://raw.githubusercontent.com/vokins/yhosts/master/hosts -O hosts
echo "������������AD hosts�����������E"
echo "����ɾ��AD hosts�ڲ���Ҫ���������ɴ�������hosts�����벻��Ҫ������������dnsmasq����union.conf�������Զ��������white.txt���ؼ��ʣ�һ��һ������"
echo "* �Զ���༭������white.txt��/etc/storage/dnsmasq/dns/white.txt"
touch white.txt
echo "���� ��ȡ�����������б�domain"
cat /etc/storage/dnsmasq/dns/conf/union.conf | sed '/#\|^ *\$/d' | awk -F/ '{print \$2}' | sed  's#^\.##g' > domain;cat white.txt >> domain
echo "���� ��ʼ����AD hosts����"
for abc in \$(cat domain)
do
sed -i "/^## \|^#.*201\|^#url/!{/\$abc/d}" hosts
done
wait
sed -i "1 i\## Download��\$(date "+%Y-%m-%d %H:%M:%S")" hosts
restart_dhcpd
echo "��ɣ�dnsmasq����Ч"
EOF


echo "����������������������del.sh�ű�����������������������"
cat > /etc/storage/dnsmasq/dns/del.sh << EOF
#!/bin/sh 
echo "-- ɾ��dnsmasq.conf���޸�����"
sed -i -e '/\/dns\//d' /etc/storage/dnsmasq/dnsmasq.conf
echo "-- ɾ����ʱ�ű����޸�����"
http_username=`nvram get http_username`
sed -i '/\/dns\//d' /etc/storage/cron/crontabs/$http_username
echo "-- ɾ���Զ���ű���� WAN ����/����������ִ�С����޸�"
sed -i '/\/dns\//d' /etc/storage/post_wan_script.sh
echo "--- ɾ�������ļ���"
rm -rf /etc/storage/dnsmasq/dns
echo "����dnsmasq"
restart_dhcpd
echo " �ѻ�ԭ"
EOF


echo " "
echo "������������������ִ��start.sh�ű����Զ����ع����ļ�����������������������"
sh /etc/storage/dnsmasq/dns/start.sh
echo " "
echo "�������������������������ű���������������������������������"
echo " "
echo "* ���¹���ű���� sh /etc/storage/dnsmasq/dns/start.sh"
echo "* ���軹ԭ��ֻ��������� sh /etc/storage/dnsmasq/dns/del.sh"
