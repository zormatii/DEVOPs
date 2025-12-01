pipeline {
    agent any
    tools {
        maven 'M2_HOME'
    }
    stages {
        // Optionnel : Retirez ce stage si vous n'en avez pas besoin. Jenkins clone déjà le dépôt.
        stage('GIT') {
            steps {
                git branch: 'master', url: 'https://github.com/zormatii/DEVOPs.git'
            }
        }
        
        stage('Build') {
            steps {
                // *** LA CORRECTION EST ICI ***
                dir('student-management') { 
                    sh 'mvn clean install'
                }
                // ****************************
            }
        }
    }
}
