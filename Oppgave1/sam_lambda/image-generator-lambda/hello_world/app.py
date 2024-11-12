import base64
import boto3
import json
import random
import os
from datetime import datetime

# Initialize AWS clients
bedrock_client = boto3.client("bedrock-runtime", region_name="us-east-1")
s3_client = boto3.client("s3")

def lambda_handler(event, context):
    try:
        # Parse the prompt from the HTTP POST request body
        body = json.loads(event.get('body', '{}'))
        prompt = body.get('prompt')
        if not prompt:
            return {
                'statusCode': 400,
                'body': json.dumps({'error': 'Please provide a "prompt" in the request body.'})
            }

        # Get environment variables
        bucket_name = os.environ['BUCKET_NAME']
        candidate_number = os.environ['CANDIDATE_NUMBER']

        # Define the model ID
        model_id = "amazon.titan-image-generator-v1"

        # Generate a random seed and S3 object key
        seed = random.randint(0, 2147483647)
        timestamp = datetime.utcnow().strftime('%Y%m%d%H%M%S')
        s3_key = f"{candidate_number}/{timestamp}_{seed}.png"

        # Prepare the request payload for Bedrock
        native_request = {
            "taskType": "TEXT_IMAGE",
            "textToImageParams": {"text": prompt},
            "imageGenerationConfig": {
                "numberOfImages": 1,
                "quality": "standard",
                "cfgScale": 8.0,
                "height": 1024,
                "width": 1024,
                "seed": seed,
            }
        }

        # Invoke the Bedrock model
        response = bedrock_client.invoke_model(
            modelId=model_id,
            body=json.dumps(native_request),
            contentType='application/json'
        )
        model_response = json.loads(response["body"].read())

        # Extract and decode the Base64 image data
        base64_image_data = model_response["images"][0]
        image_data = base64.b64decode(base64_image_data)

        # Upload the decoded image data to S3
        s3_client.put_object(Bucket=bucket_name, Key=s3_key, Body=image_data)

        # Return a success response with the S3 object key
        return {
            'statusCode': 200,
            'body': json.dumps({
                'message': 'Image generated successfully',
                's3_key': s3_key
            })
        }

    except Exception as e:
        # Log the exception for debugging purposes
        print(f"Error: {e}")

        return {
            'statusCode': 500,
            'body': json.dumps({'error': 'An error occurred while generating the image.'})
        }
