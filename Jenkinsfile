pipeline {
  agent any
  stages {
    stage('SCM Checkout (Fetch)') {
      steps {
        git(url: 'https://github.com/gcpdeepesh/spring-petclinic.git', branch: 'master', poll: true)
      }
    }

  }
}