import json

def lambda_handler(event, context):
    # Process code
    message = f'{event["name1"]} ran the function successfully!'

    return {
        'statusCode': 200,
        'body': json.dumps(message)
    }
