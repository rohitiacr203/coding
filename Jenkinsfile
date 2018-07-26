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
                sh " docker build -f Dockerfile -t codeassesment ."
            }
        }
          
       stage("run unit test case"){
            steps { 
               checkout scm
                sh "cd src/test/" 
                sh "curl -L https://services.gradle.org/distributions/gradle-4.9-bin.zip -o gradle-4.9-bin.zip"
                sh "yum install -y unzip"
                sh "unzip gradle-4.9-bin.zip"
                sh "echo 'ENV GRADLE_HOME=/app/gradle-4.9' >> $HOME/.bashrc"
                sh "echo 'ENV PATH=$PATH:$GRADLE_HOME/bin' >> $HOME/.bashrc"
                sh "/bin/bash -c "source $HOME/.bashrc""
                sh "gradle build"
                sh "gradle clean test"
            }
        }
          
        stage("env cleanup"){
            steps {
                sh " sudo -S docker rm -f codeassesment"
                sh " sudo -S docker image prune -f"
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

