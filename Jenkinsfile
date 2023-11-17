pipeline {
    agent any
    
    environment {
        SONARQUBE_HOME = tool name: 'sonar-scanner', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: '51771c1c-dbef-414a-8cde-6be9356e1e71', url: 'https://github.com/cloudeq-EMU-ORG/ceq-mcd-poc-jenkinstogithub.git'
            }
        }
        
        
        
        stage('Quality Gate') {
            steps {
                script {
                    def scannerHome = tool name: 'sonar-scanner', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
                    
                    withSonarQubeEnv('sonar') {
                        sh """
                            ${scannerHome}/bin/sonar-scanner \
                            -Dsonar.projectKey=jenkins-migration \
                            -Dsonar.sources=Dotnet/awesomeMVC/ \
                            -Dsonar.host.url=http://13.235.113.34:9000\
                            -Dsonar.login=admin\
                            -Dsonar.password=admin@12345
                        """
                    }
                    
                    // You can customize the scanner options based on your project
                }
            }
        }
    }
    
    // post {
    //     failure {
    //         // You can customize actions to take on build failure
    //     }
    // }
}
// node {
//   stage('SCM') {
//     git branch: 'main', credentialsId: '51771c1c-dbef-414a-8cde-6be9356e1e71', url: 'https://github.com/cloudeq-EMU-ORG/ceq-mcd-poc-jenkinstogithub.git'
//   }
//   stage('SonarQube Analysis') {
//     def scannerHome = tool 'SonarScanner for MSBuild'
//     withSonarQubeEnv() {
//       sh "dotnet ${scannerHome}/SonarScanner.MSBuild.dll begin /k:\"jenkins-migration\""
//       sh "dotnet build"
//       sh "dotnet ${scannerHome}/SonarScanner.MSBuild.dll end"
//     }
//   }
// }
