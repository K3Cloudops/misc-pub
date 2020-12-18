#!/bin/bash
#APT Setup
echo "Starting APT Config"

#Docker APT Config
echo "Starting Docker APT Config"

{
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
} 

#Set Ubuntu OS Verison Add the Docker Repo
echo "Adding Docker Repo to APT"

    {
    sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
    } 

## K8s APT Config
echo "Starting K8s APT Config"
    
    ## Get the Kubernetes gpg key:
    echo "Getting K8s GPG Key"
    
    {
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    } 

    ## Add the Kubernetes repository:
    echo "Adding K8s Repo to APT"

    {
    echo 'deb https://apt.kubernetes.io/ kubernetes-xenial main' | sudo tee /etc/apt/sources.list.d/kubernetes.list
    } 

#Updating APT Cache
    echo "Updating APT Cache"

    {
    sudo apt-get update
    } 

## Install Docker, kubelet, kubeadm, and kubectl:
    echo "Now Installing Docker $ADOCKER , kubelet $AKUBE , kubeadm $AKUBE, and kubectl $AKUBE."
    {
    sudo apt install -y docker-ce
    }
echo Run this after script !!!!!!!
echo  {
echo     sudo gpasswd -a cloudadm docker
echo     newgrp docker
echo  }
