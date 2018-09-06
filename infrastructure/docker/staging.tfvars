#--------------------------------------------------------------
# General
#--------------------------------------------------------------

region = "us-west-1"

environment = "demo"

availability_zones = ["us-west-1a", "us-west-1c"]

vpc_id = "vpc-0887543ccbc88b65b"

my_aws_key = "/Users/decentralemployee/decentral-internal-east.pem"

keypair_name = "decentral-internal-east"

vpc_subnets = ["subnet-069e32d5578f25a55", "subnet-07ae10dc09764d0c2"]

security_groups = ["sg-00ebafecd010ccdcc", "sg-025279719a6fd91b2", "sg-003780bf1f32294e9"]

lb_security_groups = ["sg-03a5394e89b2279c6"]

hero = "capamerica"

cluster_name = "demo-ecs-ant"

docker_url = "371075088726.dkr.ecr.us-west-1.amazonaws.com/myhero:latest"
