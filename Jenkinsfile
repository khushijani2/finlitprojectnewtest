pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Pull the latest changes from the repository
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Build the project
                sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                // Run tests
                sh 'mvn test'
            }
        }
    }

    post {
        success {
            echo 'Build and Tests completed successfully.'
        }
        failure {
            echo 'Build or Tests failed.'
        }
    }
}
