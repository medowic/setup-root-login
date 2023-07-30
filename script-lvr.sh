#!/bin/bash
##############################################
tput reset
yesval=yes
noval=no
##############################################
echo "Have you set a password for root?"
echo "[Yes/No]"
##############################################
read doing
##############################################
if [ "${doing,,}" = "$yesval" ] ; then
##############################################
sudo passwd -u root >/dev/null 2>&1 ;
echo "PermitRootLogin yes" | sudo tee -a /etc/ssh/sshd_config >/dev/null 2>&1 ;
sudo systemctl restart sshd >/dev/null 2>&1 ;
echo "Done!" ;
exit 0 ; fi
##############################################
if [ "${doing,,}" = "$noval" ] ; then
##############################################
echo "Set password for root:" ;
sudo passwd root ;
sudo passwd -u root >/dev/null 2>&1 ;
echo "PermitRootLogin yes" | sudo tee -a /etc/ssh/sshd_config >/dev/null 2>&1 ;
sudo systemctl restart sshd >/dev/null 2>&1 ;
echo "Done!" ;
exit 0 ; else
##############################################
echo "Invalid value. Restart script." ;
exit 0 ; fi
##############################################
exit 0