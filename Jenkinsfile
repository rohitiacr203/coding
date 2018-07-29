pipeline {
    agent any
      stages {
        stage("checkout"){
            steps {
                checkout scm
            }
        }
        stage("gradle-build"){
            steps {
                    sh '''
                        export GRADLE_HOME=/opt/gradle/gradle-4.9
                        export PATH=$PATH:$GRADLE_HOME/bin
                        gradle wrapper
                        ./gradlew build
                        '''
            }
        }
      stage('SonarQube analysis') {
        withSonarQubeEnv('sonarscanner') {
          // requires SonarQube Scanner for Gradle 2.1+
          // It's important to add --info because of SONARJNKNS-281
          sh './gradlew --info sonarqube'
        }
      }       
     }
}
