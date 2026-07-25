pipeline {
    agent any

    tools {
        // Jenkins ඇතුළේ configure කරපු JDK/Maven නාමයන්
        maven 'Maven3' 
    }

    environment {
        DOCKER_HUB_REPO = 'pasindusheshan/gscomp336_2025'
    }

    stages {
        // Stage 1: Git එකෙන් Code එක ගන්නවා
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        // Stage 2: Spring Boot Project එක Build කරලා Test කරනවා
        stage('Build & Test') {
            steps {
                sh './mvnw clean package -DskipTests'
            }
        }

        // Stage 3: Docker Image එක Build කරනවා
        stage('Docker Build') {
            steps {
                sh "docker build -t ${DOCKER_HUB_REPO}:${BUILD_NUMBER} ."
                sh "docker build -t ${DOCKER_HUB_REPO}:latest ."
            }
        }

        // Stage 4: Docker Hub එකට Image එක Push කරනවා
        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh "docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}"
                    sh "docker push ${DOCKER_HUB_REPO}:${BUILD_NUMBER}"
                    sh "docker push ${DOCKER_HUB_REPO}:latest"
                }
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }
}