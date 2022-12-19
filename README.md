# Systemd Backdoor
A simple script to automate systemd backdoor

## Mode of use 

```
git clone https://github.com/MatheuZSecurity/systemd-backdoor
cd systemd-backdoor && chmod +x systemd.sh
sudo ./systemd.sh
```

## How to remove it ?

it's important to know how to remove it too

```
rm /etc/systemd/system/persistence.service
systemctl disable persistence.service
systemctl stop persistence
```

![carbon (2)](https://user-images.githubusercontent.com/88067225/206903790-68968774-0a7d-4d66-95f6-a2c8e4f2fb91.png)
