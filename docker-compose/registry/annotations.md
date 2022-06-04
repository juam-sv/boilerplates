# Creating a Certificate Authority

sudo openssl genrsa -out ca.key.pem 4096
sudo openssl req -key ca.key.pem -new -x509 -days 365 -extensions v3_ca -out ca.crt.pem
