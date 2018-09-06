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

This step consists to learn how to shared your docker.
For this, you will need to:

- Create ECR container on AWS
- Create the TAG command
- Create the push command

What you will learn with this :

- The command git tag
- The command git push
- The command git pull
- How to connect to AWS with awscli


# STEP 3

This step consists to learn how Terraform and AWS works.
For this, you will need to:

- Create your first Docker Cluster with Terraform

What you will learn with this :

- The command terraform init
- The command terraform workspace select staging
- The command terraform plan
- The command terraform apply --var-file=staging.tfvars
- How to search inside the Terraform documentation
- How to use autoscaling
- To connect to your server

```
chmod 400 /tmp/my_aws_demo.pem
ssh  -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i /tmp/my_aws_demo.pem ec2-user@<IP>
```

# STEP 4

This step consists to learn how you can deploy your container inside AWS.
For this, you will need to:

- One Terraform file to create the container
- One Terraform file to create the elb
- One Terraform file to create the ecs
- One Json file to describe the container
- Refactor your code !

After this, your hero is available on this URL :

```
open http://demo-capamerica-lb-983227971.us-west-1.elb.amazonaws.com/my
```

If you try to kill yourself, you can with this endpoint :

```
open http://demo-capamerica-lb-983227971.us-west-1.elb.amazonaws.com/attack
```

Maybee we can the log system.