pipeline {
    agent any
    tools{
        maven 'maven_3_6_3'
    }
    stages{
        stage('Build Maven'){
            steps{
                git branch: 'main', url: 'https://github.com/SEMTEX99/Jenkins-test-repo.git'
            }
        }
        stage('maven install'){ 
            step{
                sh 'mvn clean install'
            }            
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t devopstest/devops-integration .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u sinisateletabis -p ${dockerhubpwd}'

}
                   sh 'docker push sinisateletabis/devopstest'
                }
            }
        /* jer sam glup pa ne znam sta ovo radi?????? pitaj Jurija
        }
        stage('Deploy to k8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'k8sconfigpwd')
                }
            }
        }
        */
    }
    }
}