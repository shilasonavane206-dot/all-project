#!/bin/bash

echo "******** Deployment Started ********"

update_system(){
    sudo apt-get update -y
}

install_docker(){
    sudo apt-get install docker.io -y
}

start_docker(){
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo chown $USER /var/run/docker.sock
}

run_container(){
    echo "Stopping old container..."
    docker stop getting-started-container 2>/dev/null
    docker rm getting-started-container 2>/dev/null

    echo "Running container..."
    docker run -d -p 3001:3000 --name getting-started-container docker/getting-started

    echo "App running at: http://3.6.169.120:3001"
}

update_system
install_docker
start_docker
run_container

echo "******** Deployment Done ********"
