pipeline{
        agent any
        environment{
            PORT = 8080
        }
        stages{
            stage('Build images on Jenkins'){
                steps{
                    script {
                        if (env.GIT_BRANCH == 'origin/main') {
                            sh '''
                            echo "Build not required in main"
                            '''
                        } else if (env.GIT_BRANCH == 'origin/dev') {
                            sh '''
                            docker build -t mtkg/lbg-python-sprint2:latest -t mtkg/lbg-python-sprint2:v$BUILD_NUMBER .
                            docker build -t gcr.io/lbg-mea-14/mk-lbg-python-sprint2:latest -t gcr.io/lbg-mea-14/mk-lbg-python-sprint2:v$BUILD_NUMBER .
                            '''
                        } else {
                            sh '''
                            echo "Unrecognised branch"
                            '''
                        }
		            }
                }
            }
            stage('Push images to Docker Hub'){
                steps{
                    script {
                        if (env.GIT_BRANCH == 'origin/main') {
                            sh '''
                            echo "Docker push not required in main"
                            '''
                        } else if (env.GIT_BRANCH == 'origin/dev') {
                            sh '''
                            docker push mtkg/lbg-python-sprint2:latest
                            docker push mtkg/lbg-python-sprint2:v$BUILD_NUMBER
                            '''
                        } else {
                            sh '''
                            echo "Unrecognised branch"
                            '''
                        }
		            }
                }
            }
            stage('Push images to GCR'){
                steps{
                    script {
                        if (env.GIT_BRANCH == 'origin/main') {
                            sh '''
                            echo "GCR push not required in main"
                            '''
                        } else if (env.GIT_BRANCH == 'origin/dev') {
                            sh '''
                            docker push gcr.io/lbg-mea-14/mk-lbg-python-sprint2:latest
                            docker push gcr.io/lbg-mea-14/mk-lbg-python-sprint2:v$BUILD_NUMBER
                            '''
                        } else {
                            sh '''
                            echo "Unrecognised branch"
                            '''
                        }
		            }
                }
            }
            stage('Clean up old images on Jenkins'){
                steps{
                    script {
                        if (env.GIT_BRANCH == 'origin/main') {
                            sh '''
                            echo "Clean-up not required in main"
                            '''
                        } else if (env.GIT_BRANCH == 'origin/dev') {
                            sh '''
                            docker rmi mtkg/lbg-python-sprint2:latest
                            docker rmi mtkg/lbg-python-sprint2:v$BUILD_NUMBER
                            docker rmi gcr.io/lbg-mea-14/mk-lbg-python-sprint2:latest
                            docker rmi gcr.io/lbg-mea-14/mk-lbg-python-sprint2:v$BUILD_NUMBER
                            '''
                        } else {
                            sh '''
                            echo "Unrecognised branch"
                            '''
                        }
		            }
                }
            }
            stage('Run the app'){
                steps{
                    script {
                        if (env.GIT_BRANCH == 'origin/main') {
                            sh '''
                            kubectl apply -f ./kubernetes -n production
                            kubectl rollout restart deployment flask-deployment -n production
                            '''
                        } else if (env.GIT_BRANCH == 'origin/dev') {
                            sh '''
                            kubectl apply -f ./kubernetes -n development
                            kubectl rollout restart deployment flask-deployment -n development
                            '''
                        } else {
                            sh '''
                            echo "Unrecognised branch"
                            '''
                        }
		            }
                }
            }
            stage('Run tests here'){
                steps{
                    sh '''
                    echo "no testing expected"
                    #python lbg.test.py
                    '''
                }
            }
        }
}