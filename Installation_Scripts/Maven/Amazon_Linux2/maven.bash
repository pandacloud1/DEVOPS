# REF: https://docs.aws.amazon.com/neptune/latest/userguide/iam-auth-connect-prerq.html
sudo wget https://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
sudo yum install java-1.8.0-devel -y
sudo /usr/sbin/alternatives --config java
# (When prompted, enter the number for Java 1.8)
