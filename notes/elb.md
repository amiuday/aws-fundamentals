Day 3 (Sep 15)
------------------------------------------------------
🔧 Manual Steps – Create & Attach EBS in AWS Console
------------------------------------------------------
1. Create an EBS Volume

Login to AWS Management Console.

Go to EC2 Dashboard → Volumes (left menu under Elastic Block Store).

Click Create Volume.

Size: e.g., 5 GiB.

Availability Zone (AZ): Must match your EC2 instance’s AZ.

Volume type: gp2/gp3 (general purpose).

Click Create Volume.

✅ New volume will appear in Available state.


2. Attach the Volume to EC2

Select the newly created volume.

Click Actions → Attach Volume.

Choose your EC2 instance (must be in the same AZ).

Specify device name (e.g., /dev/sdf).

Click Attach Volume.

✅ Status changes to In-use.

3. Connect to Your EC2 (Linux)

SSH into your instance:
ssh -i <your-key>.pem ec2-user@<public-ip>

4. Verify the Attached Volume
lsblk

You’ll see something like:
[ec2-user@ip-172-31-17-70 ~]$ lsblk
NAME          MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS
nvme1n1       259:0    0   5G  0 disk
nvme0n1       259:1    0   8G  0 disk
├─nvme0n1p1   259:2    0   8G  0 part /
├─nvme0n1p127 259:3    0   1M  0 part
└─nvme0n1p128 259:4    0  10M  0 part /boot/efi
Here, /dev/nvme1n1 is your new EBS.

5. Format the Volume
[ec2-user@ip-172-31-17-70 ~]$ sudo mkfs -t ext4 /dev/nvme1n1

6. Mount the Volume
[ec2-user@ip-172-31-17-70 ~]$ sudo mkdir /data
[ec2-user@ip-172-31-17-70 ~]$ sudo mount /dev/nvme1n1 /data

Check:
[ec2-user@ip-172-31-17-70 ~]$ df -h
Filesystem        Size  Used Avail Use% Mounted on
devtmpfs          4.0M     0  4.0M   0% /dev
tmpfs             453M     0  453M   0% /dev/shm
tmpfs             181M  436K  181M   1% /run
/dev/nvme0n1p1    8.0G  1.6G  6.4G  20% /
tmpfs             453M     0  453M   0% /tmp
/dev/nvme0n1p128   10M  1.3M  8.7M  13% /boot/efi
tmpfs              91M     0   91M   0% /run/user/1000
/dev/nvme1n1      4.9G   24K  4.6G   1% /data

7. (Optional) Auto-Mount on Reboot
Find UUID:
[ec2-user@ip-172-31-17-70 ~]$ sudo blkid /dev/nvme1n1
/dev/nvme1n1: UUID="b19b3fec-16f8-4130-a6ed-5ed465a521a0" BLOCK_SIZE="4096" TYPE="ext4"
Edit fstab:
[ec2-user@ip-172-31-17-70 ~]$ sudo vi /etc/fstab
UUID=d1dcb361-f6cb-43b3-8521-e258eb33a95e     /           xfs    defaults,noatime  1   1
UUID=6421-BFF7        /boot/efi       vfat    defaults,noatime,uid=0,gid=0,umask=0077,shortname=winnt,x-systemd.automount 0 2
UUID=b19b3fec-16f8-4130-a6ed-5ed465a521a0     /data       ext4   defaults,nofail 0 2
---------------
Detach Volume
---------------
🔑 Summary Flow:

Unmount in EC2 → Detach in Console → (Optional) Delete/Reuse.

1. Unmount the Volume from EC2
First, login to your EC2 instance:
ssh -i <your-key>.pem ec2-user@<public-ip>

Then unmount:
sudo umount /data

⚠️ Important: Always unmount inside the OS before detaching from AWS Console, otherwise you risk data corruption.

2. Detach the Volume from EC2 (Console)

Go to EC2 Dashboard → Volumes.

Select your volume (vol-xxxxxxx).

Click Actions → Detach Volume.

Confirm detach.

✅ Volume status will change from In-use → Available.

3. (Optional) Delete the Volume

If you no longer need it:

Select the Available volume.

Actions → Delete Volume.

Confirm.


Findings:

[ec2-user@ip-172-31-17-70 ~]$ sudo mkfs -t ext4 /dev/nvme1n1
mke2fs 1.46.5 (30-Dec-2021)
/dev/nvme1n1 contains a ext4 file system
        last mounted on Mon Sep 15 04:55:21 2025
Proceed anyway? (y,N)

That message means:
👉 The EBS volume already has an ext4 filesystem from when you used it earlier.
When you detached and reattached it, the data and filesystem were preserved.

Format again (Only if you want to erase old data)

If you don’t need anything on that disk, you can type y when it asks and it will overwrite with a fresh ext4 filesystem.

Example:
Proceed anyway? (y,N) y

But ⚠️ this destroys existing data.

I choose "N" because don't want to lose my data

[ec2-user@ip-172-31-17-70 ~]$ sudo blkid /dev/nvme1n1
/dev/nvme1n1: UUID="b19b3fec-16f8-4130-a6ed-5ed465a521a0" BLOCK_SIZE="4096" TYPE="ext4"
[ec2-user@ip-172-31-17-70 ~]$ cat /etc/fstab
#
UUID=d1dcb361-f6cb-43b3-8521-e258eb33a95e     /           xfs    defaults,noatime  1   1
UUID=6421-BFF7        /boot/efi       vfat    defaults,noatime,uid=0,gid=0,umask=0077,shortname=winnt,x-systemd.automount 0 2
UUID=b19b3fec-16f8-4130-a6ed-5ed465a521a0     /data       ext4   defaults,nofail 0 2
[ec2-user@ip-172-31-17-70 ~]$

Block Id will not change even after detaching it from the instance and reattched to the same instance. 
