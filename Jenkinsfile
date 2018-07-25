pipeline {
    agent any
    stages {
        stage("checkout"){
            steps {
                checkout scm
            }
        }
        stage("static code analysis"){
            steps {
                withSonarQubeEnv('sonarqube') {
                    sh './gradlew --info sonarqube'
                }
            }
        }
       stage("build docker image"){
            steps {
                sh "docker build -t codeAssesment ."
            }
        }
        
        stage("env cleanup"){
            steps {
                sh returnStatus: true, script: 'docker rm -f codeAssesment'
                sh "docker image prune -f"
            }
        }
        stage("Launch service"){
            steps {
                sh "docker run -d -p $CR_APP_ZERV_PORT:$CR_APP_ZERV_PORT --name zervplatformv5api zervplatformv5api"
                sh "docker logs zervplatformv5api"
            }
        }
        stage("Launch Info"){
            steps {
                echo "http://${ip}:$CR_APP_ZERV_PORT"
            }
        }
    }
}

