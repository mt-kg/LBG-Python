pipeline{
        agent any
        stages{
            stage('Build images on Jenkins'){
                steps{
                    sh '''
                    docker build -t mtkg/lbg-python-sprint2:latest .
                    '''
                }
            }
            stage('Push images to Docker Hub'){
                steps{
                    sh '''
                    docker push mtkg/lbg-python-sprint2:latest
                    '''
                }
            }
            stage('Clean up old images on Jenkins'){
                steps{
                    sh '''
                    docker rmi mtkg/lbg-python-sprint2:latest
                    '''
                }
            }
            stage('Deploy containers to app server'){
                steps{
                    sh '''
                    #SSH onto app server as jenkins user:
                    ssh -i "~/.ssh/id_rsa_new_vm" jenkins@10.154.0.27 << EOF

                    #Pull latest images from DockerHub:
                    docker image pull mtkg/lbg-python-sprint2:latest

                    #Create network if it doesn't already exist:
                    docker network inspect sprint2 && sleep 1 || docker network create sprint2

                    #Stop and remove existing containers:
                    docker stop lbg && (docker rm lbg) || (docker rm lbg && sleep 1 || sleep 1)

                    #Run containers from images:
                    #export PORT=9000
                    #docker run -d -p 80:${PORT} -e PORT=${PORT} --network sprint2 --name lbg mtkg/lbg-python-sprint2:latest
                    docker run -d -p 81:8080 --network sprint2 --name lbg mtkg/lbg-python-sprint2:latest
                    '''
                }
            }
            stage('Run tests here'){
                steps{
                    sh '''
                    echo 'run tests will be here'
                    '''
                }
            }
        }
}