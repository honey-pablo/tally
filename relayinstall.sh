cd /home/admin/
git clone https://github.com/josephdadams/TallyArbiter.git tallysourcecode
sudo cp -a  /home/admin/tallysourcecode/listener_clients/relay-listener/. /home/admin/relay-listener/
sudo apt install -y libudev-dev libusb-1.0-0-dev
sudo apt install -y nodejs
sudo apt install -y npm
cd /home/admin/relay-listener
npm install
npm i socket.io-client @types/socket.io-client
cp config_relays.json.example config_relays.json
