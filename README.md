# Service Tunnel (running on DS216J)

Upstart service for creating SSH tunnels to my VPS.

[List of Services](SERVICES.md)

## Require

- Python 3

## Install

1. Clone and enter it.
```bash
git clone https://git.ntut.com.tw/PinLin/service_tunnel.git
cd service_tunnel
```

2. Switch branch to ds216j
```bash
git checkout ds216j
```

3. Execute `script/refresh.py`
```bash
sudo python3 script/refresh.py
```
