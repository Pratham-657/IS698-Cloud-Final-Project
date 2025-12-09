import boto3

ec2 = boto3.client('ec2')

response = ec2.describe_instances(
    Filters=[
        {"Name": "instance-state-name", "Values": ["running"]}
    ]
)

print("Running EC2 Instances:\n")

for reservation in response["Reservations"]:
    for instance in reservation["Instances"]:
        print("Instance ID:", instance["InstanceId"])
        print("Instance Type:", instance["InstanceType"])
        print("Public IP:", instance.get("PublicIpAddress"))
        print("State:", instance["State"]["Name"])
        print("-----------------------------")

