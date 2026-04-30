#!/bin/bash

#clone code

clone_code() {
	git clone https://github.com/shilasonavane206-dot/node-todo-cicd.git
}

#Install Docker

install_docker() {

	echo "Installing docker"
	
	sudo apt-get update -y
	sudo apt-get install docker.io -y
}

#Start Docker

start_docker() {
	sudo systemctl start docker
	sudo systemctl enable  docker
	sudo chown $USER/var/run/docker.sock
}

#DeployAPP

deploy_app() {

	cd node-todo-cicd

	echo "stopping old container..."

	docker stop todo_container 2>/dev/null
	
	docker rm todo_container 2>/dev/null

	echo "Building image..."
	
	docker build -t todo-app .

	echo "Running container"

	docker run -d -p 3000:8000 --name todo_container todo-app

}

#FLOW

clone_code || cd node-todo-cicd
install_docker
start_docker
deploy_app


echo "********************************* Deployment Done ************************************"



