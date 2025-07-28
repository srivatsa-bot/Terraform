#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1>Hello from Terraform Apache Server</h1>" > /var/www/html/index.html