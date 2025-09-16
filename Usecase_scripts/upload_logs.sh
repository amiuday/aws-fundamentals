#!/bin/bash
# Script to upload log files to an S3 bucket
BUCKET_NAME="uday-day4-bucket"
LOG_DIR="./logs"
TODAY=$(date +%F)
LOG_FILE="$LOG_DIR/log_$TODAY.txt"

# Create log directory if it doesn't exist
mkdir -p $LOG_DIR

# Generate a sample log file
echo "Log entry for $TODAY" > $LOG_FILE

# Upload the log file to the S3 bucket
aws s3 cp $LOG_FILE s3://$BUCKET_NAME/

echo "Log file $LOG_FILE uploaded to s3://$BUCKET_NAME/"