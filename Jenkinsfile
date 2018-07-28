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
                        export GRADLE_HOME=/opt/gradle/gradle-4.9/
                        export PATH=$PATH:$GRADLE_HOME/bin'
                        gradle wrapper
                        gradlew build
                        '''
            }
        }
     }
}
