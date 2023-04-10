//pipeline {
//    agent any
//    
//    tools {
//        terraform "terraform"
//   }
//    options {
//        ansiColor('xterm')
//    }
//
//    environment {
//        GIT_URL = "https://github.com/shivamanga0609/feature-test"
//    }
//    
//    stages {
//
//        stage ("Checkout") {
//           steps {
//                script {
//                    checkout([$class: 'GitSCM', branches: [[name: 'terraform-vm']], extensions: [], userRemoteConfigs: [[url: "${GIT_URL}"]]])
//                }
//            }
//        }
//
//        stage ("Init") {
//            steps {
//                script {
//                      sh 'terraform init'
//                }
//            }
//        }
//
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
    
    stages {
        stage('Checkout') {
            steps {
                // Clone the GitHub repository
                git branch: 'terraform-vm', credentialsId: 'github-credentials', url: 'https://github.com/shivamanga0609/feature-test'
            }
        }
        
        stage('Build') {
            steps {
                // Run the build command
                bat 'npm install'
                bat 'npm run build'
            }
        }
        
        stage('Deploy') {
            steps {
                // Deploy the built code to the target server
                bat 'xcopy /Y /S /I build\\* C:\\inetpub\\wwwroot\\'
            }
        }
    }
    
    post {
        success {
            echo 'Deployment successful!'
        }
        
        failure {
            echo 'Deployment failed!'
        }
    }
}

