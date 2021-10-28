#! /bin/bash

echo "=================================================="
echo "This script will install a fully functional Concourse deployement, using Docker Compose yaml and a separate database"
echo "=================================================="

echo "First we have to install the Docker CE, this script only supports Linux Ubuntu and MAC"

#Get the user OS from an input using read with -p to prompt the user
read -p "What is your operating system [Ubuntu or MAC]:" operatingS

if [ "$operatingS" == "Ubuntu" ]
then
    echo "You selected Ubuntu as your OS"

elif [ "$operatingS" == MAC ]
then
    echo "You selected MAC as your OS"
    echo "You can manually install Docker on MAC by going to https://docs.docker.com/desktop/mac/install/"
    echo "Testing if the docker install is good"
    docker version
    echo "Installing Docker Compose version 1.23.2"
    sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version

    echo "=================================================="
    echo "Running Concourse"
    echo "=================================================="
    curl -l https://gitlab.com/snippets/1864804/raw > docker-compose.yml
    ipaddr=$(ipconfig getifaddr en0)
    sed "s|EXTERNAL_URL=|EXTERNAL_URL=http://$ipaddr:8080|g" docker-compose.yml
    docker-compose up -d
    docker ps
    cat docker-compose.yml |grep EXTERNAL_URL | sed -e 's/^[[:space:]]*- //'


else
    echo "You did NOT select a valid OS for this script. Please run the script again and select either Ubuntu or MAC"
fi

