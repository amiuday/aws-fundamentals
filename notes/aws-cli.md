Sep 14

🔹 Step 1: Install AWS CLI

Check if installed:
aws --version
If not installed: https://awscli.amazonaws.com/AWSCLIV2.msi

🔹 Step 2: Configure AWS CLI with credentials

Run: 
aws configure
It will ask for:
AWS Access Key ID [None]: <Your_Access_Key>
AWS Secret Access Key [None]: <Your_Secret_Key>
Default region name [None]: us-east-1
Default output format [None]: json

👉 Where to get Access/Secret keys:

Go to AWS Console → IAM → Users → your user.

Create an Access Key (for programmatic access).

Copy the Access Key ID and Secret Access Key.

⚠️ Important: Never share these keys publicly.

🔹 Step 3: Verify login

Check identity:
aws sts get-caller-identity

You’ll see something like:
{
    "UserId": "AID************",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/your-username"
}

🔹 Step 4: Optional — Use profiles (if you have multiple accounts)

aws configure --profile myaws

Then run commands with 
aws ec2 describe-instances --profile myaws

✅ Now your CLI is logged in, and you can run EC2 commands.