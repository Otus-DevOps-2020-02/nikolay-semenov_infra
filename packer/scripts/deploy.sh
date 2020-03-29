#!/bin/bash
sudo mkdir /srv/app && cd /srv/app
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
sudo cat >> /etc/systemd/system/reddit.service <<EOF

[Unit]
Description=Puma server
After=network.target

[Service]
Type=simple
User=appuser
WorkingDirectory=/srv/app/reddit/
ExecStart=/usr/local/bin/puma
Restart=on-failure

[Install]
WantedBy=multi-user.target

EOF

sudo systemctl daemon-reload && sudo systemctl enable reddit.service
