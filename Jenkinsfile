pipeline {
    agent any 
    stages {
        stage('init&plan') { 
            steps {
               terraform init
               terraform plan 
            }
        }
        stage('deploy') {
            steps {
                terraform apply
            }
        }
    }
}
