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

        }
        
    stage('Show Report') {

    steps {

        powershell '''

        Write-Host "Report Exists?"

        Get-ChildItem *.csv

        '''

    }

}
    }

    post {

        success {

            archiveArtifacts(
                artifacts: 'PrinterStatus.csv',
                fingerprint: true
            )

        }

    }

}
