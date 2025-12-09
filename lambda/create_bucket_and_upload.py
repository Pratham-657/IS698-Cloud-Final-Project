import boto3

s3 = boto3.client('s3')

bucket_name = "joy-boto3-demo-bucket-2025"

# Create S3 bucket
s3.create_bucket(Bucket=bucket_name)
print(f"Bucket created: {bucket_name}")

# Upload a file
s3.upload_file("test.txt", bucket_name, "test.txt")
print("File 'test.txt' uploaded successfully!")

