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
 
 stages {
 stage(‘checkout’) {
 steps {
 git branch: ‘terraform-vm’, url: ‘git@https://github.com/shivamanga0609/feature-test’
 
 }
 }
 stage(‘Set Terraform path’) {
 steps {
 script {
 def tfHome = tool name: ‘Terraform’
 env.PATH = “${tfHome}:${env.PATH}”
 }
 sh ‘terraform — version’
 
 
 }
 }
 
 stage(‘Provision infrastructure’) {
 
 steps {
 dir(‘dev’)
 {
 sh ‘terraform init’
 sh ‘terraform plan -out=plan’
 // sh ‘terraform destroy -auto-approve’
 sh ‘terraform apply plan’
 }
 
 
 }
 }
 
 
 
 }
}
