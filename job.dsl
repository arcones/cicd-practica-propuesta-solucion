multibranchPipelineJob('Infra Deployment') {
    branchSources {
        git {
            id('1')
            remote('git@github.com:arcones/cicd-practica-propuesta-solucion.git')
            credentialsId('ssh-github-key')
        }
    }
    factory {
        workflowBranchProjectFactory {
            scriptPath('infra.Jenkinsfile')
        }
    }
}

multibranchPipelineJob('Cron') {
    branchSources {
        git {
            id('1')
            remote('git@github.com:arcones/cicd-practica-propuesta-solucion.git')
            credentialsId('ssh-github-key')
        }
    }
    factory {
        workflowBranchProjectFactory {
            scriptPath('cron.Jenkinsfile')
        }
    }
}
