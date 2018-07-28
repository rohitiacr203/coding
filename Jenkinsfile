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
                scripts{
                    sh '''gradle wrapper
                        gradlew build'''
                }
            }
        }
     }
}
