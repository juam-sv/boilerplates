# Creating a Certificate Authority

sudo openssl genrsa -out ca.key.pem 4096
sudo openssl req -key ca.key.pem -new -x509 -days 365 -extensions v3_ca -out ca.crt.pem

#create user 
#docker run --entrypoint htpasswd httpd:alpine3.14 -Bbn usuario senha >> htpasswd

curl -X GET http://159.100.243.157:5000/v2/_catalog

