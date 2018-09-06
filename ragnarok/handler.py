import json
import boto3
import random

client = boto3.client('ec2', region_name='us-west-1')


def hello(event, context):
    reservations= client.describe_instances()['Reservations']
    instance_id=[]
    for reservation in reservations:
        if 'Instances' in reservation:
            instance_id.append((reservation['Instances'][0]['InstanceId']))
    
    instance_deleted=[]
    for x in range(3):
        instance_id_to_delete=instance_id[random.randint(0,len(instance_id))]
        instance_deleted.append(instance_id_to_delete)
        client.terminate_instances(InstanceIds=[instance_id_to_delete])

    
    response = {
        "statusCode": 200,
        "body": json.dumps(instance_deleted)
    }

    return response

    # Use this code if you don't use the http event with the LAMBDA-PROXY
    # integration
    """
    return {
        "message": "Go Serverless v1.0! Your function executed successfully!",
        "event": event
    }
    """

