#/bin/bash
echo "NAT VPS Auto DNS Configure"
echo "============================"
echo ""
echo "Disable resolved dns"
systemctl stop systemd-resolved.service
systemctl disable systemd-resolved.service
echo ""
echo "using plain dns resolv"
rm /etc/resolv.conf
rm /etc/systemd/resolved.conf
rm /etc/resolvconf -rf
rm /etc/network/*/resolved
cat > /etc/resolv.conf <<-END
nameserver 8.8.8.8
nameserver 8.8.4.4
nameserver 2001:4860:4860::8888
nameserver 2001:4860:4860::8844
END
chattr +i /etc/resolv.conf
echo ""
echo "Restarting network service..."
service networking restart
echo "DONE 👍"
