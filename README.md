# Auto DNS configuration NatVPS
Auto setup and configure dns for natvps
```
curl https://github.com/ozipoetra/natvps-dns/raw/main/conf.sh | bash
```

## Another useful to optimize natvps connection
* Priority ipv4 over ipv6
  `nano /etc/gai.conf`
  ```
  # add this to last line
  precedence ::ffff:0:0/96  100
  ```
* Adjust ttl packet size to 64 (temporary)
  ```
  sysctl -w net.ipv4.ip_default_ttl=64
  ```
* Optimize sysctl.conf
  `nano /etc/sysctl.conf`
  ```
  net.ipv4.ip_default_ttl=64
  net.ipv4.ip_forward=1
  net.ipv6.conf.all.forwarding=1
  ```
