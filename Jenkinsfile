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
                sh "docker run -d -p:4020 --name codeAssesment codeAssesment"
                sh "docker logs codeAssesment"
            }
        }
        stage("Launch Info"){
            steps {
                echo "http://13.126.236.71:4020"
            }
        }
    }
}

