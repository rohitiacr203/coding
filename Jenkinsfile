pipeline {
    agent any
      stages {
        stage("checkout"){
            steps {
                checkout scm
            }
        }
        stage("Build"){
            try {
                steps {
                    sh '''
                        export GRADLE_HOME=/opt/gradle/gradle-4.9
                        export PATH=$PATH:$GRADLE_HOME/bin
                        gradle wrapper
                        ./gradlew build
                        '''
                    }
                } catch (e) {
                currentBuild.result = "FAILED"
                notifyFailed()
                throw e
              }
            
            def notifyFailed() {
              emailext (
                  subject: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                  body: """<p>FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
                    <p>Check console output at "<a href="${env.BUILD_URL}">${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>"</p>""",
                  recipientProviders: [[$class: 'DevelopersRecipientProvider']]
                )
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
    }
