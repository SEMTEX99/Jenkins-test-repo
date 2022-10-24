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
            steps{
                sh 'mvn clean install'
            }            
        }
        stage('Build docker image'){
            steps{
                sh 'docker build -t devopstest/devops-integration .'
            
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
        } 
    }
}  