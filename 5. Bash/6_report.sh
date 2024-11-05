# Create script, that generates report file with following information:
#
#   current date and time;
#   name of current user;
#   internal IP address and hostname;
#   external IP address;
#   name and version of Linux distribution;
#   system uptime;
#   information about used and free space in / in GB;
#   information about total and free RAM;
#   number and frequency of CPU cores
#

report_file=${1:-/dev/stdout}

current_date=$(date +"%Y-%m-%d %H:%M:%S")
current_user=$(whoami)
internal_ip=$(ifconfig | grep 'inet ' | sed -n '2p' | tr -s ' ' | cut -d' ' -f3)
hostname=$(hostname)
external_ip=$(curl -s ifconfig.me)
distribution=$(cat /etc/*-release | grep "PRETTY_NAME" | cut -d\" -f2)
uptime=$(uptime -p)
disk_space=$(df -h / --block-size G | sed -n '2p' | tr -s ' ' | cut -d' ' -f3,4)
ram=$(free -h | grep Mem | tr -s ' ' | cut -d' ' -f2,4)
cpu_cores=$(lscpu | grep "^CPU(s):" | cut -d: -f2 | xargs)
cpu_frequency=$(lscpu | grep "CPU max MHz" | cut -d: -f2 | xargs)

cat <<EOF > $report_file
Report @ $current_date
User:           $current_user
Hostname:       $hostname
Internal IP:    $internal_ip
External IP:    $external_ip
Linux distro:   $distribution
Uptime:         $uptime
Disk used/free: $disk_space
RAM:            $ram
CPU cores:      $cpu_cores
CPU clock:      $cpu_frequency
EOF

echo "Report has been generated"
[ -n "$1" ] && echo "File: $report_file"
