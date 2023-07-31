#!/bin/bash
##############################################
tput reset
yesval=yes
noval=no
##############################################
echo "===================="
echo "Setup Login via Root"
echo "===================="
echo ""
echo "Have you set a password for root?"
echo "[Yes/No]"
##############################################
read doing
##############################################
if [ "${doing,,}" = "$yesval" ] ; then
##############################################
passwd -u root >/dev/null 2>&1 ;
echo "PermitRootLogin yes" | tee -a /etc/ssh/sshd_config >/dev/null 2>&1 ;
systemctl restart sshd >/dev/null 2>&1 ;
echo "Done! Recommend to reboot your machine (optional)." ;
exit 0 ; fi
##############################################
if [ "${doing,,}" = "$noval" ] ; then
##############################################
echo "Set password for root:" ;
passwd root ;
passwd -u root >/dev/null 2>&1 ;
echo "PermitRootLogin yes" | tee -a /etc/ssh/sshd_config >/dev/null 2>&1 ;
systemctl restart sshd >/dev/null 2>&1 ;
echo "Done! Recommend to reboot your machine (optional)." ;
exit 0 ; else
##############################################
echo "Error. Reload script." ;
exit 1 ; fi
##############################################
exit 0