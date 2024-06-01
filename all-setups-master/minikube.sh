
sudo apt update -y
sudo apt upgrade -y
sudo install crul wget apt-transport-https -y
sudo -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/minikube
sudo minikube version
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sudo minikube start --driver=docker --force