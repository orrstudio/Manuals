# SSHMenu
#### A Bash script to manage your ssh connections that builds a menu (via dialog in terminal) from your ~/.ssh/config file.
## ~/.ssh/config example:
```
Host DOCKER-Server #Optional hosts description could be added like this
HostName 129.188.18.81
Port 22
User ubuntu
IdentityFile ~/.ssh/ssh.key
```

## How to install
### Clone\download this project, go to it's folder and run:
```
sudo cp sshmenu /usr/bin/
```

## How to UNinstall
```
sudo rm /usr/bin/sshmenu
```
