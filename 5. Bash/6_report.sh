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
internal_ip=$(ifconfig | grep 'inet ' | sed -n '2p' | cut -d' ' -f2)
hostname=$(hostname)
external_ip=$(curl -s ifconfig.me)
distribution=$(cat /etc/*-release | grep "PRETTY_NAME" | cut -d\" -f2)
uptime=$(uptime -p)
disk_space=$(df -h / | grep -v Filesystem)
ram=$(free -h | grep Mem)
cpu_cores=$(lscpu | grep "CPU(s):" | cut -d: -f2 | xargs)
cpu_frequency=$(lscpu | grep "CPU MHz" | cut -d: -f2 | xargs)

echo "Report" > $report_file
echo "Date: $current_date" >> $report_file
echo "User: $current_user" >> $report_file
echo "Internal IP: $internal_ip" >> $report_file
echo "Hostname: $hostname" >> $report_file
echo "External IP: $external_ip" >> $report_file
echo "Linux distribution: $distribution" >> $report_file
echo "Uptime: $uptime" >> $report_file
echo "Disk space: $disk_space" >> $report_file
echo "RAM: $ram" >> $report_file
echo "CPU cores: $cpu_cores" >> $report_file
echo "CPU frequency: $cpu_frequency" >> $report_file

echo "Report has been generated"
[ -n "$1" ] && echo "File: $report_file"