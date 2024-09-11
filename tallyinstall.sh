sudo apt-get update -y
sudo apt-get install python3-pip
sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED
sudo pip3 install "python-socketio[client]<5"
sudo pip3 install RPi.GPIO
sudo pip3 install zeroconf
sudo pip3 install argparse
wget  https://github.com/josephdadams/TallyArbiter/raw/master/listener_clients/gpo-listener/gpo-listener.py
wget https://raw.githubusercontent.com/honey-pablo/tally/main/config_gpo.json
wget https://raw.githubusercontent.com/honey-pablo/tally/main/customiseconfig.sh
wget https://raw.githubusercontent.com/honey-pablo/tally/main/launcher.sh
https://raw.githubusercontent.com/honey-pablo/tally/main/tempcron
chmod 755 launcher.sh
crontab tempcron
chmod +x customiseconfig.sh
bash +x customiseconfig.sh
sudo python3 gpo-listener.py
