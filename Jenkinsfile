pipeline {
    agent any
      stages {
        stage("checkout"){
            steps {
                step([$class: 'WsCleanup'])
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
            steps {
                withSonarQubeEnv('sonarqube') {
                  sh './gradlew --info sonarqube'
                }
            }
        }
        stage('Promote code to Preprod branch') {
            steps {
                  sh '''
                    pwd
                    git status
                    git push -f origin HEAD:preprod
                  '''
                }
         }           
     }
}
