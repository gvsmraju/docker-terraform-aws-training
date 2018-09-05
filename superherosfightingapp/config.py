import os 

class Config(object):
    DEBUG = False

class ProductionConfig(Config):
    DEBUG = True
    HERO = os.environ.get('HERO')
    HOST= '0.0.0.0'

class DevelopmentConfig(Config):
    DEBUG = True
    HERO = os.environ.get('HERO')
    HOST= '127.0.0.1'
