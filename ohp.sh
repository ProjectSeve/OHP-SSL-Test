#ECHO COLORS
red="`tput setaf 1`"
green="`tput setaf 2`"
cyan="`tput setaf 6`"
bold="`tput bold`"
norm="`tput sgr0`"
magen="`tput setaf 5`"
# Install
wget https://github.com/lfasmpao/open-http-puncher/releases/download/0.1/ohpserver-linux32.zip
# Unzip
unzip ohpserver-linux32.zip
# Run As Root
chmod 755 ohpserver
# Sudoing Ohpserver
sudo mv ohpserver /usr/local/bin/
# Nanoing The Ohp Service
cat <<EOF >>/etc/systemd/system/sslohp.service
[Unit]
Description=SeveScripts1
Wants=network.target
After=network.target
[Service]
ExecStart=/usr/local/bin/ohpserver -port 357 -proxy 127.0.0.1:8000 -tunnel 127.0.0.1:1194
Restart=always
RestartSec=3
[Install]
WantedBy=multi-user.target
EOF
# Start OHP inline
sudo systemctl daemon-reload
sudo systemctl enable sslohp
sudo systemctl start sslohp
