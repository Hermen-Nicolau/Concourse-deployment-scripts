#! /bin/bash

echo "=================================================="
echo "This script will install a fully functional Concourse deployement, using Docker Compose yaml and a separate database"
echo "=================================================="

echo "First we have to install the Docker CE, this script only supports Linux Ubuntu and MAC"

#Get the user OS from an input using read with -p to prompt the user
read -p "What is your operating system [Ubuntu or MAC]:" operatingS
echo "You selected $operatingS"

if [ "$operatingS" == "Ubuntu" ]
then
    echo "You selected Ubuntu as your OS"

elif [ "$operatingS" == MAC ]
then
    echo "You selected MAC as your OS"
    echo "You can manually install Docker on MAC by going to https://docs.docker.com/desktop/mac/install/"

else
    echo "You did NOT select a valid OS for this script. Please run the script again and select either Ubuntu or MAC"
fi


