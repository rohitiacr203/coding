emailNotifications = 'rohitiacr203@gmail.com'
notificationSent    = false

def sendNotification(buildChanged)
{
    if (notificationSent)
    {
        return
    }
    notificationSent = true

    if (currentBuild.currentResult == 'SUCCESS')
    {
        // notify users when the build is back to normal
        mail to: emailNotifications,
            subject: "Build fixed: ${currentBuild.fullDisplayName}",
            body: "The build is back to normal ${env.BUILD_URL}"
    }
    else if ((currentBuild.currentResult == 'FAILURE') && buildChanged)
    {
        // notify users when the Pipeline first fails
        mail to: emailNotifications,
            subject: "Build failed: ${currentBuild.fullDisplayName}",
            body: "Something went wrong with ${env.BUILD_URL}"
    }
    else if ((currentBuild.currentResult == 'FAILURE'))
    {
        // notify users when they check into a broken build
        mail to: emailNotifications,
            subject: "Build failed (again): ${currentBuild.fullDisplayName}",
            body: "Something is still wrong with ${env.BUILD_URL}"
    }
}

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
                    ls -la
                    git push origin origin/dev:qa
                  '''
                
            }                      
        } 
          stage('email notification'){
          post {
            changed {
              sendNotification buildChanged:true
        }
          failure {
              sendNotification buildChanged:false
        }
      }          
   }
 }
}
