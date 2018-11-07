ssh ec2-user@18.222.71.147 -i ~/Downloads/hzhan3.pem
# add AWS key
chmod 0400 ~/Downloads/hzhan3.pem

#!/bin/bash
yum update -y
yum upgrade -y
yum install libGLU libXrandr libXcursor libXinerama -y
wget http://bio3d.colorado.edu/imod/AMD64-RHEL5/imod_4.9.6_RHEL7-64_CUDA8.0.sh
sh ./imod_4.9.6_RHEL7-64_CUDA8.0.sh -y

set AWS_ACCESS_KEY_ID=AKIAID3NGEATKBSMPNDQ
set AWS_SECRET_ACCESS_KEY=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

#install desktop redhat linux
#!/bin/bash
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum groupinstall -y "Server with GUI"
sudo yum install -y xrdp tigervnc-server
sudo systemctl start xrdp.service
chcon --type=bin_t /usr/sbin/xrdp
chcon --type=bin_t /usr/sbin/xrdp-sesman
sudo systemctl enable xrdp.service

sudo passwd ec2-user

#install pip because python version is less than 2.7.9
yum install python
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py

pip install awscli --upgrade --user

~/.local/bin/aws

aws s3 cp s3://hzhan3test/cryoExampleData.tar.bz cryoExampleData.tar.bz
bunzip2 cryoExampleData.tar.bz
tar xvf cryoExampleData.tar
