---
name: "Day 5 - Web Server Setup"
about: "Setup Security Group, Key Pair, and Web Server on EC2"
title: "[Day 5] Setup Web Server with SG & Key Pair"
labels: enhancement, aws, day5
assignees: ""
---

## 🎯 Objective
Create a Security Group, Key Pair, and launch a Web Server EC2 instance. Document the process in the Wiki.

---

## ✅ Tasks
- [ ] Create Security Group `WebServerSG` (allow HTTP:80, SSH:22 from my IP).
- [ ] Create Key Pair `WebServerKey` and save `.pem` file.
- [ ] Launch EC2 instance (`t2.micro`) with above SG and Key Pair.
- [ ] Install Apache Web Server.
- [ ] Test website using Public IP in browser.
- [ ] Document steps in GitHub Wiki.

---

## 📚 References
- [AWS CLI Docs](https://docs.aws.amazon.com/cli/index.html)
- [GitHub Wiki Guide](https://docs.github.com/en/communities/documenting-your-project-with-wikis/about-wikis)

---

## 🚀 Expected Output
- Running Apache Web Server accessible via `http://<public-ip>`.
- Wiki page created with step-by-step documentation.

