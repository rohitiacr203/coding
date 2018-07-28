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
                buildInfo = rtGradle.run rootDir: ".", buildFile: 'build.gradle', tasks: './gradlew build'
            }
        }
     }
}
