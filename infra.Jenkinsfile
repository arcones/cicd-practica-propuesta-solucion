pipeline { 
    agent {
        label 'terraform'
    }

    environment {
        AWS_ACCESS_KEY_ID = credentials('terraform-secrety-key')
        AWS_SECRET_ACCESS_KEY = credentials('terraform-secret-access-key')
    }

    options {
        timestamps()
        ansiColor('xterm')
    }

    stages {

        stage('Init') {
            steps {
                dir('infra') {
                    sh 'terraform init'
                }
            }
        }
        stage('Plan') {
            steps {
                dir('infra') {
                    sh 'terraform plan'
                }
            }
        }
        stage('Apply') {
            steps {
                dir('infra') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
