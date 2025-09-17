Day 5 Sep 17

Security Group (SG):

Acts as a virtual firewall for your EC2 instance.

Controls inbound (traffic coming in) and outbound (traffic going out).

Example: Allow port 80 for HTTP web traffic, port 22 for SSH.

👉 Inbound Example:

HTTP (80) → 0.0.0.0/0 (anywhere)

SSH (22) → Only from your IP