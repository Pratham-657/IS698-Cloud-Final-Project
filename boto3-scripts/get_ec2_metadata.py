import requests

# Base metadata URL
base_url = "http://169.254.169.254/latest/meta-data/"

# Get instance ID
instance_id = requests.get(base_url + "instance-id").text
print("Instance ID:", instance_id)

# Get AMI ID
ami_id = requests.get(base_url + "ami-id").text
print("AMI ID:", ami_id)

# Get local IPv4
local_ip = requests.get(base_url + "local-ipv4").text
print("Local IPv4:", local_ip)

# Get public IPv4 (if exists)
try:
    public_ip = requests.get(base_url + "public-ipv4").text
    print("Public IPv4:", public_ip)
except:
    print("Public IPv4 not available")

