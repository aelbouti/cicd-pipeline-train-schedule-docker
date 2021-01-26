pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh './gradlew build --no-daemon'
                archiveArtifacts artifacts: 'dist/trainSchedule.zip'
            }
        }
        stage('Build Docker Image') {
			when {
				branch 'master'
			}
            steps {
                script {
                    app = docker.build("abderelb/train-schedule")
            }
        }
    }
		stage('Push docker image') {
            when {
				branch 'master'
			}
			steps {
                script {²
				docker.withregistry( 'https://hub.docker.com/', 'abderelb'){
                    app.push("train-schedule")
					app.push("${env.BUILD_NUMBER}")
					}
            }
        }
    }
		
}
}
