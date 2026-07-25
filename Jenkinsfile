pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'pasindusheshan/gscomp336_2025'
    }

    stages {
        // Stage 1: Checkout
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        // Stage 2: Windows Batch command (mvnw.cmd) එකෙන් Build කිරීම
        stage('Build & Test') {
            steps {
                bat 'mvnw.cmd clean package -DskipTests'
            }
        }

        // Stage 3: Windows Batch එකෙන් Docker Build කිරීම
        stage('Docker Build') {
            steps {
                bat "docker build -t %DOCKER_HUB_REPO%:%BUILD_NUMBER% ."
                bat "docker build -t %DOCKER_HUB_REPO%:latest ."
            }
        }

        // Stage 4: Docker Hub Push කිරීම
        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat "docker login -u %DOCKER_USER% -p %DOCKER_PASS%"
                    bat "docker push %DOCKER_HUB_REPO%:%BUILD_NUMBER%"
                    bat "docker push %DOCKER_HUB_REPO%:latest"
                }
            }
        }
    }

    post {
        always {
            bat 'docker logout'
        }
    }
}