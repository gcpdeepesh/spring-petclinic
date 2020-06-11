node {
  stage('SCM checkout') {
    git 'https://github.com/gcpdeepesh/spring-petclinic.git'
  }

  stage('test') {
    def mvnHome = tool name:'M2_HOME', type: 'maven'
    def mvnCMD = "${mvnHome}/bin/mvn"
    sh "${mvnCMD} clean test"
  }

  stage('compile and package') {
    def mvnHome = tool name:'M3', type: 'maven'
    def mvnCMD = "${mvnHome}/bin/mvn"
    sh "${mvnCMD} clean package"
  }

  stage('Build docker images') {
    sh 'docker-compose build'
  }

  stage('login to dockerhub') {
    withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubpwd')]) {
      sh 'docker login -u deepeshukla -p ${dockerhubpwd}'
    }
  }

  stage('Push images to dockerhub') {
    sh 'docker-compose push'
  }

  stage('deploy') {
    sh 'kubectl apply -R -f ./k8s'
  }
}
