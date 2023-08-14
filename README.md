# Setup Login via Root (Ubuntu and Debian).

This script will help you set up the login via the root-user.
Use it on a clean or newly installed system.

It is recommended to use on server machines. The root-user may conflict with the GNOME shell.

### NOTICE:
**The author is not responsible for all your actions after installing the script. Login via the root-user is not recommended due to security reasons. Use the script at your own risk.** 

**If you are looking for an answer to the question** "*How to work from root?*"**, run this command:**
```
su -
```


This script has been tested on these systems:
- Ubuntu Server 23.04
- Ubuntu Server 22.04
- Debian 12

The systems included in this list are fully operational.

We do not know about the support of systems not included in this list. Use at your own risk.

# How to use?
1. Run this commands (**in turn**):
```
su -
git clone https://github.com/medowic/setup-root-login.git
chmod u+x ./setup-root-login/script.sh
./setup-root-login/script.sh
```
**Please note: the correct script launch is only possible via** `root` **and** `chmod u+x && ./script.sh`

2. Reboot your system (optional).
```
sudo reboot
```

# License

**This project is under the [MIT Licence](https://raw.githubusercontent.com/medowic/setup-root-login/master/LICENSE)**
