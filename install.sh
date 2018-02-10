#!/bin/sh
sudo apt-get --assume-yes update
sudo apt-get --assume-yes install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev screen git nano
cd /usr/local/src/
git clone https://github.com/fireice-uk/xmr-stak-cpu.git
cd xmr-stak-cpu
sudo cmake .
sudo make install
cd bin/
sudo chmod +x xmr-stak-cpu
## change configure file
worker="48n6t7K3WmTRN8LkrjKVrgG6XFZa4JmyJDqj2WcWPN3W8UM3Q2ZLxKR3yM8Q8vJn8RaVWP83DmyntaGb1oCitW5DGk3cnzX.az"$1 
rm config.txt
cd ~
eval "cat <<EOF
$(<template.txt)
EOF
" 2> /usr/local/src/xmr-stak-cpu/bin/config.txt

## set up auto run
cp startRun.sh /etc/profile.d/

