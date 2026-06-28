pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('access')
        AWS_SECRET_ACCESS_KEY = credentials('secret')
    }

    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev', 'test', 'prod'],
            description: 'Select the environment'
        )
    }

    stages {
        stage('terraform init') 
            steps {
                sh 'terraform init'
            }
        }

        stage('terraform plan') {
            steps {
                sh 'terraform plan --var-file ${params.ENVIRONMENT}'
            }
        }
        stage('Review Plan') {
            steps {
                input(
                    message: 'Review the Terraform plan in the console output, then click Apply.',
                    ok: 'Apply'
                )
            }
        }
        stage('terraform apply') {
            steps {
                sh 'terraform apply --var-file ${params.ENVIRONMENT} -auto-approve'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }

