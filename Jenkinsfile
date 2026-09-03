pipeline {

    agent any

    stages {

        stage('Show Workspace') {

            steps {

                powershell '''
                Write-Host "Current Folder:"
                Get-Location

                Write-Host ""
                Write-Host "Files:"

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
        stage('Show Report Contents') {

    steps {

        powershell '''

        Write-Host ""
        Write-Host "=== PrinterStatus.csv ==="
        Write-Host ""

        Get-Content .\\PrinterStatus.csv

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
