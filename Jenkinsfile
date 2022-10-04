pipeline {
    agent any 
    stages {
        stage('init&plan') { 
            steps {
               pwd usr/local/bin/
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
