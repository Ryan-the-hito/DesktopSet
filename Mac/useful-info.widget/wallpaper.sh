echo Hostname:$'\t'$HOSTNAME
system_profiler SPHardwareDataType | grep "Serial Number (system):" | awk '{print "Serial Number:\t" $4}'
system_profiler SPSoftwareDataType | grep "System Version" | awk '{print "OS Version:\t"  $5 " " $6}'
echo User Name:$'\t'$USER
sysctl -a |grep kern.boottime | awk '{print "Boot Time:\t" $11 " " $12 " " $13}'
system_profiler SPHardwareDataType -detailLevel mini |grep -i "Memory" | awk '{print "Memory:\t" $2 $3}'
df -H / | awk getline $1 | awk '{print "Free Disk:\t" $4 "B"}'
ifconfig | grep -w "inet" | grep -v 127.0.0.1 | awk '{print "IP Address:\t" $2}'
grep ^nameserver /etc/resolv.conf | awk '{print "DNS Server:\t" $2}' | tr '\\n' ' '
networksetup -listallhardwareports | grep -A 1 en0 | grep "Ethernet Address" | awk '{print "Mac Address:\t" $3}'
networksetup -listallhardwareports | grep -A 1 en1 | grep "Ethernet Address" | awk '{print "Mac Address:\t" $3}'
networksetup -listallhardwareports | grep -A 2 Display | grep "Ethernet Address" | awk '{print "Display Mac:\t" $3}'