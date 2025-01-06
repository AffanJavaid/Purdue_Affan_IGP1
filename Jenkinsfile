pipeline {
    tools {
        jdk 'java'
        maven 'maven'
    }

    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'master',
                    url: 'git@github.com:AffanJavaid/Purdue_Affan_IGP1.git',
                    credentialsId: '11995131-c5be-4c89-bc28-95cafc42fab6'

                // Stash the code for later use
                stash name: 'source-code', includes: '**'
            }
        }

        stage('Build and Test') {
            parallel {
                stage('Compile') {
                    steps {
                        // Unstash the code
                        unstash 'source-code'

                        echo 'Compiling...'
                        sh 'mvn compile'
                    }
                }

                stage('CodeReview') {
                    agent {
                        label 'worker1' // Specify the label for this worker
                    }
                    steps {
                        // Unstash the code
                        unstash 'source-code'

                        echo 'Running code review...'
                        sh 'mvn pmd:pmd'
                    }
                }

                stage('UnitTest') {
                    agent {
                        label 'worker2' // Specify the label for this worker
                    }
                    steps {
                        // Unstash the code
                        unstash 'source-code'

                        echo 'Running tests...'
                        sh 'mvn test'
                    }
                    post {
                        success {
                            junit 'target/surefire-reports/*.xml'
                        }
                    }
                }
            }
        }

        stage('Package') {
            steps {
                // Unstash the code
                unstash 'source-code'

                echo 'Packaging...'
                sh 'mvn package'
            }
        }
    }
}
