#!/bin/bash

echo Welcome to the unixcraft installer !

echo please choose you install destination :
read -r install
echo "installing to $install"

wget "https://YOUR_DOWNLOADIND_LINK/MODPACK.zip" -O "$install/MODPACK.ZIP"
echo #
echo "downloaded MODPACK.ZIP"
echo #
echo "unzipping MODPACK.ZIP"
unzip "$install/MODPACK.ZIP" -d "$install"
rm "$install/MODPACK.ZIP"
echo "Do you want to install the server ? (y/n)"
read -r installserver
if [ "$installserver" = "y" ]; then
    echo "Finding the start file.."
    echo "$install/startserver.sh found !" || exit
    chmod +x ./startserver.sh
    ./startserver.sh
fi 