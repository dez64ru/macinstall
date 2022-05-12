## My MacOS config

# NOTICE
This script not tested yet, if it broke your system - its just your choise

### Install brew and all soft
```
curl -s -L https://raw.githubusercontent.com/Dez64ru/macinstall/main/install.sh | bash
```

### Config ssh
```
mkdir ~/.ssh && nano ~/.ssh/config
```
```
# Comment
Host {?prefix.}github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/path_to_private_key
```
