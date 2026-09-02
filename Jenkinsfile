pipeline {

    agent any

    stages {

        stage('List Files') {

            steps {

                powershell '''
                Get-ChildItem
                '''

            }

        }

        stage('Run Printer Script') {

            steps {

                powershell '''
                .\\Check-Printers.ps1
                '''

            }

        }

    }

}
