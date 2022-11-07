pipeline {
    agent {
        label 'terraform'
    }

    environment {
        AWS_ACCESS_KEY_ID = credentials('terraform-secrety-key')
        AWS_SECRET_ACCESS_KEY = credentials('terraform-secret-access-key')
        BUCKET_SIZE_LIMIT = 2097152 // 20 MiB in bytes 20 * 1024 * 1024
    }

    options {
        timestamps()
        ansiColor('xterm')
    }

    triggers { 
        cron('*/10 * * * *') 
    }

    stages {
        stage('Check bucket size in bucket') {
            steps {
                dir('infra') {
                    sh '''
                        BUCKET_DEV=$(aws s3 ls | grep acme | cut -d " " -f 3)
                        [[ $(aws s3 ls s3://"${BUCKET_DEV}" --recursive  --summarize | tail -1 | cut -d : -f 2) -gt ${BUCKET_SIZE_LIMIT} ]] && \
                        aws s3 rm s3://"${BUCKET_DEV}" --recursive || \
                        echo "Limit of ${BUCKET_SIZE_LIMIT} bytes has not been reached"
                    '''
                }
            }
        }
     }
}
