pipeline {
    agent any
      stages {
        stage("checkout"){
            steps {
                checkout scm
            }
        }
        stage("Build"){
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
                    ls -la
                    git push origin origin/dev:qa
                  '''                
                  }                      
              } 
      }
      post {
        failure {
            script {
                currentBuild.result = 'FAILURE'
            }
        }

        always {
            step([$class: 'Mailer',
                notifyEveryUnstableBuild: true,
                recipients: "rohitiacr203@gmail.com",
                sendToIndividuals: true])
           }
        }          
 }
