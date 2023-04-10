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
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/terraform-vm']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/shivamanga0609/feature-test']]])
            }
        }

        stage('Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Apply') {
            steps {
                sh 'terraform apply'
            }
        }
    }
}


