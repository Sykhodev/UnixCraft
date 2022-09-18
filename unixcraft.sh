#!/bin/bash


echo "Welcome to the MODPACK installer"
echo "This script will install the MODPACK on your server"
echo "This script is made by Sykho"

echo #
echo #

echo "Please enter the path to your server folder"
echo #
echo "Example: /home/username/server"
echo #
echo "Choose your path or press enter to use the actual path:"
read -r install
if [ "$install" = "" ]; then
echo "No path entered, using the actual path"
    install=$(pwd)
fi
echo "."
sleep 1
echo ".."
sleep 1
echo "..."
sleep 1
clear
echo "Installing in $install"
echo #
echo "Downloading MODPACK.ZIP"
echo "."
sleep 1
echo ".."
sleep 1
echo "..."
sleep 1
clear
wget "https://YOUR_DOWNLOADIND_LINK/MODPACK.zip" -O "$install/MODPACK.ZIP"
echo #
echo "Downloaded MODPACK.ZIP"
echo "."
sleep 1
echo ".."
sleep 1
echo "..."
sleep 1
clear
echo "Unzipping MODPACK.ZIP"
echo #
unzip "$install/MODPACK.ZIP" -d "$install"
rm "$install/MODPACK.ZIP"
echo "."
sleep 1
echo ".."
sleep 1
echo "..."
sleep 1
clear
echo "Do you want to install the server ? (y/n)"
read -r installserver
if [ "$installserver" = "y" ]; then
    echo "Finding the start file.."
    echo "$install/startserver.sh found !" || exit
    chmod +x ./startserver.sh
    ./startserver.sh
fi 