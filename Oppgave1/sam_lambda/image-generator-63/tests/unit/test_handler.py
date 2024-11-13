import json
import os

import boto3
import pytest
import requests

from oppgave.app import lambda_handler  # Adjust the import based on your project structure


@pytest.fixture()
def apigw_event():
    """Generates API GW Event with a proper 'prompt' key."""

    return {
        "body": json.dumps({"prompt": "A vibrant forest in autumn"}),
        "resource": "/generate-image",
        "requestContext": {
            "resourceId": "123456",
            "apiId": "abcdef1234",
            "resourcePath": "/generate-image",
            "httpMethod": "POST",
            "requestId": "c6af9ac6-7b61-11e6-9a41-93e8deadbeef",
            "accountId": "123456789012",
            "identity": {
                "apiKey": "",
                "userArn": "",
                "cognitoAuthenticationType": "",
                "caller": "",
                "userAgent": "Custom User Agent String",
                "user": "",
                "cognitoIdentityPoolId": "",
                "cognitoIdentityId": "",
                "cognitoAuthenticationProvider": "",
                "sourceIp": "127.0.0.1",
                "accountId": "",
            },
            "stage": "prod",
        },
        "queryStringParameters": {"foo": "bar"},
        "headers": {
            "Content-Type": "application/json",
            "Host": "abcdef1234.execute-api.eu-west-1.amazonaws.com",
            "User-Agent": "Custom User Agent String",
            # Add other headers as needed
        },
        "pathParameters": {"proxy": "/generate-image"},
        "httpMethod": "POST",
        "stageVariables": {"baz": "qux"},
        "path": "/generate-image",
    }


def test_lambda_handler(apigw_event):
    """Tests the Lambda function's response to a valid API Gateway event."""

    ret = lambda_handler(apigw_event, {})
    data = json.loads(ret["body"])

    assert ret["statusCode"] == 200, f"Expected status code 200, got {ret['statusCode']}"
    assert "message" in data, "Response JSON does not contain 'message'"
    assert data["message"] == "Image generated successfully", f"Unexpected message: {data['message']}"
    assert "s3_key" in data, "Response JSON does not contain 's3_key'"

