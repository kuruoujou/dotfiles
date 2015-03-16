#Aliases
alias "s"="ssh -Y "
alias "v"="vim"
alias "p"="puppet agent --test --pluginsync"
alias "fusb"="sudo chmod -R a+rwx /dev/bus/usb"
alias "newpass"="openssl rand -base64 32"
alias "chmox"="chmod +x"
alias "torquever"="rpm -q torque | awk '{split($0,a,"-"); split(a[3],b,"."); print a[2]"-"b[1]"."b[2]"."b[3]; }'"
alias "rmkey"="ssh-keygen -f \"/home/kuroshi/.ssh/known_hosts\" -R "
alias "socks"="ssh -f -N -D 1080 fgl.ramblingahoge.net"
alias "runningjobs"="qstat -r | cut -d '.' -f1 | awk 'NR > 5 {printf \"%s \",\$0}'"

#Additional directories to add to path, if they exist.
if [ -d "/usr/site/rcac/scripts/" ]; then
    PATH=$PATH:/usr/site/rcac/scripts
fi

if [ -d "/opt/intel/mic/bin/" ]; then
    PATH=$PATH:/opt/intel/mic/bin
fi

if [ -d "/usr/site/rcac/sbin" ]; then
    PATH=$PATH:/usr/site/rcac/sbin
fi
if [ -d "/home/kuroshi/scripts" ]; then
    PATH=$PATH:/home/kuroshi/scripts
fi
export PATH
