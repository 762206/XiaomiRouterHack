
usage () {
    echo "$0 <device>"
    echo "You can check device with <ip link show>"
    echo "In my case, Ethernet was enp5s0 abd WiFi was wlp3s0"
    exit 
}

if [[ $1 = "-h" ]]; then 
    usage 
fi 

if [[ $1 = "-g" ]]; then 
    randmac 
    exit
fi 

if [[ ! -n $1 ]]; then 
    echo "Provide device info !"
    exit
fi 

if [[ $(whoami | grep root ) ]]; then 
    :
else 
    echo "Please come back with sudo "
    exit 
fi 

device=$1 
mac=$(randmac)

sudo ip link set dev $device down 
sudo ip link set dev $device address $mac 
sudo ip link set dev $device up 
echo "Done"