pipeline {
    agent any
    options {
        ansiColor('xterm')
    }

    environment {
        GIT_URL = "https://github.com/shivamanga0609/feature-test"
    }

    stages {

        stage ("Checkout") {
            steps {
                script {
                    checkout([$class: 'GitSCM', branches: [[name: 'terraform-vm']], extensions: [], userRemoteConfigs: [[url: "${GIT_URL}"]]])
                }
            }
        }

        stage ("Init") {
            steps {
                script {
                   
                        terraform init
                   
                }
            }
        }

        stage ("Plan") {
            steps {
                script {
                    
                        terraform plan
                    
                }
            }
        }   
    }
}


