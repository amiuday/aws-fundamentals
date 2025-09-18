📘 Concepts for Day 4 (Sep 16)
🔹 AWS S3

S3 (Simple Storage Service) → Object storage for storing files (logs, images, backups, etc.).

You can create, upload, download, and manage files using the AWS CLI.

Common CLI Commands:

# Create a bucket (bucket name must be unique globally)
aws s3 mb s3://my-daily-logs-bucket

# Upload a file
aws s3 cp mylog.txt s3://my-daily-logs-bucket/

# Upload a folder (recursive)
aws s3 cp ./logs s3://my-daily-logs-bucket/ --recursive

# Download a file
aws s3 cp s3://my-daily-logs-bucket/mylog.txt ./downloaded_mylog.txt

# List bucket contents
aws s3 ls s3://my-daily-logs-bucket/


🛠 Use Case for Today

👉 Store daily logs in S3 and push script to GitHub.

Write a small script (upload_logs.sh)

#!/bin/bash

# Variables
BUCKET_NAME="my-daily-logs-bucket"
LOG_DIR="./logs"
TODAY=$(date +%F)
LOG_FILE="$LOG_DIR/log-$TODAY.txt"

# Create log dir if not exists
mkdir -p $LOG_DIR

# Generate dummy log
echo "Log entry for $TODAY at $(date +%T)" >> $LOG_FILE

# Upload to S3
aws s3 cp $LOG_FILE s3://$BUCKET_NAME/

echo "Uploaded $LOG_FILE to s3://$BUCKET_NAME/"
