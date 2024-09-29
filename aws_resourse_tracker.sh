




#!/bin/bash

########################
# Author: Arun
# Date: 29th-Sep
#
# Version: v1.1
#
# This script will report the AWS resource usage.
########################

# Enable debugging
set -x

# AWS Resources:
# - S3 Buckets
# - EC2 Instances
# - Lambda Functions
# - IAM Users
########################

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null
then
    echo "AWS CLI is not installed. Please install it first."
    exit 1
fi

# List S3 buckets
echo "Listing S3 buckets..."
aws s3 ls || { echo "Failed to list S3 buckets"; exit 1; }

# List EC2 Instances
echo "Listing EC2 instances..."
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'
#aws ec2 describe-instances || { echo "Failed to list EC2 instances"; exit 1; }

# List AWS Lambda functions
echo "Listing Lambda functions..."
aws lambda list-functions || { echo "Failed to list Lambda functions"; exit 1; }

# List IAM users
echo "Listing IAM users..."
aws iam list-users || { echo "Failed to list IAM users"; exit 1; }

# End of script
set +x

