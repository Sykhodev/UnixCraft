#!/bin/bash

#######################WELCOME MESSAGE###############################

echo "Welcome to UnixCraft installer"
echo "This script will install the MODPACK on your server"
echo "This script is made by Sykho"

echo #
echo #

##################SPINNER###############################
function spinner(){
    sleep 7 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done
}

#######################INSTALLATION###############################
spinner 
# List of modpacks
echo "List of modpacks"
echo #
echo #
echo "1. All The Mods 7 0.4.32"
echo "2. All The Mods 8 0.0.15"
echo "3. RLCraft v2.9.1"
echo "4. Sky Factory 4 4.2.4"
echo "5. Stoneblock 2 1.16.0"
echo "6. BetterMC 1.19.2 FORGE VERSION"
echo "7. SevTech:Ages 3.2.3"
echo "8. MC Eternal 1.5"
echo "9. Dungeons, Dragons and Space Shuttles 8.0"
echo "10. FTB Infinity Evolved 3.1.0"
echo "11. FTB Presents SkyFactory 3 3.0.21"
echo "12. Enigmatica 6"


read -r -p "Enter the number of the modpack you want to install: " modpack
# Check if the modpack is valid
if [ "$modpack" -gt 14 ] || [ "$modpack" -lt 1 ]; then
    echo "Invalid modpack"
    exit 1
fi

# Gets the modpack link

if [ "$modpack" -eq 1 ]; then
    modpacklink="https://mediafiles.forgecdn.net/files/3995/913/ATM7-0.4.32-server.zip"
elif [ "$modpack" -eq 2 ]; then
    modpacklink="https://mediafiles.forgecdn.net/files/4011/826/Server-Files-0.0.15.zip"
elif [ "$modpack" -eq 3 ]; then
    modpacklink="https://mediafiles.forgecdn.net/files/3655/676/RLCraft+Server+Pack+1.12.2+-+Release+v2.9.1c.zip"
elif [ "$modpack" -eq 4 ]; then
    modpacklink="https://mediafiles.forgecdn.net/files/3565/687/SkyFactory-4_Server_4_2_4.zip"
elif [ "$modpack" -eq 5 ]; then
    modpacklink="https://mediafiles.forgecdn.net/files/2792/352/FTBPresentsStoneblock2Server_1.16.0.zip"
elif [ "$modpack" -eq 6 ]; then
    modpacklink="https://mediafiles.forgecdn.net/files/4018/694/Better+MC+Server+Pack+FORGE+1.19.2+v6.zip"
elif [ "$modpack" -eq 7 ]; then
    modpacklink="https://mediafiles.forgecdn.net/files/3570/46/SevTech_Ages_Server_3.2.3.zip"
elif [ "$modpack" -eq 8 ]; then
    modpacklink="https://mediafiles.forgecdn.net/files/3457/331/Minecraft+Eternal+Server+1.5.zip"
elif [ "$modpack" -eq 9 ]; then
    modpacklink="https://mediafiles.forgecdn.net/files/3074/836/DDSS_Serverfiles_8.0_R1.zip"
elif [ "$modpack" -eq 10 ]; then
    modpacklink="https://mediafiles.forgecdn.net/files/2731/545/FTBInfinityServer_3.1.0.zip"
elif [ "$modpack" -eq 11 ]; then
    modpacklink="https://mediafiles.forgecdn.net/files/3302/998/FTB_Presents_SkyFactory_3_Server_3_0_21_1.zip"
elif [ "$modpack" -eq 12 ]; then
    modpacklink="https://mediafiles.forgecdn.net/files/3947/166/Enigmatica6Server-1.5.1.zip"
fi




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

spinner

clear
echo "Installing in $install"
echo #
echo "Downloading MODPACK.ZIP"
spinner
clear

#######################DOWNLOAD###############################

wget "$modpacklink" -O "$install/MODPACK.ZIP"


# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Downloaded MODPACK.ZIP"
else
    echo "Download failed"
    exit 1
fi
spinner
clear

#######################UNZIP###############################

echo "Unzipping MODPACK.ZIP"
echo #
unzip "$install/MODPACK.ZIP" -d "$install"
rm "$install/MODPACK.ZIP"
spinner
clear

#######################END###############################
echo "Do you want to install the server ? (y/n)"
read -r installserver
if [ "$installserver" = "y" ]; then
    echo "Finding the start file.."
    echo "$install/startserver.sh found !" || exit
    chmod +x ./startserver.sh
    ./startserver.sh
fi 