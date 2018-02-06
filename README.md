# Tunnel_GCP

Create SSH Tunnel to my GCP VPS for my DS216J.

Another project is [Tunnel_DS216J](https://gitea.ntut.com.tw/PinLin/tunnel_ds216j)

## Service

+ `SSH`: 

  + From **192.168.168.106:22**
  + To **ntut.com.tw:9488**

+ `Gitea`:

  + From **192.168.168.106:3000**
  + To **ntut.com.tw:10081**

## Install

```sh
git clone https://gitea.ntut.com.tw/PinLin/tunnel_gcp.git ~/tunnel_gcp &&\
cd ~/tunnel_gcp &&\
sudo ln -s $(pwd)/tunnel_gcp.sh /usr/local/etc/rc.d/tunnel_gcp.sh &&\
sudo /usr/local/etc/rc.d/tunnel_gcp.sh start
```
