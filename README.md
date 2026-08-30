# dwva-setup
terraform script to setup dwva enviroment


# how to run

First you must have in your linux system (this terraform script works well with ubuntu server) the following applications:
* docker
* docker-compose
* terraform

if you don't have it the first two are easily available trough apt:
```
sudo apt install -y docker docker-compose
```
The last one is available with snap package management:
```
sudo snap install --classic terraform
```

after you have those applications. you have to run the terraform workflow


```
terraform init
terraform apply --auto-approve
```

After this dwva is available to all hosts on the port 4280
Note: It may happen that the first apply could fail, please run apply again
