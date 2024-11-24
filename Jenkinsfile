pipeline {
    agent any

    tools {
        // Specify Maven tool name configured in Jenkins Global Tool Configuration
        maven 'Maven'
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull code from the repository
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Build the project with Maven
                sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                // Run tests with Maven
                sh 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                // Add deployment steps here if needed
                echo 'Deploying application...'
            }
        }
    }

    post {
        always {
            // Actions to perform after every build
            echo 'Cleaning up...'
        }
        success {
            // Actions to perform if the build is successful
            echo 'Build and tests completed successfully!'
        }
        failure {
            // Actions to perform if the build fails
            echo 'Build or tests failed.'
        }
    }
}
