pipeline {
    agent any
    stages {
        stage("checkout"){
            steps {
                checkout scm
            }
        }
        
       stage("build docker image"){
            steps {
                sh "docker build -t codeassesment ."
            }
        }
        
        stage("env cleanup"){
            steps {
                sh returnStatus: true, script: 'docker rm -f codeassesment'
                sh "docker image prune -f"
            }
        }
        stage("Launch service"){
            steps {
                sh "docker run -d -p:4020 --name codeassesment codeassesment"
                sh "docker logs codeassesment"
            }
        }
        stage("Launch Info"){
            steps {
                echo "http://13.126.236.71:4020"
            }
        }
    }
}

