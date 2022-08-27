# Add user to group
sudo usermod -aG libvirt,lxd $USER

# List containers
lxc list -c n,s,4,image.description:image

# List ubuntu images
lxc image alias list ubuntu: '20.04'
