pipeline {
    agent any

    tools {
        maven "Maven3"
        jdk "jdk17"
    }

    environment {
        IMAGE_NAME = "zormatiiii/student-management"
        DOCKER_HUB_CREDS = credentials('docker-hub-creds') // Securely fetch credentials
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
                // Using shell commands instead of the 'docker' DSL
                sh """
                    # Login to Docker Hub
                    echo "${DOCKER_HUB_CREDS_PSW}" | docker login -u "${DOCKER_HUB_CREDS_USR}" --password-stdin
                    
                    # Build the image
                    docker build -t ${IMAGE_NAME}:${env.BUILD_NUMBER} -t ${IMAGE_NAME}:latest .
                    
                    # Push tags
                    docker push ${IMAGE_NAME}:${env.BUILD_NUMBER}
                    docker push ${IMAGE_NAME}:latest
                    
                    # Logout
                    docker logout
                """
            }
        }

        stage("Deploy") {
            steps {
                sh "docker rm -f student-management || true"
                sh "docker run -d -p 8089:8089 --name student-management ${IMAGE_NAME}:latest"
            }
        }
    }
}
