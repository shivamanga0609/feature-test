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

pipeline{
    agent any
    tools {
        terraform 'terraform'
    }
     stages{
        stage('Git Checkout'){
            steps{
                git branch: 'terraform-vm', url: 'https://github.com/shivamanga0609/feature-test'
            }
        }
        
        stage('Terraform init'){
            steps{
             dir("terraform-aws-ec2-with-vpc") {
                sh 'terraform init'
            }
         }
       }
        
        stage('Terraform plan'){
            steps{
             dir("terraform-aws-ec2-with-vpc") {
                sh 'terraform plan'
            }
         }
       } 
        stage('Terraform apply'){
            steps{
             dir("terraform-aws-ec2-with-vpc") {
                sh 'terraform apply --auto-approve'
            }
        }
    }
  }
}
