Day 1 (Sep 13)
------------------
IAM User
------------------
Represents an individual (person, application, or service) that needs access to AWS.

Each user has credentials: username, password (for console), access keys (for CLI/SDK).

Best practice: Do not use the root account for daily tasks.
------------------
IAM Group
------------------
A collection of IAM users.

Groups make it easy to assign the same permissions to multiple users.

Example: Developers, Admins, S3-ReadOnly.
------------------
IAM Policy
------------------
A JSON document that defines permissions.

Attached to users, groups, or roles.

Uses Effect (Allow/Deny), Action (what can be done), and Resource (on which AWS resource).
-------------------------------------------------------------------------------------------
Day 4 Sep 16
-------------------------------------------------------------------------------------------

✅ IAM Policy for your user (Teammate)

Here’s the final JSON (no Principal):

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowTeamAccess",
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::my-daily-logs-bucket",
        "arn:aws:s3:::my-daily-logs-bucket/*"
      ]
    }
  ]
}

🔹 Steps to Apply

Go to IAM → Users → Teammate → Permissions.

Click Add Permissions → Create inline policy.

Paste the JSON above.

Save and attach.

But here I followd Customer managed policy. ---> you can go with either Inline or Managed

Now your IAM user can:

PutObject → upload logs

GetObject → download logs

ListBucket → see objects in the bucket


🔎 Difference

Bucket Policy (attached to the bucket itself) → ✅ allows Principal (to say who can access).

IAM Policy (attached to a user/role/group) → ❌ does not allow Principal, because the target is already defined (the user/role you attach to).

That’s why in the IAM policy editor, AWS tells you “remove Principal”.

⚡ So quick rule:

If writing Bucket Policy → use Principal.

If writing IAM Policy → remove Principal.

⚡ Quick tip:

Bucket policy = best when sharing with other AWS accounts or public access.

IAM user policy = best when sharing inside the same AWS account.

Errors:
------------------------------------------------------------------------------------------
You don’t have sufficient permissions to Diagnose with Amazon Q.
You or your AWS administrator can grant access by adding the AmazonQDeveloperAccess policy to your IAM identity. For more information, see the AWS managed policies for Amazon Q .
------------------------------------------------------------------------------------------
🔑 What does the AmazonQDeveloperAccess policy do?

This is an AWS Managed Policy that grants the minimum permissions needed for a developer to use Amazon Q.

Key Permissions it includes:

Read-only access to your AWS environment (so Amazon Q can analyze logs, configs, and errors).

Permissions to call Amazon Q service APIs.

Allows using Amazon Q in IDEs and AWS console (for diagnostics, code suggestions, and AI help).

It does not give admin rights or modify your resources. It’s scoped for developer assistance only.