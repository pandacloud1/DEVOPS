## Adding Nodes to Jenkins Master

### Create a Node (Install Java)
```hcl
# CREATE AN EC2 INSTANCE
resource "aws_instance" "node1" {
  ami                    = "ami-0360c520857e3138f"        # Ubuntu 24.04 (us-east-1)
  instance_type          = "t2.micro"
  key_name               = "my-key"                       # Replace with your actual key name
  vpc_security_group_ids = [aws_security_group.my-sg.id]  # Create this if not created already

  # INSTALL JAVA
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y openjdk-17-jdk
              java -version
              EOF

  tags = {
    Name = "Node1"
  }
}
```

### Generate the ssh key in Node1
```sh
sudo su -
```
```sh
ssh-keygen -t rsa
```

### Copy the public key within the Node
```sh
cd ~/.ssh
cat id_rsa.pub >> authorized_keys
```
```sh
# Get the private IP
hostname -i
```
```sh
# Get the private key <node1-private-key>
cat ~/.ssh/id_rsa
```

### Configure the Node in Jenkins
```
1. **Navigate to Jenkins Node Management**
   - Go to: `Manage Jenkins` → `Nodes` → `New Node`

2. **Create a New Node**
   - **Node Name**: `node1`
   - **Type**: `Permanent Agent`
   - Click `OK`

3. **Configure Node Details**
   - **Remote Root Directory**: `/home/jenkins`  
     _This directory will be created automatically if it doesn't exist._
   - **Labels**: `node1`
   - **Launch Method**: `Launch agents via SSH`
     - **Host**: `<Node1-PrivateIP>`
     - **Credentials**:
       - Click `Add`
       - **Kind**: `SSH Username with private key`
       - **ID**: `node1`
       - **Description**: `node1`
       - **Username**: `root`
       - **Private Key**: Paste contents of `<node1-private-key>`
     - **Host Key Verification Strategy**:  
       `Non verifying Verification Strategy`

4. **Save Configuration**

5. **Launch the Agent**
   - Go to the newly created node `node1`
   - Click `Launch agent`
   - Confirm that the connection is successful
```

### Test connection
```groovy
pipeline {
    agent { label 'node1' }
    
    stages {
        stage('First stage') {
            steps {
                sh "touch /home/jenkins/file1"
            }
        }
    }
}
```
