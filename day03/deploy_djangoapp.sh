#!/bin/bash

echo "******** Deployment Started ********"

code_clone(){
    git clone https://github.com/shilasonavane206-dot/django-notes-app.git
}

required_library(){
    echo "Installing dependencies..."
    sudo apt-get update -y
    sudo apt-get install docker.io nginx -y
}

required_restart(){
    sudo chown $USER /var/run/docker.sock
    sudo systemctl enable docker
    sudo systemctl restart docker
}

deploy(){
    cd django-notes-app

    echo "Stopping old container (if any)..."
    docker stop notes-app-container 2>/dev/null
    docker rm notes-app-container 2>/dev/null

    echo "Building image..."
    docker build -t notes-app .

    echo "Running container..."
    docker run -d -p 8000:8000 --name notes-app-container notes-app
}

# Flow
code_clone || cd django-notes-app
required_library
required_restart
deploy

echo "******** Deployment Done ********"
