Heroes Fight Club
===

Welcome on the best Fight Club on the world !

To start your heroes, choose one :
- ant
- blackpanther
- capamerica
- dardevil
- falcom
- hulk
- ironman
- rocketraccoon
- wasp


Also go inside the folder superherosfighhingapp and run this command :


```
make install
export HERO=wasp
make start
```

Also, you have three endpoints :

- GET http://localhost:5000/my => Your home page
- GET http://localhost:5000/atack => If you want to kill you
- POST {"hero" : "http://<IP>:5000/attack"} on  http://localhost:5000/fight => If you want to an another hero


The goal of this game is easy : Never die and dominate the world !


# STEP 1

You need :
- Creating the Dockerfile
- Searching and Implement commands to build your docker
- See this commands :
    - docker ps
    - docker logs
    - docker exec
    - docker kill
    - docker images
    - docker inspect
- See the link  between docker and your computer
- See how to pass environment variables and port

