sudo apt-get update
sudo apt-get install python3-pip
sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED
sudo pip3 install "python-socketio[client]<5"
sudo pip3 install RPi.GPIO
sudo pip3 install zeroconf
sudo pip3 install argparse
wget  https://github.com/josephdadams/TallyArbiter/raw/master/listener_clients/gpo-listener/gpo-listener.py
wget https://github.com/josephdadams/TallyArbiter/raw/master/listener_clients/gpo-listener/config_gpo.json.example
sudo mv config_gpo.json.example config_gpo.json