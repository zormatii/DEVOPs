pipeline {
    agent any

    tools {
        maven "M2_HOME"
        jdk "JAVA_HOME"
    }

    environment {
        IMAGE_NAME = "zormatiiii/student-management" // Your Docker Hub repo
        DOCKER_HUB_CREDS = "docker-hub-creds"
    }

    stages {

        stage("Build & Test") {
            steps {
                sh "mvn clean package"
                junit 'target/surefire-reports/*.xml'
            }
        }

        stage("Docker Build & Push") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com/', "${DOCKER_HUB_CREDS}") {
                        // Build the image using your Dockerfile
                        def image = docker.build("${IMAGE_NAME}:${env.BUILD_NUMBER}")

                        // Push with build number tag
                        image.push()

                        // Push latest tag
                        image.push("latest")
                    }
                }
            }
        }

        stage("Deploy") {
            steps {
                // Stop old container if exists
                sh "docker rm -f student-management || true"

                // Run the latest image
                sh "docker run -d -p 8089:8089 --name student-management ${IMAGE_NAME}:latest"
            }
        }
    }
}
