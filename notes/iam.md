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






--------------------------------------------------------------------------------------------
                                    GIT
--------------------------------------------------------------------------------------------

📘 Git Basics

git init → Initialize a new Git repository in the current folder.

git add <file> → Stage file(s) for commit.

git commit -m "message" → Save a snapshot of staged changes.

git remote add origin <url> → Link local repo to GitHub repository.

git push -u origin main → Upload commits to GitHub main branch.

