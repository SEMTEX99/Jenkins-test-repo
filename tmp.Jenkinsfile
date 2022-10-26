pipeline {
    agent any
    environment {
        PATH = "/usr/share/maven:$PATH"
    }
    stages{
        stage('connect to ssh') {
            steps {
                 script {
                     sshagent(credentials : ['ssh2dockermaster']) {
                        sh "echo pwd"
                        sh 'ssh -t adminuser@20.229.239.213 -o StrictHostKeyChecking=no'
                        sh "echo pwd"
                        sh "echo 'test da li radi'"
                     }
                    if(fileExists('docker-compose')) {
                        sh "echo 'skipped docker-compose already exsists'"
                        sh "cd docker-compose"
                        sh "rm -f -r docker-compose.yml"
                        sh "wget https://raw.githubusercontent.com/SEMTEX99/Jenkins-test-repo/main/docker-compose.yml"
                        }
                    else {
                        sh "mkdir docker-compose"
                        sh "cd docker-compose"
                        sh "wget https://raw.githubusercontent.com/SEMTEX99/Jenkins-test-repo/main/docker-compose.yml"
                        }
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u sinisateletabis -p ${dockerhubpwd}'
                    } 
                    sh 'docker stack deploy --compose-file docker-compose.yml myapp'                    
                    }
                }
            }
        }
}
            