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
                    sh 'docker build -t $DOCKER_HUB_REPO .'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    sh 'docker run $DOCKER_HUB_REPO npm test'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh '''
                    docker stop mynodeapp_container || true
                    docker rm mynodeapp_container || true
                    docker run -d -p 8081:3000 --name mynodeapp_container $DOCKER_HUB_REPO
                    '''
                }
            }
        }
    }
}
