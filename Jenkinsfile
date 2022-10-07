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
                    sh """
                        terraform init
                    """
                }
            }
        }

        stage ("Plan") {
            steps {
                script {
                    sh """
                        terraform plan
                    """
                }
            }
        }   

        stage ("Apply") {
            steps {
                script {
                    sh """
                        terraform apply --auto-approve
                    """
                }
            }
        }             

        stage ("Destroy") {
            steps {
                script {
                    sh """
                        terraform destroy --auto-approve
                    """
                }
            }
        }

    }

}
