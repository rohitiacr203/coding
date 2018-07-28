pipeline {
    agent any
      stages {
        stage("checkout"){
            steps {
                checkout scm
                gitpath=
            }
        }
        stage("gradle-build"){
            steps {
                
                sh '''gradle wrapper
                 gradlew build'''
            }
        }
     }
}
