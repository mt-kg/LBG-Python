pipeline{
        agent any
        stages{
            stage('Run build script from Jenkins server'){
                steps{
                    sh '''
                    ./bashbuildscript.sh
                    '''
                }
            }
            stage('Run tests'){
                steps{
                    sh '''
                    echo 'run tests here'
                    '''
                }
            }
        }
}