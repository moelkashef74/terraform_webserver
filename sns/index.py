import json
import boto3
import os

sns_client = boto3.client('sns')

def lambda_handler(event, context):
    """
    Handler for S3 upload notifications
    Publishes a message to SNS topic when S3 event occurs
    """
    sns_topic_arn = os.environ['SNS_TOPIC_ARN']
    
    try:
        # Process S3 event
        message = {
            "event": "S3 Object Uploaded",
            "details": json.dumps(event)
        }
        
        # Publish to SNS
        response = sns_client.publish(
            TopicArn=sns_topic_arn,
            Subject="S3 Upload Notification",
            Message=json.dumps(message)
        )
        
        return {
            'statusCode': 200,
            'body': json.dumps('Notification sent successfully')
        }
    
    except Exception as e:
        print(f"Error: {str(e)}")
        return {
            'statusCode': 500,
            'body': json.dumps(f'Error: {str(e)}')
        }
