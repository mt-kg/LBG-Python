pipeline{
        agent any
        environment{
            PORT = 8080
        }
        stages{
            stage('Build images on Jenkins'){
                steps{
                    sh '''
                    docker build -t mtkg/lbg-python-sprint2:latest -t mtkg/lbg-python-sprint2:v$BUILD_NUMBER .
                    docker build -t gcr.io/lbg-mea-14/mk-lbg-python-sprint2:latest -t gcr.io/lbg-mea-14/mk-lbg-python-sprint2:v$BUILD_NUMBER .
                    '''
                }
            }
            stage('Push images to Docker Hub'){
                steps{
                    sh '''
                    docker push mtkg/lbg-python-sprint2:latest
                    docker push mtkg/lbg-python-sprint2:v$BUILD_NUMBER
                    '''
                }
            }
            stage('Push images to GCR'){
                steps{
                    sh '''
                    #push to GCR
                    docker push gcr.io/lbg-mea-14/mk-lbg-python-sprint2:latest
                    docker push gcr.io/lbg-mea-14/mk-lbg-python-sprint2:v$BUILD_NUMBER
                    '''
                }
            }
            stage('Clean up old images on Jenkins'){
                steps{
                    sh '''
                    docker rmi mtkg/lbg-python-sprint2:latest
                    docker rmi mtkg/lbg-python-sprint2:v$BUILD_NUMBER
                    docker rmi gcr.io/lbg-mea-14/mk-lbg-python-sprint2:latest
                    docker rmi gcr.io/lbg-mea-14/mk-lbg-python-sprint2:v$BUILD_NUMBER
                    '''
                }
            }
            stage('Run the app'){
                steps{
                    sh '''
                    #SSH onto app server as jenkins user:
                    #ssh -i "~/.ssh/id_rsa_new_vm" jenkins@10.154.0.27 << EOF

                    #Pull latest images from DockerHub:
                    docker image pull mtkg/lbg-python-sprint2:latest

                    #Create network if it doesn't already exist:
                    docker network inspect sprint2 && sleep 1 || docker network create sprint2

                    #Stop and remove existing containers:
                    docker stop lbg && (docker rm lbg) || (docker rm lbg && sleep 1 || sleep 1)

                    #Run containers from images:
                    #export PORT=9000
                    #docker run -d -p 80:${PORT} -e PORT=${PORT} --network sprint2 --name lbg mtkg/lbg-python-sprint2:latest
                    docker run -d -p 80:8080 --network sprint2 --name lbg mtkg/lbg-python-sprint2:latest
                    '''
                }
            }
            stage('Run tests here'){
                steps{
                    sh '''
                    echo "no testing expected"
                    #python lbg.test.py
                    #NEED TO INSTALL PYTHON & CHROMIUM ON SERVERS TO GET THIS TO WORK...
                    #PHYTHON & PYTHON3 INSTALLED ON BOTH JENKINS & APP SERVER
                    #CHROMIUM INSTALLED ON JENKINS SERVER
                    #NO SPACE LEFT ON APP SERVER FOR CHROMIUM!!
                    #Deleted images from app server and installed chromium, but now can't SSH to server...
                    #Comment to trigger build - 3
                    '''
                }
            }
        }
}

// TO DO:
// Add build verions
// Add yaml files
// Add branching if/else