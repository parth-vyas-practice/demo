pipeline {
    agent { 
        node {
            label 'kubernetes-host' 
        }
    }
    environment {
        APP_NAME = "demo-app"
        ECR_REPO = "test"

        TAG = "${BUILD_ID}-${GIT_COMMIT}"

        APP_IMAGE = "${ECR_REPO}:${TAG}"
    }
    stages {
        stage('build'){
            steps{
                script{
                    sh """
                    mvn clean install
                    cp target/SpringBootMavenExample-1.3.5.RELEASE.war ./app.war
                    """
                    
                }
            }
        }
        stage('build-docker-image'){
            steps{
                script{
                    sh """
                    docker build -t ${APP_IMAGE} .
                    """
                    
                }
            }
        }
        stage('push-docker-image'){
            steps{
                script{  
                    sh """ 
                    echo 'push image stage'
                    """           
                }
            }
        }
        stage('deploy'){
            steps{
                script{
                    sh"""
                    bash ./helm-deployment.sh ${APP_NAME} nginx:latest
                    """
                }
            }
        }
        //delete docker images so that next time it does not use cache
        // stage('cleanup'){
        //     steps{
        //         script{
        //             sh"""
        //             docker rmi ${APP_IMAGE}
        //             """
        //             cleanWs()
        //         }
        //     }
        // }
    }
}
