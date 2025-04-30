#!/bin/bash
apt install nginx -y
echo "<html><body style=\"background-color:SlateBlue;\"><br><br><center><h1>DEVOPS DEMO PAGE</h1></center></body></html>" > /var/www/html/index.html
systemctl restart nginx