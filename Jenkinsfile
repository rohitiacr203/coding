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
                /**sh " sudo docker build -t ."*/
                sh " docker build -f Dockerfile codeassesment ."
            }
        }
        
        stage("env cleanup"){
            steps {
                sh " sudo docker rm -f codeassesment"
                sh " sudo docker image prune -f"
            }
        }
        stage("Launch service"){
            steps {
                sh " sudo docker run -d -p:4020 --name codeassesment codeassesment"
                sh " sudo docker logs codeassesment"
            }
        }
        stage("Launch Info"){
            steps {
                echo "http://13.126.236.71:4020"
            }
        }
    }
}

