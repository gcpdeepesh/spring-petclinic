node {

  stage('login to dockerhub') {
    withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubpwd')]) {
      sh 'docker login -u deepeshukla -p ${dockerhubpwd}'
    }
  }
 
}
