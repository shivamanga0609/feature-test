//pipeline {
//    agent any
    
//    tools {
//        terraform "Terraform"
//   }
//    options {
//        ansiColor('xterm')
//    }

//    environment {
//        GIT_URL = "https://github.com/shivamanga0609/feature-test"
//    }
    
//    stages {

//        stage ("Checkout") {
//           steps {
//                script {
//                    checkout([$class: 'GitSCM', branches: [[name: 'terraform-vm']], extensions: [], userRemoteConfigs: [[url: "${GIT_URL}"]]])
//                }
//            }
//        }

//        stage ("Init") {
//            steps {
//                script {
//                      sh 'terraform init'
//                }
//            }
//        }

//        stage ("Plan") {
//            steps {
//                script {
//                     sh 'terraform plan'
//                    
//                }
//            }
//        }   
//    }
//}

pipeline {
   agent any
   tools {
      terraform "terraform"
   }
   stages {
      stage('Terraform Init') {
         steps {
            withTerraform {
               terraform {
                  version = "1.0.0"
               }
               init()
            }
         }
      }
      // Add additional stages for apply, plan, etc.
   }
}
