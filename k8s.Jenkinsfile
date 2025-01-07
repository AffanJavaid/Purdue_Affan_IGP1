

pipeline{
    tools{
        jdk 'java'
        maven 'maven'
    }
	agent any
      stages{
        stage('Checkout Code') {
            steps {
                // Use the SSH credentials to checkout the code
                git branch: 'master',
                    url: 'git@github.com:AffanJavaid/Purdue_Affan_IGP1.git',
                    credentialsId: '11995131-c5be-4c89-bc28-95cafc42fab6' // Replace with your actual credentials ID
            }
        } 
        
        stage('Build Package') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def imageName = 'my-tomcat-app'

                    // Build Docker image
                    sh "docker build -t ${imageName} ."

                    // Tag Docker image
                    sh "docker tag ${imageName} affanjavaid/${imageName}:latest"

                    // Push Docker image to the registry
                    sh "docker push affanjavaid/${imageName}:latest"
                }
            }
        }

        stage('Run Ansible Playbook') {
            steps {

                // Run the Ansible playbook
                sh 'ansible-playbook /home/ubuntu/ansible/k8s-playbook.yml'
            }
        }
	
          
      }
}
