# HOSTNAME=login1.bede.dur.ac.uk
# Bede specific rules. Based on the partial hostname
# blackmass specific rules 
if [[ "$HOSTNAME" == *.bede.dur.ac.uk ]]; then
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

fi  # if hostname == *.bede.dur.ac.uk
