//pipeline {
//   agent any 
 //   stages {
//        stage(‘Checkout’) {
 //           steps {
//                checkout([$class: ‘GitSCM’, branches: [[name: ‘*/terraform-vm’]], extensions: [], userRemoteConfigs: [[url: ‘https://github.com/shivamanga0609/feature-test.git‘]]])
 //           }
//        }
//        stage('init&plan') { 
//            steps {
//               dir("dev") {
//                  sh "pwd"
//                }
//               sh 'terraform init'
 //              sh 'terraform plan'
 //           }
 //       }
 //       stage('deploy') {
 //           steps {
//                sh 'terraform apply'
 //           }
 //       }
 //   }
//}

pipeline {
    agent any
    tools {
       terraform 'terraform'
    }
    stages {
        stage('Git checkout') {
           steps{
                git branch: 'terraform-vm', url:https://github.com/shivamanga0609/feature-test'
            }
        }
        stage('terraform format check') {
            steps{
                sh 'terraform fmt'
            }
        }
        stage('terraform Init') {
            steps{
                sh 'terraform init'
            }
        }
        stage('terraform apply') {
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
    }

    
}
