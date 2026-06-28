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

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stages {

        stage('select or create workspace') {
            steps {
                sh 'terraform workspace select ${params.ENVIRONMENT} || terraform workspace new ${params.ENVIRONMENT}'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh "terraform plan -var-file=${params.ENVIRONMENT}.tfvars"
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

        stage('Terraform Apply') {
            steps {
                sh "terraform apply -auto-approve -var-file=${params.ENVIRONMENT}.tfvars"
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
}
}
