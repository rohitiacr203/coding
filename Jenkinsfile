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
    }
}
