## Create test file in Windows

```groovy
// Pipeline Name: test-pipeline

pipeline {
    agent { label 'laptop' }  // Specify the Windows agent
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

// THIS WILL CREATE A TEST FILE IN WINDOWS LAPTOP 
// FILE PATH: C:\Jenkins\workspace\test-pipeline/test-file
```
