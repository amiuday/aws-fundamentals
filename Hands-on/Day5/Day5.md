Goal:

Create a Security Group (SG) for a web server that allows HTTP (80) and SSH (22).

Create a Key Pair.

Launch an EC2 instance with this SG + Key Pair.

Document everything in GitHub Wiki.

---------------------------------------------------------------------------------------------
✅ Step 1: Create Security Group

# Create SG
aws ec2 create-security-group \
  --group-name WebServerSG \
  --description "SG for Web Server allowing HTTP and SSH"

# Add inbound rules
aws ec2 authorize-security-group-ingress \
  --group-name WebServerSG \
  --protocol tcp --port 80 --cidr 0.0.0.0/0

aws ec2 authorize-security-group-ingress \
  --group-name WebServerSG \
  --protocol tcp --port 22 --cidr <your-public-ip>/32

👉 Replace <your-public-ip> with your IP (you can check with curl ifconfig.me).

✅ Step 2: Create Key Pair

aws ec2 create-key-pair \
  --key-name WebServerKey \
  --query "KeyMaterial" \
  --output text > WebServerKey.pem

# Secure file permissions
chmod 400 WebServerKey.pem

✅ Step 3: Launch EC2 Instance

# Find Amazon Linux 2 AMI ID (example for us-east-1)
aws ec2 describe-images \
  --owners amazon \
  --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" \
  --query 'Images[*].[ImageId,Name]' \
  --output text | sort -k2 | tail -n 1

# Launch instance
aws ec2 run-instances \
  --image-id <ami-id> \
  --instance-type t3.micro \
  --key-name WebServerKey \
  --security-groups WebServerSG \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=WebServer}]'


✅ Step 4: Install Web Server (Apache)

SSH into your instance: (from the allowed server which we used in security groups)
ssh -i WebServerKey.pem ec2-user@<public-ip>

Install Apache:
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Welcome to Day 5 Web Server</h1>" | sudo tee /var/www/html/index.html

--> tee - tee allows users to view the output of a command in real-time on the terminal while also saving that same output to a file for later review, logging, or auditing.

Overwriting vs. Appending:
By default, tee overwrites the content of the specified file if it already exists.
To append the output to an existing file instead of overwriting it, the -a (append) option is used:

        command | tee -a filename.log

Multiple Files: tee can write to multiple files simultaneously by specifying them as arguments:

    command | tee file1.log file2.log

Example:
To display the output of ls -l on the terminal and also save it to a file named directory_listing.txt:

ls -l | tee directory_listing.txt

To append the current date and time to log.txt while also displaying it on the terminal:

date | tee -a log.txt

Now visit:
👉 http://<public-ip> in your browser 🎉

✅ Step 5: Document in GitHub Wiki

In your repo Wiki → Create a page:

Title: Web Server Security Group & Key Pair Setup
Content (Markdown example):

use the above content
