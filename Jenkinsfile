pipeline {
    agent any
    def server = Artifactory.server "SERVER_ID"
    // Create an Artifactory Gradle instance.
    def rtGradle = Artifactory.newGradleBuild()
    def buildInfo
    stages {
        stage("checkout"){
            steps {
                checkout scm
            }
        }
        
       stage("build docker image"){
            steps {
                /**sh " sudo docker build -t ."*/
                sh " docker build -f Dockerfile -t codeassesment ."
            }
        }
        
        stage('Artifactory configuration') {
        // Tool name from Jenkins configuration
        rtGradle.tool = "Gradle_4.9"
        // Set Artifactory repositories for dependencies resolution and artifacts deployment.
        rtGradle.deployer repo:'ext-release-local', server: server
        rtGradle.resolver repo:'remote-repos', server: server
    }

    stage('Gradle build') {
        buildInfo = rtGradle.run rootDir: "coding_assesment/", buildFile: 'build.gradle', tasks: 'clean artifactoryPublish'
    }

    stage('Publish build info') {
        server.publishBuildInfo buildInfo
    }
        
        stage("env cleanup"){
            steps {
                sh " sudo -S docker rm -f codeassesment"
                sh " sudo -S docker image prune -f"
            }
        }
        stage("Launch service"){
            steps {
                sh " sudo docker run -d -p:4020 --name codeassesment codeassesment"
                sh " sudo docker logs codeassesment"
            }
        }
        stage("Launch Info"){
            steps {
                echo "http://13.126.236.71:4020"
            }
        }
    }
}

