pipeline {
  agent any
  stages {
    stage('buildTheBuilder') {
      steps {
        git 'https://github.com/angular/angular-seed'
        sh 'echo "cmd: docker build -t build-img -f Dockerfile.build"'
      }
    }
    stage('createBuilderContainer') {
      steps {
        sh 'echo "cmd: docker create --name build-cont build-img"'
      }
    }
    stage('collectRuntimeArtfacts') {
      steps {
        sh 'echo "cmd: docker cp build-cont:<path/to/app> ./target/app"'
      }
    }
    stage('buildServiceImg') {
      steps {
        sh 'echo "cmd:docker build ."'
      }
    }
  }
}