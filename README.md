Heroes Fight Club
===

Welcome to the best Fight Club on the world !

To start the game, choose a hero :
- ant
- blackpanther
- capamerica
- dardevil
- falcom
- hulk
- ironman
- rocketraccoon
- wasp

Then, go inside the folder superherosfighhingapp and run this command :


```
make install
export HERO=wasp
make start
```

At this step, you will have three endpoints :

- GET http://localhost:5000/my => Your home page
- GET http://localhost:5000/atack => If you want to kill yourself
- POST {"hero" : "http://<IP>:5000/attack"} on  http://localhost:5000/fight => If you want to kill an other hero


The goal of this game is easy : Never die and dominate the world !


# STEP 1

This step consists to learn how Docker and its environment works.
For this, you will need to:

- Create the Dockerfile
- Create and Implement all commands to build your docker

What you will learn with this :

- The command docker ps
- The command docker logs
- The command docker exec
- The command docker kill
- The command docker images
- The command docker inspect
- The link between docker and your computer
- How to pass environment variables and port
  

# STEP 2

You need :
- Creating ECR container on AWS
- Creating TAG command
- Pushing your container
- Getting your container 
- Switch your container
- See this commands:
    - git tag
    - git push
    - git pull
- How to connect to AWS with awscli


# STEP 3

You need :
- Creating your first Docker Cluster with Terraform
- See this commands:
    - terraform init
    - terraform workspace select staging
    - terraform plan
    - terraform apply --var-file=staging.tfvars
- Terraform Documentation
- How to create docker cluster
- How to connect to the docker cluster
- How to use docker inside the cluster
- See all the components
- How to use autoscaling

- To connect to your server

```
chmod 400 /tmp/my_aws_demo.pem
ssh  -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i /tmp/my_aws_demo.pem ec2-user@<IP>
```