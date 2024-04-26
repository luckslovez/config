# Why
Waiting for the network to be available is a loss of time. You can login
meanwhile and let stuff that needs connection catch up after that.
# How
1. Disable the damn service
```
sudo systemctl disable systemd-networkd-wait-online.service
```
2. Mask it (redirects it to /dev/null so that any dependant `WantedBy` services)
can basically do nothing
```
sudo systemctl mask systemd-networkd-wait-online.service
```
