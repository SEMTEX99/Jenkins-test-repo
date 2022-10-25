pipeline {
    agent any
    environment {
        PATH = "/usr/share/maven:$PATH"
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
                sh 'docker build -t sinisateletabis/devopstest .'
            
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
//test the deploy 