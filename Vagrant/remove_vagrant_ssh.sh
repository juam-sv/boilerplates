#!/bin/bash

for i in {1..256} 
do 
  ssh-keygen -R "192.168.122.$i"
  ssh-keygen -R "192.168.121.$i"
done
