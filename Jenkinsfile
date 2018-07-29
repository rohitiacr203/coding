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
                  // requires SonarQube Scanner for Gradle 2.1+
                  // It's important to add --info because of SONARJNKNS-281
                  sh './gradlew --info sonarqube'
                }
            }
        }
        stage('Promote code to QA branch') {
            steps {
                  sh '''
                    touch .gitignore
                    echo "Jenkinsfile" > .gitignore
                    echo "Dockerfile" >> .gitignore
                    echo "docker-compose.yml" >> .gitignore
                    echo "build/" >> .gitignore
                    echo "gradle/" >> .gitignore
                    echo ".gradle" >> .gitignore
                    echo "gradle*" >> .gitignore
                    git add .gitignore
                    git commit -am "Pushing code to QA"
                    git push origin qa
                  '''
                }
         }           
     }
}
