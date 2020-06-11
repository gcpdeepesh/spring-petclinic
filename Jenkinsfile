node {
  stage('SCM checkout') {
    git 'https://github.com/gcpdeepesh/spring-petclinic.git'
  }

  stage('Test') {
    def mvnHome = tool name:'M2_HOME', type: 'maven'
    def mvnCMD = "${mvnHome}/bin/mvn"
    sh "${mvnCMD} clean test"
  }

  stage('Compile and Package') {
    def mvnHome = tool name:'M2_HOME', type: 'maven'
    def mvnCMD = "${mvnHome}/bin/mvn"
    sh "${mvnCMD} clean package"
  }

  stage('login to dockerhub') {
    withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubpwd')]) {
      sh 'docker login -u deepeshukla -p ${dockerhubpwd}'
    }
  }
 
  stage('Build docker images') {
    sh 'docker build . -t deepeshukla/spring-petclinic-container:0.1'
  }


  stage('Push images to dockerhub') {
    sh 'docker push deepeshukla/spring-petclinic-container:0.1'
  }

  stage('Deploy') {
    sh 'kubectl apply -R -f ./k8s'
  }
}
