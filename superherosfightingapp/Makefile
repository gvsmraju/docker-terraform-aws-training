install:
	whoami
	python3 -m venv venv
	. ./venv/bin/activate && pip install -r requirements.txt

start:
	python3 server.py

build: 
	docker build --no-cache -t my-hero .

run:
	docker run -d -e HERO=capamerica -e HOST=0.0.0.0 -p 5000:5000 my-hero

tag: 
	docker tag my-hero:latest 371075088726.dkr.ecr.us-east-1.amazonaws.com/my-hero:latest

push:
	docker push 371075088726.dkr.ecr.us-east-1.amazonaws.com/my-hero:latest
