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
                        echo 'export GRADLE_HOME=/opt/gradle/gradle-4.9/' >> $HOME/.bashrc
                        echo 'export PATH=$PATH:$GRADLE_HOME/bin' >> $HOME/.bashrc
                        gradle wrapper
                        gradlew build
                        '''
            }
        }
     }
}
