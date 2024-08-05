#!/bin/bash

read -p "Enter the container name: " CONTAINER_NAME
read -s -p "Enter the new root password: " ROOT_PASSWORD
echo

docker exec -u root -it "$CONTAINER_NAME" bash -c "
    apt-get update && \
    apt-get install -y openssh-server && \
    mkdir -p /var/run/sshd && \
    sed -i '/^PermitRootLogin/s/^.*$/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    grep -q '^PermitRootLogin' /etc/ssh/sshd_config || echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    echo \"root:${ROOT_PASSWORD}\" | chpasswd && \
    service ssh restart
"

docker restart "$CONTAINER_NAME"
docker exec -u root -it "$CONTAINER_NAME" bash -c "
    service ssh start
"

echo "OpenSSH server installed and started in the container '$CONTAINER_NAME'."
echo "Root login and password authentication enabled, and new root password set."
