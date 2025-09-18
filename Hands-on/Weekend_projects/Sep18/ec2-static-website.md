Weekend Project: 
Setup EC2 → host static website using Apache. 
Push complete setup guide to GitHub repo.

Weekend Project: Hosting a Static Website on AWS EC2 with Apache (Console-Only)
📌 Objective

Provision an EC2 instance, install Apache, and host a static website using only the AWS Management Console. Document the entire process and push it to GitHub for version control.

🚀 Step 1: Launch an EC2 Instance

Log in to AWS Management Console → Navigate to EC2.

Click Launch Instance.

Configure:

Name: static-web-server

AMI: Amazon Linux 2 (Free tier eligible).

Instance Type: t2.micro (Free tier).

Key Pair: Create new (e.g., weekend-key) → Download .pem file.

Network Settings:

VPC: Default.

Subnet: Default.

Auto-assign Public IP: Enabled.

Security Group: Create new.

Inbound Rules:

HTTP (80) → Anywhere (0.0.0.0/0).

SSH (22) → Your IP.

Storage: Default 8GB EBS (gp3).

Click Launch Instance.


🔑 Step 2: Connect to Instance

Select the instance → Click Connect.

Choose EC2 Instance Connect (no need for CLI in this project).

You now have a web-based shell to your EC2 instance.

🌐 Step 3: Install Apache

Run the following inside the EC2 Instance Connect terminal:
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd

🖼️ Step 4: Deploy Static Website

Navigate to Apache root directory:
cd /var/www/html

Remove default content:
sudo rm -f index.html

Create your custom HTML file:
echo "<html><head><title>Weekend Project</title></head><body><h1>Welcome to My Static Website on AWS EC2</h1><p>Deployed via AWS Console</p></body></html>" | sudo tee index.html

🔍 Step 5: Verify Website

Copy the Public IPv4 DNS or Public IP from EC2 console.

Open in browser → http://<public-ip>
✅ You should see your static site.

🔒 Step 6: Add Professional Touch

Custom Security Group Name: sg-static-website.

Tagging Best Practices:

Name = static-web-server

Environment = dev

Owner = <your_name>

Monitoring: Enable CloudWatch default monitoring (enabled by default).

Backup Option: Create an AMI of the instance (future redeployment).


📂 Step 7: Push Setup Guide to GitHub


Add documentation file:

ec2-static-website.md with:

Project Overview.

Step-by-step setup guide (above).

Screenshots of:

EC2 launch config.

Apache installation.

Website running in browser.

Commit & Push.