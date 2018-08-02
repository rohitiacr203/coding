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
            steps {
                withSonarQubeEnv('sonarqube') {
                  sh './gradlew --info sonarqube'
                }
            }
        }
         stage('Promote code to QA branch') {
            steps {
                  sh '''
                    git branch
                    git pull origin dev
                    git checkout qa
                    git push -f origin origin/dev:qa
                  '''
                
            }                      
        }       
     }
}
