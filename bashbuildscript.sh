#Goals:
#Demonstrate how to create a Bash script which automates the build process and dockerisation of your application.
#Understand how to make your application build repeatable.

#Tasks:
#Create a bash script which perform the following tasks:
    #Build your application.
    #Build a Docker image of your application.

#Modify your application.
#Generate new Docker image of the application using your script.

#!/bin/bash

#Git stuff
git add .
read -p "Enter commit message: " commit_message
git commit -m "$commit_message"
git push

#stop and remove container:
docker stop lbg
docker rm lbg
#docker stop lbg \
#&& (docker rm lbg) \
#|| (docker rm lbg && sleep 1 || sleep 1) 

#remove image
docker rmi mtkg/lbg-python-sprint2:latest

#Build image:
#version=$(($version + 1))
#docker build -t mtkg/lbg-python-sprint2:v${version} .
#docker tag mtkg/lbg-python-sprint2:v${version} mtkg/lbg-python-sprint2
docker build -t mtkg/lbg-python-sprint2:latest .

#Docker Hub push:
docker push mtkg/lbg-python-sprint2:latest

#Run up image as new container:
#docker run -d -p 80:8080 --name lbg mtkg/lbg-python-sprint2:latest    
docker run -d -p 80:${PORT} -e PORT=${PORT} --name lbg mtkg/lbg-python-sprint2:latest    

#export PORT=9000

#Load url in brownser:
start http://localhost:80/index.html

echo "complete"