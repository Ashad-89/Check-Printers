pipeline {

    agent any

    stages {

        stage('Show Workspace') {

            steps {

                powershell '''
                pwd
                Get-ChildItem
                '''

            }

        }

        stage('Run Script') {

            steps {

                powershell '''
                .\\Check-Printers.ps1
                '''

            }
            
    post {

        success {
            archiveArtifacts artifacts: 'PrinterStatus.csv'
        }

    }

}
