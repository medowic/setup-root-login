# Setup Login via Root (Ubuntu tested)

This script will help you set up the login via the root-user.
Use it on a clean or newly installed system.

It is recommended to use on server machines. The root-user may conflict with the GNOME shell.

### NOTICE:
**The author is not responsible for all your actions after installing the script. Login via the root-user is not recommended due to security reasons. Use the script at your own risk.** 

**If you are looking for an answer to the question** "*How to work from root?*"**, run this command:**
```
sudo su -
```


This script has been tested on these systems:
- Ubuntu Server 23.04

The systems included in this list are fully operational.

We do not know about the support of systems not included in this list. Use at your own risk.

# How to use?
1. Download zip-archive containing open-source of project or use `git clone`:
```
git clone https://github.com/medowic/setup-login-via-root.git
```

2. Find and start `script-lvr.sh`.

2.1. You can start `script-lvr.sh` in two ways:
```
sh script-lvr.sh
```
or:
```
chmod +x script-lvr.sh
./script-lvr.sh
```

3. Reboot your system (optional).
```
sudo reboot
```