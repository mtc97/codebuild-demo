# Coworking App
## Description
This project contains an application deployment running on a kubernetes cluster with a postgres database. 

## Installation
###Prerequisites
You will need the following tools to complete the deployment:
git, Python3.8, Docker CLI, Kubectl, and AWS.

###Setup EKS cluster
An EKS cluster has to be setup, with a node group attached. This can be done either by GUI or terminal with the following cmds: (eksctl create cluster --name my-cluster --region us-east-1 --nodegroup-name my-nodes --node-type t3.small --nodes 1 --nodes-min 1 --nodes-max 2)  (aws eks --region us-east-1 update-kubeconfig --name my-cluster)

###Configure the database by using the .yaml files
To configure the database you need to copy the following files pvc.yaml, pv.yaml, and postgresql-deployment.yaml on your local machine. In the postgresql-deployment.yaml file you  will need to specify the name, username, and password. 
After the files are in place you can apply the yaml config with the following cmds: (kubectl apply -f pvc.yaml) (kubectl apply -f pv.yaml) (kubectl apply -f postgresql-deployment.yaml)

###Configure the database service
Copy the file postgresql-service.yaml and apply it with: kubectl apply -f postgresql-service.yaml

###Deploy the app with the dockerfile, configmap, and secret files. 
Fork github project to your own github space (https://github.com/mtc97/codebuild-demo). Setup a codebuild project in AWS and connect it to your own github. Run the codebuild project to create the ECR instance and deploy the app.

##Recommendations
###Memory and CPU 
From the container insights we could see that only 3% were utilized so it would be possible to scale down to an even smaller instance of 1 or 0.5 GB. 
###AWS instance
The instance called t2.small is more than enough, you could even use the micro as the app runs on very little memory. 
###Cost saving
It would be possible to save cost by scaling down the application. By using AWS Auto Scaling you could allow AWS to scale down the resources used in down times to save costs. 
