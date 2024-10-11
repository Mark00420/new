pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'mark00420/mark420'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Mark00420/new.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t mark00420 .'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    sh 'docker run mark00420/mark420 npm test'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh '''
                    docker stop mynodeapp_container || true
                    docker rm mynodeapp_container || true
                    docker run -d -p 8081:3000 --name mynodeapp_container mark00420/mark420
                    '''
                }
            }
        }
    }
}
