Sep 13

--------------------------------------------------------------------------------------------
                                    GIT
--------------------------------------------------------------------------------------------

📘 Git Basics

git init → Initialize a new Git repository in the current folder.

git add <file> → Stage file(s) for commit.

git commit -m "message" → Save a snapshot of staged changes.

git remote add origin <url> → Link local repo to GitHub repository.

git push -u origin main → Upload commits to GitHub main branch.

-------------------------------------------------------------------------------------------
Sep 14
-------------------------------------------------------------------------------------------
Step 1: Clear old GitHub credentials

git credential-manager-core erase

If that doesn’t work, manually remove saved credentials:

On Windows: Open Control Panel → Credential Manager → Windows Credentials.
Look for git:https://github.com and remove it.

Git side: You document that in your repo by creating a feature branch (dev), making changes, and merging into the main branch.

-------------------------------------------------------------------------------------------
Sep 15
-------------------------------------------------------------------------------------------

On GitHub: You fork a repo, make a change, and raise a PR.

-------------------------------------------------------------------------------------------
Sep 16
-------------------------------------------------------------------------------------------
🔹 GitHub: Collaborator Setup

If you want someone else to contribute to your repo:

Go to your GitHub repo → Settings → Collaborators.

Add collaborator’s GitHub username/email.

They will receive an invite. Once accepted, they can push/pull.

