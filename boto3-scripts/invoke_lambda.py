import boto3
import json

lambda_client = boto3.client('lambda')

payload = {"message": "Hello from Boto3 script!"}

response = lambda_client.invoke(
    FunctionName='S3UploadLogger',
    InvocationType='RequestResponse',
    Payload=json.dumps(payload).encode('utf-8')
)

# Read response payload correctly
result = response['Payload'].read().decode('utf-8')

print("Lambda Response:")
print(result)

