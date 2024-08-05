# ODOO DOCKER

This is how you can easly setup odoo using docker from docker compose file with ssh enabled. 

## Prerequisite
- Docker installed
- Git

## Setup
- git clone `https://github.com/Widiskel/odoo-docker.git`
- cd odoo-docker
- modify `.env` and `docker-compose.yml` file if you need a change.
- run `docker compose up -d` to build a container from compose file
- run `chmod +x sshsetup.sh && ./sshsetup.sh` to setup ssh on your container
- if you have any update on addons, run `docker compose up -d` to deploy the update to container
- if you want to destroy container run `docker compose down`


## Note
if you have any custom module write it on `addons` and run `docker compose up -d`. DONT WRITE YOUR CODE INSIDE CONTAINER.