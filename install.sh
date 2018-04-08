#!/bin/bash
sudo apt-get --assume-yes update
sudo apt-get --assume-yes install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev screen git nano
#cd /usr/local/src/
#sudo git clone https://github.com/beinzhan/speedtest
tar zxvf xmr-stak-2.4.2.tar.gz
cd xmr-stak-2.4.2
sudo cmake . -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF 
sudo make install
cd bin/
sudo chmod +x xmr-stak

#worker="48n6t7K3WmTRN8LkrjKVrgG6XFZa4JmyJDqj2WcWPN3W8UM3Q2ZLxKR3yM8Q8vJn8RaVWP83DmyntaGb1oCitW5DGk3cnzX.az"$1
#sudo rm config.txt -f
cd /usr/local/src/speedtest
#sudo cp template.txt config.txt
sudo sed -i "s/WORKNUM/$1/g" startRun.sh
#sudo cp config.txt /usr/local/src/xmr-stak-cpu/bin/config.txt -f

sudo sed -i 'N;14i/usr/local/src/speedtest/startRun.sh' /etc/rc.local 
sudo chmod 744 startRun.sh
