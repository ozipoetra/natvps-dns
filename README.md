# Auto DNS configuration NatVPS
Auto setup and configure dns for natvps
```
bash <(curl -Ls https://github.com/ozipoetra/natvps-dns/raw/main/conf.sh)
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
  # add this to last line
  net.ipv4.ip_default_ttl=64
  net.ipv4.ip_forward=1
  net.ipv6.conf.all.forwarding=1
  net.ipv4.ip_default_ttl=64
  net.core.wmem_max=8388608
  net.core.rmem_max=8388608
  net.core.wmem_default=65536
  net.core.rmem_default=65536
  net.ipv4.tcp_max_orphans=4096
  net.ipv4.tcp_slow_start_after_idle=0
  net.ipv4.tcp_window_scaling=1
  net.ipv4.tcp_sack=0
  net.ipv4.tcp_timestamp=1
  net.ipv4.tcp_reordering=3
  net.ipv4.tcp_fastopen=1
  tcp_max_syn_backlog=1500
  tcp_keepalive_probes=5
  tcp_keepalive_time=1800
  tcp_keepalive_intvl=60
  net.ipv4.tcp_tw_recycle=1
  net.ipv4.tcp_tw_reuse=1
  tcp_fin_timeout=60
  ```
