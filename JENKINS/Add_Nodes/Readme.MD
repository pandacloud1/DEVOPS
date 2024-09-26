# ADD WINDOWS LAPTOP AS A NODE IN JENKINS

![Jenkins Windows Node Setup](https://github.com/pandacloud1/DEVOPS/blob/main/JENKINS/Add_Nodes/Jenkins-Windows.png)


## 1. Create EC2 Instance
- Allow ports: 22, 80, 8080, 50000.

## 2. Install & Start Jenkins
- Follow the installation instructions for Jenkins on your EC2 instance.

## 3. Allow Port 50000 in Jenkins Server
- Navigate to: `Manage Jenkins` → `Security` → `Agents`
- Set `TCP port for inbound agents` to `Fixed: 50000`.

## 4. Add Your Windows Laptop as a Node
- Go to: `Manage Jenkins` → `Nodes` → `New Node`
- Enter a name (e.g., `windows-agent`).
- Select Type: `Permanent Agent` → Click `Create`.
- Configure the following:
  - **Remote Root Directory**: `C:\Jenkins`
  - **Labels**: Enter a label (e.g., `windows-agent`)
  - **Launch method**: Select `Launch agent by connecting it to the controller`
- Click `Save`.
- Open the created Node → Click on `Status` → Copy the command from "Run from agent command line: (Windows)".

## 5. Configure Windows Laptop as an Agent
- Ensure Java 17 or Java 21 is installed on your Windows machine.
- Open Command Prompt on your Windows laptop and paste the command from Step 4. The output should indicate "Connected".

## 6. Run Pipeline in Jenkins Server to Create Test File on Your Windows Laptop
- Check the Jenkins Node console to see if the agent (windows-agent) is shown.
- Run a pipeline to create a test file on your Windows laptop
- Check if the file is created in C:\Jenkins\workspace\test-pipeline/test-file

```groovy
pipeline {
    agent { label 'windows-agent' }  // Specify the Windows agent
    stages {
        stage('Create Test File') {
            steps {
                script {
                    // Create a file named 'test-file.txt'
                    bat 'echo This is a test file > test-file.txt'
                }
            }
        }
    }
}


