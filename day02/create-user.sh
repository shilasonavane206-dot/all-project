#!/bin/bash


read -p "Enter username " username

echo "User name is: $username"

sudo useradd -m $username

echo "New user added sucessfully!"
