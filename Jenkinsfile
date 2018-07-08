pipeline {
  agent any
  stages {
    stage('cleanupWorkspac') {
      steps {
        sh 'bash build.sh tidyUp '
      }
    }
    stage('getAngularSeedCodes') {
      steps {
        sh 'bash build.sh getAngularSeedCodes'
      }
    }
    stage('buildBuilder') {
      steps {
        sh 'bash build.sh buildBuilderImg'
      }
    }
    stage('createBuilderContainer') {
      steps {
        sh 'bash build.sh buildBuilderImg'
      }
    }
    stage('collectRuntimeArtfacts') {
      steps {
        sh 'bash build.sh getAppFromBuilderImg'
      }
    }
    stage('buildServiceImg') {
      steps {
        sh 'bash build.sh buildApp'
      }
    }
  }
  environment {
    angular_seed_src_url = 'https://github.com/angular/angular-seed.git'
    seed_proj_dir = 'angular-seed'
    app_dir = 'app'
    build_img_name = 'build-img'
    build_cont_name = 'build-cont'
    app_img_name = 'angular-seed-app-img'
  }
}
