## Create test pipeline

```groovy
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World!'
            }
        }
    }
}
```
