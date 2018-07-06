pipeline {
  agent any
  stages {
    stage('cleanupWorkspac') {
      steps {
        sh 'echo "remove angular-seed and app dir if exist"'
      }
    }
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
