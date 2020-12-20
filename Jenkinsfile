pipeline {
    agent none
    parameters {
        choice(name: 'ENV', choices: ['dev', 'qa'], description: 'Select environment to deploy')
    }
    stages {
        stage('plan') {
            agent any
            steps {
                script {
                    sh"""
                    ansible-playbook ansible-playbooks/main.yml --extra-vars "ENV=${ENV} EXECUTION_TYPE=plan"
                    """
                }    
            }
        }
        stage('approval'){
            agent none
            steps{
                script{
                    input id: 'Deploy', message: 'proceed to deployment?', submitter: 'admin'
                }
            }
        }
        stage('deploy'){
            agent any
            steps{
                script{
                    sh"""
                    ls -l terraform-code/
                    ansible-playbook ansible-playbooks/main.yml --extra-vars "ENV=${ENV} EXECUTION_TYPE=apply"
                    """
                }
            }
        }
    }
}