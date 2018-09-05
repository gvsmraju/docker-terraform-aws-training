from flask import Flask,Response,request,render_template,url_for
from flask_cors import CORS
import os
import requests
import sys
app = Flask(__name__)

cors = CORS(app, resources={r"/*": {"origins": "*"}})

global life
life=100

def shutdown_server():
    func = request.environ.get('werkzeug.server.shutdown')
    if func is None:
        raise RuntimeError('Not running with the Werkzeug Server')
    func()

@app.route('/heroes')
def heroes():
    return 'ant,blackpanther,capamerica,dardevil,falcom,hulk,ironman,rocketraccoon,wasp'

@app.route('/attack')
def attack():
    global life
    life=life-10
    if life <= 0:
        shutdown_server()        
    return 'BOUMMMMMMMMM'

@app.route('/fight', methods=['POST'])
def fight():
    requests.get(request.json['hero'])
    return 'You are fitghting {}'.format(request.json['hero'])

@app.route('/my')
def my():
    return render_template('index.html', obj = "object", data = {'name' : os.environ.get('HERO'),'life':life,'image':'{}.jpg'.format(os.environ.get('HERO'))} );


if __name__ == '__main__':
    env = os.environ.get('FLASK_ENV', 'development')
    if env=='production':
        app.config.from_object('config.ProductionConfig')
    else:
        app.config.from_object('config.DevelopmentConfig')
    app.run(host=os.environ.get('HOST', '127.0.0.1'))
    url_for('static', filename='ant.jpg')

