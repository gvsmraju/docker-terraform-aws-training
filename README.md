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