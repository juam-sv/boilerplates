Install steps:
1) download bundle installer
2) tar -xzvf (ansible tower zip)
3) In the 'inventory' file in unpacked zip:    
    a. set admin_password ('admin' user's login password)    
    b. set postgres password pg_password
4) Before install (if running below 4gb RAM, or if you get a 'preflight check' error about insufficient RAM):    
    a. change ram in config file:    
    /ansible-automation-platform-setup-bundle-1.2.0-1/roles/preflight/defaults/main.yml
5) Run setup script via sudo:     ./setup.sh    
Note: the above setup script takes a while to complete.
6) Navigate to hxxps://(hostname-of-install)
7) Enter in your information for licensing.
8) Ready for use.