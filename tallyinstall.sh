sudo apt-get -y update 
sudo apt-get install -y python3-pip
sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED
sudo pip3 install "python-socketio[client]<5"
sudo pip3 install RPi.GPIO
sudo pip3 install zeroconf
sudo pip3 install argparse
wget --no-cache https://github.com/josephdadams/TallyArbiter/raw/master/listener_clients/gpo-listener/gpo-listener.py
wget --no-cache https://raw.githubusercontent.com/honey-pablo/tally/main/config_gpo.json
wget --no-cache https://raw.githubusercontent.com/honey-pablo/tally/main/customiseconfig.sh
wget --no-cache https://raw.githubusercontent.com/honey-pablo/tally/main/launcher.sh
wget --no-cache https://raw.githubusercontent.com/honey-pablo/tally/main/tempcron.txt
chmod 755 launcher.sh
crontab tempcron.txt
chmod +x customiseconfig.sh
bash customiseconfig.sh
sudo python3 gpo-listener.py
