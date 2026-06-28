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
        stage('Select or Create Workspace') {
            steps {
                sh """
                    terraform workspace select ${params.ENVIRONMENT} || \
                    terraform workspace new ${params.ENVIRONMENT}
                """
            }
        }

        

        stage('Terraform Plan') {
            steps {
                sh '''
            terraform plan --var-file=${ENVIRONMENT}.tfvars
        '''
        script {
            env.PLAN_SUMMARY = readFile('plan_summary.txt').trim()
        }
            }
        }

        stage('Review Plan') {
            steps {
                input(
                    message: """Terraform Plan Review the full console output if needed, then click Apply.""",
                    ok: 'Apply'
                )
            }
        }

        stage('Terraform Apply') {
            steps {
                sh "terraform apply -auto-approve -var-file=${params.ENVIRONMENT}.tfvars "
            }
        }
    }

    post {
    success {
        emailext(
            subject: "SUCCESS: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
            body: """
                <h2>Terraform Pipeline Succeeded</h2>

                <p><b>Job:</b> ${env.JOB_NAME}</p>
               
                <p><b>Build:</b> #${env.BUILD_NUMBER}</p>
                <p><b>Workspace:</b> ${params.ENVIRONMENT}</p>

                <p><a href="${env.BUILD_URL}">Open Build</a></p>
            """,
            mimeType: 'text/html',
            to: 'mhmdalsyd2015@gmail.com'
        )
    }

    failure {

    echo "Pipeline failed!"

    emailext(
        to: 'mhmdalsyd2015@gmail.com',
        subject: "Build Failed: ${env.JOB_NAME}",
        body: """Job: ${env.JOB_NAME}

Build Number: ${env.BUILD_NUMBER}

Status: FAILED

Build URL:
${env.BUILD_URL}
"""
    )

}
}
}
