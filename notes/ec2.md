Day 2 (Sep 14)
-------------------------------------------------------------------------------------------
🔹 Part 1: AWS — Launch EC2 Instance (Linux)
-------------------------------------------------------------------------------------------
==>Step 1: Launch a t3.micro instance

Log in to AWS Console → EC2 → Launch Instance.

Name: day2-ec2.

AMI: Amazon Linux 2023 kernel-6.1 AMI (free tier eligible). (eu-north-1)

Instance type: t3.micro

Key pair: Create new or use existing (download .pem file). Name: day2-key-pair

Security group: Allow SSH (port 22).

Launch the instance.

==>Step 2: SSH into the instance

In terminal:
chmod 400 day2-key-pair.pem   # ensure correct permissions  (r=4, w=2, x=1)
ssh -i day2-key-pair.pem ec2-user@<Public-IP>

Once logged in, run:
uname -a

✅ This prints kernel details (Linux version, architecture).