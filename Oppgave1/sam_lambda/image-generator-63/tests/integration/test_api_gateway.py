import os
import boto3
import pytest
import requests
import json

"""
Ensure that the environment variable AWS_SAM_STACK_NAME is set to the name of your CloudFormation stack.
Example:
export AWS_SAM_STACK_NAME=image-generator-63
"""

class TestApiGateway:

    @pytest.fixture()
    def api_gateway_url(self):
        """Retrieve the API Gateway URL from CloudFormation Stack outputs."""
        stack_name = os.environ.get("AWS_SAM_STACK_NAME", "image-generator-63")
        print(f"AWS_SAM_STACK_NAME: {stack_name}")  # Debugging line

        if stack_name is None:
            raise ValueError('Please set the AWS_SAM_STACK_NAME environment variable to the name of your stack')

        client = boto3.client("cloudformation", region_name="eu-west-1")  # Ensure region is specified

        try:
            response = client.describe_stacks(StackName=stack_name)
        except client.exceptions.StackNotFoundException:
            raise Exception(f"Stack '{stack_name}' not found. Please ensure the stack is deployed.")
        except Exception as e:
            raise Exception(f"An error occurred while describing the stack: {str(e)}") from e

        stacks = response.get("Stacks", [])
        if not stacks:
            raise ValueError(f"No stacks found with the name '{stack_name}'.")

        stack_outputs = stacks[0].get("Outputs", [])
        api_outputs = [output for output in stack_outputs if output["OutputKey"] == "ApiUrl"]

        if not api_outputs:
            raise KeyError(f"'ApiUrl' output not found in stack '{stack_name}'.")

        api_url = api_outputs[0]["OutputValue"]
        print(f"API URL Found: {api_url}")  # Debugging line

        return api_url

    def test_generate_image_api(self, api_gateway_url):
        """Test the generate-image API endpoint."""
        print(f"Testing API URL: {api_gateway_url}")  # Debugging line

        payload = {
            "prompt": "A vibrant forest in autumn"
        }
        headers = {
            "Content-Type": "application/json"
            # Add "x-api-key": "YOUR_API_KEY" if authentication is enabled
        }

        response = requests.post(api_gateway_url, headers=headers, json=payload)
        print(f"Response Status Code: {response.status_code}")  # Debugging line
        print(f"Response Body: {response.text}")  # Debugging line

        assert response.status_code == 200, f"Expected status code 200, got {response.status_code}"
        response_json = response.json()
        assert "message" in response_json, "Response JSON does not contain 'message'"
        assert response_json["message"] == "Image generated successfully", f"Unexpected message: {response_json['message']}"
        assert "s3_key" in response_json, "Response JSON does not contain 's3_key'"
