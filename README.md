Author: Prathamesh R. Bhosale

**Project Overview**

This project represents a complete AWS cloud deployment workflow using industry-standard tools and best practices. It integrates network provisioning, compute layers, storage services, automation scripts, event-driven architecture, and scalability features — forming a fully functional cloud application environment.

The project demonstrates strong cloud engineering, DevOps, and automation skills through the combined use of Terraform, CloudFormation, EC2, RDS, Lambda, S3, Auto Scaling, AWS CLI, and Python (Boto3).

The system includes:

Custom VPC with public & private subnets

EC2 Web Server (Apache)

RDS MySQL Database (private subnet)

Lambda function triggered by S3 uploads

Auto Scaling Group for EC2

Boto3 automation scripts

AWS CLI operations

This project represents a real-world multi-service AWS environment.

Project Structure
aws-final-project/
│
├── 01_Infrastructure/
│   ├── terraform/           → VPC, Subnets, Security Groups
│   ├── cloudformation/      → EC2, RDS, Lambda (stack.yaml)
│
├── 02_Python_Scripts/       → Boto3 automation scripts
│
├── 03_Lambda/               → S3 Upload Logger Lambda function
│
├── 04_Documentation/        → Screenshots, diagrams, report
│
└── README.md

Each folder contains logically separated components to maintain clarity, modularity, and a clean deployment workflow.

1. Infrastructure as Code (IaC)

This section focuses on automating cloud resource creation instead of manually configuring them through the AWS Console.

Terraform (Network Layer)

Uses Terraform to build foundational cloud networking:

Custom VPC for isolation and security

Public subnets for internet-facing components

Private subnets for secure backend components

Internet Gateway and NAT Gateway

Route tables and associations

Security groups for controlled access

Terraform provides repeatability, modularity, and version-controlled infrastructure.

CloudFormation (Application Layer)

CloudFormation automates the deployment of the higher-level application resources:

EC2 instance configured as a web server

RDS MySQL database placed securely in private subnets

Lambda function with required IAM permissions

S3 bucket notifications and triggers

This separation of concerns (network in Terraform, compute/database in CloudFormation) reflects real-world DevOps practices.

2. EC2 Web Server Deployment

A fully functioning web server is launched inside the VPC:

Automatically installs and configures Apache using a User Data script

Hosts a simple web page to verify successful deployment

Accessible via a public subnet with controlled security group rules

The EC2 instance also serves as a jump server to connect to the private RDS database.

3. RDS MySQL Database

A secure relational database instance is deployed inside private subnets:

Not publicly accessible — only reachable via EC2

Provides persistent storage for applications

Isolated behind strict security groups

Outputs include endpoint connection details

This configuration follows security best practices for backend data layers.

4. AWS Lambda – S3 Event Logging

A serverless Lambda function is integrated to demonstrate event-driven architecture.

Key functionality:

Automatically triggers whenever a file is uploaded to an S3 bucket

Logs details such as bucket name, file name, and file size

Supports manual invocation through AWS CLI or Python scripts

Stores all logs in CloudWatch for monitoring and auditing

This showcases real-world serverless automation.

5. Python Boto3 Automation

A collection of Python scripts designed to interact with AWS programmatically using Boto3.

Scripts include:

Creating S3 buckets and uploading files

Listing running EC2 instances

Retrieving EC2 metadata from within the server

Manually invoking the Lambda function

These scripts demonstrate automation, orchestration, and integration with AWS SDKs.

6. AWS CLI Hands-On Operations

The project includes multiple AWS CLI interactions such as:

Managing EC2 instances

Uploading files to S3

Invoking Lambda functions

Querying resources and extracting metadata

This reflects comfort with command-line cloud administration, which is essential for cloud engineering roles.

7. Auto Scaling for EC2

An Auto Scaling Group (ASG) is configured to ensure application scalability and availability.

Features:

Launch Template defining how new EC2 instances should be created

Scaling policies triggered by CPU thresholds

Load distribution across multiple availability zones

This improves resilience and mirrors real production systems.

8. Overall System Architecture

The final architecture includes:

A secure VPC environment

Public-facing web server

Private RDS backend

Automated S3 → Lambda pipeline

Autoscaling compute layer

Centralized logging via CloudWatch

Infrastructure defined as code

This demonstrates the ability to design, implement, and manage cloud-native systems.

9. Key Learning Outcomes

Through this project, the following cloud competencies were demonstrated:

Building secure and scalable cloud infrastructure

Applying Infrastructure as Code principles

Automating deployments using CloudFormation

Implementing event-driven designs with serverless services

Performing AWS automation through Python and Boto3

Using AWS CLI for real-time resource management

Designing high-availability architectures

This project reflects practical cloud engineering skills aligned with real-world industry use cases.

10. Conclusion

This AWS Final Project successfully integrates multiple services into a cohesive solution that demonstrates:

Professional cloud architecture

Automation and provisioning skills

Hands-on AWS interaction

Best practices in security, scalability, and reliability

DevOps-focused deployment workflows

It stands as a strong portfolio piece showcasing cloud engineering expertise.
