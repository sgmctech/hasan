pipeline{
    agent any
    environment{
        DOCKERHUB_CREDENTIALS=credentials('dockerhub')
    }
    stages{
        stage('checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/sgmctech/hasan.git'
            }
        }
        stage('compile code, run static code anelysis and build image'){
            steps{
                sh 'docker build  --output type=local,dest=./out -t hello-world .'
            }
        }
        stage('login'){
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push'){
            steps{
                sh 'docker push rajeevtcsranjan/demopush:latest'
            }
        }
    }
}
