pipeline {
    agent any 
    stages {
        stage(‘Checkout’) {
            steps {
                checkout([$class: ‘Git’, branches: [[name: ‘*/terraform-vm’]], extensions: [], userRemoteConfigs: [[url: ‘https://github.com/shivamanga0609/feature-test.git‘]]])
            }
        }
        stage('init&plan') { 
            steps {
               dir("dev") {
                  sh "pwd"
                }
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
