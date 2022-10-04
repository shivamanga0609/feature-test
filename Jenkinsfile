pipeline {
    agent any 
    stages {
        stage('init&plan') { 
            steps {
               sh 'terraform init'
               sh 'terraform plan'
            }
        }
        stage('deploy') {
            steps {
                sh 'terraform apply'
            }
        }
    }
}
